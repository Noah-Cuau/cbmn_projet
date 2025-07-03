from pyvis.network import Network
from matplotlib import colormaps
from math import log
import matplotlib.colors
color_map = colormaps['plasma'].colors
color_max = len(color_map)
from star_to_graph import read_starfile
import get_select_info
import networkx as nx
FILENAME = 'default_pipeline.star'
PHYSICS = False
UNIT = 500
graph = read_starfile(FILENAME)
nx_graph = nx.graph.Graph()
done = []
pos_dict = dict()
rank_dict = dict()
list_pos_taken = []


class Sub_graph_nt:
    def __init__(self, nb, start_node):
        self.start_node = start_node
        self.nb = nb
        self.list_node = []
        self.list_node_id = []
        self.taken_pos = []
        self.max_x = 0
        self.relativ_pos_node = dict()
        self.add_node(start_node)
        
        
    def add_node(self, node_nt):
        if not node_nt['id'] in self.relativ_pos_node.keys():

            self.list_node.append(node_nt)
            self.relativ_pos_node[node_nt['id']] = (node_nt['x'] -  self.start_node['x'], node_nt['y'] -  self.start_node['y'])
            if node_nt['x'] -  self.start_node['x'] > self.max_x :
                self.max_x =  node_nt['x'] -  self.start_node['x']
    def change_graph_start_pos(self, new_pos, nt_graph):
        for node in self.list_node:
            for i, node_nt in enumerate(nt_graph.nodes):
                if node_nt['id'] == node['id']:
                    node_index = i
            y_change = 0
            new_pos_ = (
                self.relativ_pos_node[node['id']][0] + new_pos[0] ,
                self.relativ_pos_node[node['id']][1] + new_pos[1]
            )
            while new_pos_ in self.taken_pos:
                if y_change > 0:
                    y_change = y_change *-1
                else:
                    y_change = (y_change*-1) + UNIT/2
   
                new_pos_ = (
                self.relativ_pos_node[node['id']][0] + new_pos[0] ,
                self.relativ_pos_node[node['id']][1] + new_pos[1] + y_change)

            nt_graph.nodes[node_index]['x'] = new_pos_[0]
            nt_graph.nodes[node_index]['y'] = new_pos_[1]
            self.taken_pos.append(new_pos_)
        
        # nt.nodes[node_index]['color'] = matplotlib.colors.to_hex(color_map[int((pos[1]*color_max)/rank_max)-1])

def get_nx_node(id, nt_graph):
    for i, node_nt in enumerate(nt_graph.nodes):
                if node_nt['id'] == id:
                    return node_nt

def get_list_of_node_rec(node):
    node_list = [node.data]
    for child in node.get_children():
        if not child.data in node_list:
            node_list.extend(get_list_of_node_rec(child))    
    return node_list

def get_list_of_node(node):
    list_of_node = get_list_of_node_rec(node)
    duplicate = dict()
    for node_data in list_of_node:
        if not node in duplicate.keys():
            duplicate[node_data] = 1
        else:
            duplicate[node_data] += 1
    for key, item in duplicate.items():
        for _ in range(item-1):
            list_of_node.remove(key)
    return list_of_node

def get_longest_branch(graph):
    if len(graph.get_children()) == 0:
        return (graph.get_rank(), [graph.data])
    else:
        liste = []
        for child in graph.get_children():
            liste.append(get_longest_branch(child))
        max = 0
        i_max = 0
        for i, item in enumerate(liste):
            if item[0] > max:
                max = item[0]
                i_max = i
        return (liste[i_max][0], liste[i_max][1] + [graph.data])
def get_nb_node(nt_graph, n_subgraph):
    ajd_matrix = nt_graph.get_adj_list()
    nb = 0
    for key in ajd_matrix.keys():
        try:
            if int(key[-2:]) == n_subgraph:
                nb += 1
        except:
            if int(key[-1:]) == n_subgraph:
                nb += 1
    return nb

def find_node_from_data(graph, data):
    if not graph.data == data and graph.get_children() == []:
        return False
    if graph.data == data:
        return graph
    for child in graph.get_children():
        result = find_node_from_data(child, data)
        if result is not False:
            return result
    return False
         
def convert_graph(nx_graph, graph,pos_cursor = (0,0), longest_path = [], done = []):
    if longest_path == []:
        longest_path = get_longest_branch(graph)[1]
    data = graph.data
    done.append(data)
    nx_graph.add_node(
        data, 
        title = data,
        physics = PHYSICS
        )
    y_change = 300
    if graph.data in longest_path:
        new_pos = (graph.get_rank()*300, 0)
    
    else:
        new_pos = (graph.get_rank()*300, y_change)
        while new_pos in list_pos_taken:
            y_change += 300
            new_pos = (new_pos[0], y_change)
    
    pos_dict[graph.data] = (new_pos, graph.get_rank())
    list_pos_taken.append(new_pos)

    node_to_do = []
    for node in graph.get_children():
        
        if not node.data in done :   
            convert_graph(nx_graph, node,(pos_cursor[0]+300, pos_cursor[1]+y_change),longest_path, done)
        if not node.data == data:
            
            nx_graph.add_edge(u_of_edge = data, v_of_edge = node.data )
             
def custom_from_nx(nt_graph, pos_dict, graph):
    edges = [] 
    for key, item in pos_dict.items():
        if key != 'imaginary':
            node = find_node_from_data(graph, key)
            parent_data_list = []
            for parent in node.get_parents():
                parent_data_list.append(parent.data)
            if 'imaginary' in parent_data_list:
                nt_graph.add_node(key, key, title = key, shape = 'diamond', size = 65)
            elif node.get_children() == []:
                nt_graph.add_node(key, key, title = key, shape = 'square', size = 40)
            else:
                nt_graph.add_node(key, key, title = key, shape = 'dot', size = 30)
            for child in node.get_children():
                edges.append((key, child.data, {}, 'dot'))

    if len(edges) > 0:
        for e in edges:
                nt_graph.add_node(e[0], e[0], title=e[0])
                nt_graph.add_node(e[1], e[1], title=e[1])
                nt_graph.add_edge(e[1], e[0])

def make_list_of_subgraph(nt_graph, graph):
    
    leave_list = []
    sub_graph_obj_list = dict()
    node_list = get_list_of_node(graph)
    
    for node in node_list:
        if not node == 'imaginary':
            if find_node_from_data(graph, node).get_children() == []:
                leave_list.append(node)
        else:
            max_particle = find_node_from_data(graph, node).max_particle
    nb_graph = 0
    for leave in leave_list:
        
        nt_graph.add_node( leave+str(nb_graph), shape = 'diamond', x =0, y =nb_graph * UNIT, color = matplotlib.colors.to_hex(color_map[0]), label = leave)
        sub_graph_obj_list[nb_graph] = Sub_graph_nt(nb_graph,get_nx_node(leave+str(nb_graph), nt_graph))
        find_path_to_root(find_node_from_data(graph, leave), nt_graph, nb_graph, sub_graph_obj_list[nb_graph])
        nb_graph +=1

    nb_node_per_graph = []
    for i in sub_graph_obj_list.keys():
        nb_node_per_graph.append((sub_graph_obj_list[i].max_x, sub_graph_obj_list[i]))
    nb_node_per_graph = sorted(nb_node_per_graph, key = lambda a : a[0])
    

    for i, sub_graph in enumerate(nb_node_per_graph):
        pass
        sub_graph[1].change_graph_start_pos((0, i*UNIT*2), nt_graph)
    id = nt_graph.nodes.index(get_nx_node('imaginary0', nt_graph))
    nt_graph.nodes.pop(id)
    #scale_size_edges(nt_graph, max_particle)


def find_path_to_root(node, nt_graph, nb_sub_graph,  sub_graph, depth = 0, done = []):

        depth += 1
        parents = node.get_parents()
        i = 0
        nb_parent = len(parents)
        y_modif = lambda a : int(UNIT/2 + ((UNIT/nb_parent)*(a)))
        for parent in parents:
            if not parent.data == 'imaginary' or not parent.data in done:
                done.append(parent.data) 
                nt_graph.add_node(parent.data+str(nb_sub_graph), x = depth * 200, 
                y = (nb_sub_graph-1) * UNIT + y_modif(i), 
                color = matplotlib.colors.to_hex(color_map[depth*15]),
                label = parent.data)
                nt_graph.add_edge(to = parent.data+str(nb_sub_graph), source = node.data+str(nb_sub_graph)  )            
                i +=1
                sub_graph.add_node(get_nx_node(parent.data+str(nb_sub_graph), nt_graph))
        for parent in parents:
            find_path_to_root(parent, nt_graph, nb_sub_graph,sub_graph, depth, done )
        
def scale_size_edges(nt_graph, max_particule):
    for i_edge, edge in enumerate(nt_graph.edges):
        node_name = edge['to']
        try:
            if node_name[-2] == '/':
                nb_particle = find_node_from_data(graph, node_name[:-1]).nb_particle
            else:
                nb_particle = find_node_from_data(graph, node_name[:-2]).nb_particle
        except:
            nb_particle = 1
        new_width = int(log(nb_particle*30+1)*(1/(log(max_particule*30+1)))* 10) 
        nt_graph.edges[i_edge]['width'] = new_width
        nt_graph.edges[i_edge]['title'] = str(nb_particle)







# convert_graph(nx_graph, graph)
# nt = Network('100%', '100%', directed = True)
# nt.toggle_drag_nodes(True)
# nt.toggle_physics(True)
# nt.toggle_stabilization(False)
# custom_from_nx(nt, pos_dict, graph)
# nt.barnes_hut()
# rank_max = get_longest_branch(graph)[0]
# make_list_of_subgraph(nt, graph)



# for node_id, pos in pos_dict.items():
#     if node_id == 'imaginary':
#         pass
#     else:
#         for i, node in enumerate(nt.nodes):
#             if node['id'] == node_id:
                # node_index = i
        # nt.nodes[node_index]['x'] = pos[0][0]
        # nt.nodes[node_index]['y'] = pos[0][1]
        # nt.nodes[node_index]['color'] = matplotlib.colors.to_hex(color_map[int((pos[1]*color_max)/rank_max)-1])


def to_run():
    nt = Network('100%', '100%', directed = True,)
    nt.toggle_drag_nodes(True)
    nt.toggle_physics(False)
    nt.toggle_stabilization(False)

    make_list_of_subgraph(nt, graph)
    
    nt.show('graph.html')

def to_run2():
    #convert_graph(nx_graph, graph)
    convert_graph(nx_graph, graph)

    nt = Network('100%', '100%', directed = True)
    nt.toggle_drag_nodes(True)
    nt.toggle_physics(True)
    nt.toggle_stabilization(False)
    custom_from_nx(nt, pos_dict, graph)
    print(nt.nodes)
    nt.barnes_hut()
    rank_max = get_longest_branch(graph)[0]



    for node_id, pos in pos_dict.items():
        if node_id == 'imaginary':
            pass
        else:
            for i, node in enumerate(nt.nodes):
                if node['id'] == node_id:
                    node_index = i
            #nt.nodes[node_index]['x'] = pos[0][0]
            #nt.nodes[node_index]['y'] = pos[0][1]
            nt.nodes[node_index]['color'] = matplotlib.colors.to_hex(color_map[int((pos[1]*color_max)/rank_max)-1])
    nt.show('general_graph.html')


if __name__ == '__main__':
    to_run()
    pass
    #print('ha', len(get_list_of_node(graph)))

    
    #print(find_node_from_data(graph, 'ManualPick/job070/').data)
