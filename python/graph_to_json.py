from star_to_graph import *
from math import log, floor, exp
import os
import json
add_result_node = True
JSON_FILENAME = 'sankey3.json'
FILENAME = 'default_pipeline.star'
DIR = '../../Seagate_basic/empiar-11998/' 
log_scale_params = {
    'upper_bound' : 30,
    'coef' :  0.005
}
exp_scale_params = {
    'upper_bound' : 30,
    'coef' :  0.5
}
linear_scale_coef = 20
def log_scale(nb_particle, max_particle):
    if nb_particle is not None:
        return int(log(nb_particle*log_scale_params['coef']+1)*(1/(log(max_particle*log_scale_params['coef']+1)))* log_scale_params['upper_bound'])
    else:
        return 1
    
def linear_scale(nb_particle, max_particle):
    if nb_particle is not None:
        return floor((linear_scale_coef*nb_particle)/max_particle)+1
    else:
        return 1
    
    
def exp_scale(nb_particle, max_particle):
    if nb_particle is not None:
        return int(exp(nb_particle*exp_scale_params['coef']+1)*(1/(exp(max_particle*exp_scale_params['coef']+1)))* exp_scale_params['upper_bound'])
    else:
        return 1

scale = exp_scale
graph, graph_dico = read_starfile( DIR + FILENAME , True)

sankey_node_dict = dict()
max_particle = 0
for key, node in graph_dico.items():
    if key[:6] == 'Select'  or key[:7] == 'Extract':
        sankey_node_dict[key] = node
        if hasattr(node, 'nb_particle'):
            if node.nb_particle > max_particle:
                max_particle = node.nb_particle
sankey_node_list = list(sankey_node_dict.values())


def look_for_relation_rec(node, node_list):
    if node.data in node_list:
        return [node.data]
    child_list = node.get_children()
    if len(child_list) == 0:
        return []
    else:
        result = []
        for child in child_list:
            new = look_for_relation_rec(child, node_list)
            if not new in result: 
                result += new 
        return result
    
def look_for_relation(node, node_list):
    children_list = node.get_children()
    if len(children_list) == 0:
        return []
    else:
        result = []
        for child in children_list :
            new = look_for_relation_rec(child, node_list)
            if not new in result: 
                result += new 
        return result
    
def find_leave_descendant(node):
    children = node.get_children()
    if len(children) == 0:
        return [node]
    result = []
    for child in children:
        result += find_leave_descendant(child)
    return result

sankey_node_list_data = []
for node in sankey_node_list:
    sankey_node_list_data.append(node.data)
sankey_node_relation_dict = dict()
for node in sankey_node_list:
    sankey_node_relation_dict[node.data] = look_for_relation(node, sankey_node_list_data)
sankey_leave_list = []
for key,value in sankey_node_relation_dict.items():
    if len(value) == 0:
        sankey_leave_list.append(key)
list_to_remove = []
for leave in sankey_leave_list:
    to_remove = True
    for relation in sankey_node_relation_dict.values():
        if leave in relation:
                to_remove = False
    if to_remove:
         list_to_remove.append(leave)
    elif add_result_node:
        print('\n')
        print(leave + ' : ', end=' ')
        for children in find_leave_descendant(graph_dico[leave]):
        #for children in graph_dico[leave].get_children():
            if not children.data == leave:
                print(children.data, end= ' ')
                sankey_node_list.append(children.data)
                sankey_node_dict[children.data] = children
                sankey_node_relation_dict[children.data] = list()
                sankey_node_relation_dict[leave].append(children.data)


json_dict = dict()
json_dict['nodes'] = list()
index_by_name = dict()
i = 0
index_colortype = list()

for key in sankey_node_relation_dict.keys():
    if not key in list_to_remove:
        if not key[:3] in index_colortype:
            index_colortype.append(key[:3])

        json_dict['nodes'].append({'node' : i, 'name' : key, 'colortype' : index_colortype.index(key[:3]) })
        index_by_name[key] = i
        i+=1
json_dict['links'] = list()
def remove_duplicate(tab):
    for i, value in enumerate(tab):
        for k, value_2 in enumerate(tab):
            if not i==k and value == value_2:
                tab.pop(k)
for key, value in sankey_node_relation_dict.items():
    remove_duplicate(value)
    if not key in list_to_remove :
        for node_name in value:
            node = graph_dico[key]
            if hasattr(node, 'nb_particle'):
                nb_particle = graph_dico[key].nb_particle


                
            json_dict['links'].append({'source' : index_by_name[key], 
                                   'target' : index_by_name[node_name],
                                   'value' : scale(nb_particle, max_particle),
                                   'nb_particle' : nb_particle})
    
json_object = json.dumps(json_dict, indent = 0)
if os.path.exists(JSON_FILENAME):
    os.remove(JSON_FILENAME)
with open(JSON_FILENAME, "w") as outfile:
    outfile.write(json_object)
