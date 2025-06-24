from pyvis.network import Network
from matplotlib import colormaps
import matplotlib.colors
color_map = colormaps['plasma'].colors
color_max = len(color_map)
from star_to_graph import read_starfile
import networkx as nx
FILENAME = 'default_pipeline.star'
PHYSICS = False
graph = read_starfile(FILENAME)
nx_graph = nx.graph.Graph()
done = []
pos_dict = dict()
rank_dict = dict()
list_pos_taken = []

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
    node_list = get_list_of_node(graph)

    for node in nt_graph.node_list():
        if not node == 'imaginary':
            if find_node_from_data(graph, node).get_children() == []:
                leave_list.append(node)
    # print(leave_list)
    for leave in leave_list:
        nt_graph.add_node(leave)
        print(find_node_from_data(graph, leave).data)
        #find_path_to_root(find_node_from_data(graph, leave), nt_graph)

        

def find_path_to_root(node, nt_graph):
    print(parents)
    parents = node.get_parents()
    for parent in parents:
            
            nt_graph.add_node(parents)
            nt_graph.add_edge(parents, node.data)
    for parent in parents:
        find_path_to_root(parent, nt_graph)







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
    nt = Network('100%', '100%', directed = True)
    nt.toggle_drag_nodes(True)
    nt.toggle_physics(True)
    nt.toggle_stabilization(False)

    make_list_of_subgraph(nt, graph)

    nt.show('graph.html')

if __name__ == '__main__':
    to_run()
    pass
    #print('ha', len(get_list_of_node(graph)))

    
    #print(find_node_from_data(graph, 'ManualPick/job070/').data)
