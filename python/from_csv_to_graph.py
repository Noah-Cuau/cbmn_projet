import graph
import csv, os, json, pickle
from graph_visualisation import find_node_from_data
from graph_to_json import remove_duplicate, look_for_relation, log_scale
JSON_FILENAME = 'sankey_movie_test2.json'
JSON_POS_FILENAME = 'sankey_movie_pos_test2.json'
PATH = '../../mirrored_sankey'
FILE_NAME = 'sankey.csv'
MOVIE_TEST1 = 'MotionCorr/job006/data/TAP_A2_136-1_006_Sep27_03_51_43_X-1Y-1-0.mrc'
MOVIE_TEST2 = 'MotionCorr/job006/data/TAP_A2_128-167_016_Sep26_19_08_07_X-2Y-2-0.mrc'
MOVIE_TEST3 = 'MotionCorr/job006/data/TAP_A2_146-83_001_Sep27_18_01_51_X-2Y-2-0.mrc'
if os.path.exists('save_graph_pipeline'):
    print('yes')
    file = open('save_graph_pipeline','rb')
    graph_pipeline =pickle.load(file)
    file.close()
else:
    from star_to_graph import read_starfile
    graph_pipeline = read_starfile('default_pipeline.star')
    with open('save_graph_pipeline', 'wb') as file:
        pickle.dump(graph_pipeline, file)
    file.close()

class Graph_sankey:
    def __init__(self,job_name, csv_data):
        self.name = job_name
        self.movies = []
        self.particle_per_movie = dict()
        self.particle_amount = 0
        self.shared_movies = dict()
        self.children = []
        for row in csv_data:
            self.particle_per_movie[row[1]] = int(row[0])
            self.movies.append(row[1])
            self.particle_amount += int(row[0])

    def __str__(self):
        pass

def get_path_csv_file():
    csvfile_path_dict = dict()
    for typejob in os.listdir(PATH):
        if not os.path.isfile(PATH + '/' + typejob):
            for job_dir in os.listdir(PATH + '/' + typejob):
                if os.path.exists(PATH + '/' + typejob + '/' + job_dir + '/' + FILE_NAME):
                    csvfile_path_dict[typejob + '/' + job_dir + '/'] = PATH + '/' + typejob + '/' + job_dir + '/' + FILE_NAME
    return csvfile_path_dict

def read_csv_file(path):
    
    file = open(path, 'r')
    return list(csv.reader(file, delimiter=','))


def to_run1():
    csv_file_dict = get_path_csv_file()
    graph_dico = dict()
    for job, path in csv_file_dict.items():
        new_node = Graph_sankey(job, read_csv_file(path))
        graph_dico[job] = new_node
    job_list = list(csv_file_dict.keys())
    ordered_job_list = sorted(job_list, key = lambda a : int(a[-4:-1]))
    for i, job_name in enumerate(ordered_job_list):
        print(str(i+1) + '/' + str(len(ordered_job_list)))
        current_node = graph_dico[job_name]
        for movie in current_node.movies:
            for job_name_2, node in graph_dico.items():
                if movie in node.movies:
                    if not job_name_2 in current_node.shared_movies.keys():
                        current_node.shared_movies[job_name_2] = [movie]
                    else:
                        current_node.shared_movies[job_name_2].append(movie)
    with open('data_sankey1', 'wb') as f1:
        pickle.dump(graph_dico, f1)

def retrace_movie_pipeline(movie_name, sankey_graph_dico, graph_pipeline, start_job = False):
    ordered_jobs = get_ordered_job_list(sankey_graph_dico)
    
    if not start_job:
        for job_name in ordered_jobs:
            node = graph_dico[job_name]
            if movie_name in node.movies:
                current_node = node
                break
    else:
        current_node = sankey_graph_dico[start_job]
    print('First : ' + current_node.name + ' : '  + str(current_node.particle_per_movie[movie_name]) )
    for children_name in look_for_relation(find_node_from_data(graph_pipeline, current_node.name), ordered_jobs):
        if not children_name == None and movie_name in sankey_graph_dico[children_name].movies:
            
            retrace_movie_pipeline_rec(current_node,movie_name, sankey_graph_dico, graph_pipeline)
            

def retrace_movie_pipeline_rec(sankey_node, movie_name, sankey_graph_dico, graph_pipeline):
    ordered_jobs = get_ordered_job_list(sankey_graph_dico)
    
    print(sankey_node.name + ' : ' + str(sankey_node.particle_per_movie[movie_name]))
    for children_name in look_for_relation(find_node_from_data(graph_pipeline, sankey_node.name), ordered_jobs):
        if not children_name == None and movie_name in sankey_graph_dico[children_name].movies:
            
            retrace_movie_pipeline_rec(sankey_graph_dico[children_name],movie_name, sankey_graph_dico, graph_pipeline)

def retrace_movie_pipeline_from_leave(job_name, movie, sankey_graph_dico, subgraph):
    try:
        sankey_node = sankey_graph_dico[job_name]
        if movie in sankey_node.movies:
            result = [{job_name : sankey_node.particle_per_movie[movie]}]
            for parent in subgraph['adj_dict'][job_name]:
                result += retrace_movie_pipeline_from_leave(parent.data, movie, sankey_graph_dico, subgraph)
            return result
        else:
            return [{job_name : 0}]
    except:
        result = [{job_name : 'NaN'}]
        for parent in subgraph['adj_dict'][job_name]:
                result += retrace_movie_pipeline_from_leave(parent.data, movie, sankey_graph_dico, subgraph)
        return result



    
    
def get_ordered_job_list(sankey_graph_dico):
    job_list = list(sankey_graph_dico.keys())
    
    ordered_job_list = sorted(job_list, key = lambda a : int(a[-4:-1]))
   
    return ordered_job_list

def find_path_to_root(node, subgraph_dict, depth = 0, done = []):
    done.append(node.data) 
    if not node.data[:10] == 'MotionCorr':
        depth += 1
        parents = node.get_parents()
        i = 0
        nb_parent = len(parents)
        subgraph_dict['nodes'].append(node.data)
        if not node.data in subgraph_dict['adj_dict'].keys():
            subgraph_dict['adj_dict'][node.data] = []
        
        for parent in parents:
            subgraph_dict['adj_dict'][node.data].append(parent)
            if not parent.data == 'imaginary' and not parent.data in done:
                
                
                find_path_to_root(parent, subgraph_dict, depth, done)
        return subgraph_dict
    else:
        subgraph_dict['nodes'].append(node.data)
        
        subgraph_dict['adj_dict'][node.data] = []


def json_leave_subgraph_for_1_movie(job_name, movie, pipeline_graph):
    
    file = open('data_sankey1','rb')
    graph_dico =pickle.load(file)
    subgraph_dico = {'nodes' : list(), 'adj_dict' : dict()}
    subgraph_dico  = find_path_to_root(find_node_from_data(graph_pipeline, job_name ), subgraph_dico )
    remove_duplicate(subgraph_dico['nodes'])
    subgraph_movie_dico = retrace_movie_pipeline_from_leave(job_name, movie, graph_dico, subgraph_dico)
    json_dict = {'links' : list(), 'nodes' : list()}
    i = 0
    index_by_name = dict()
    max_particle = 0
    done = []
    for job in subgraph_movie_dico:
        job_name2 = list(job.keys())[0]
        if not job_name2 in done:
            done.append(job_name2)
            nb_particle = job[job_name2]
            if type(nb_particle) == int:
                if nb_particle > max_particle:
                    max_particle = nb_particle
            json_dict['nodes'].append({'node' : i, 
                                    'name' : job_name2, 
                                    'colortype' :0}
                
        )
        index_by_name[job_name2] = i
        i+=1

    
    for job_name3, parents in subgraph_dico['adj_dict'].items():
        value = 1
        for row in subgraph_movie_dico:
            if list(row.keys())[0] == job_name3:
                value = row[job_name3]
        scale = lambda a : log_scale(a, max_particle) if type(a)==int  else 5  
        value = scale(value)      
        for node in parents:
            if job_name3 == 'Refine3D/job098/':
                print(node)
            json_dict['links'].append({'source' : node.data, 
                                   'target' : job_name3,
                                   'value' : value,
                                   })
        json_object = json.dumps(json_dict, indent=0)
        write_manual_layout(list(subgraph_dico['adj_dict'].keys()), pipeline_graph)
        if os.path.exists(JSON_FILENAME):
            os.remove(JSON_FILENAME)
        with open(JSON_FILENAME, "w") as outfile:
            outfile.write(json_object)
        
def write_manual_layout(node_list, pipeline_graph):
    rank_list = []
    for node_name in node_list:
        node = find_node_from_data(graph_pipeline, node_name)
     
        rank = node.rank
        rank_list.append([node_name, rank])
    json_object = json.dumps(rank_list, indent=0)
    if os.path.exists(JSON_POS_FILENAME):
            os.remove(JSON_POS_FILENAME)
    with open(JSON_POS_FILENAME, "w") as outfile:
            outfile.write(json_object)
    



if __name__ =='__main__':
    json_leave_subgraph_for_1_movie('Refine3D/job098/', MOVIE_TEST1, graph_pipeline)
    
    
    
    pass