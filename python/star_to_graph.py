import os
import sys
import star_gate.star_gate.star_gate as sg

import graph

def read_starfile(filename):
    
    cargo = sg.StarGate()
    cargo.read(filename)

    jobs = cargo.blocks['pipeline_processes']['table']
    jobs_dict = dict()
    first_job_name = False
    roots_list = []
    for i in range(len(jobs)):
        job_name = jobs.iloc[i].rlnPipeLineProcessName
        if not first_job_name:
            first_job_name = job_name
        jobs_dict[job_name] = {'input' : [], 'output' : []}

    input_edge = cargo.blocks['pipeline_input_edges']['table']
    output_edge = cargo.blocks['pipeline_output_edges']['table']

    for i in range(len(input_edge)):
        job_name = input_edge.iloc[i].rlnPipeLineEdgeProcess
        jobs_dict[job_name]['input'].append(input_edge.iloc[i].rlnPipeLineEdgeFromNode)

    for i in range(len(output_edge)):
        job_name = output_edge.iloc[i].rlnPipeLineEdgeProcess
        jobs_dict[job_name]['output'].append(output_edge.iloc[i].rlnPipeLineEdgeToNode)

    node_dict = dict()
    for job_name in jobs_dict.keys():
        new_node = graph.Node(job_name)
        node_dict[job_name] = new_node
    for job, edge in jobs_dict.items():
        if len(edge['input']) == 0:
            roots_list.append(job)
        for job_2, edge_2 in jobs_dict.items():
            if job == job_2:
                pass
            else:
                for output_file in edge['output']:
                    if output_file in edge_2['input']:
                        node_dict[job].add_child(node_dict[job_2])
                        

    minus_root = graph.Node('imaginary')
    for key, node in node_dict.items():
        if len(node.get_parents()) == 0:
            minus_root.add_child(node)
    node_dict['imaginary'] = minus_root

    
    setting_ranks(minus_root)
    
    return node_dict['imaginary']

def setting_ranks(node):
    if len(node.get_parents()) == 0:
        node.set_rank(0)
   
    for child in node.get_children():
        if child.rank is None:
        
            child.set_rank(node.rank+1)
        else:
            child.set_rank(max(node.rank + 1, child.rank))
    for child in node.get_children():
        setting_ranks(child)

if __name__ == '__main__':
    graph_test = read_starfile('default_pipeline.star')
    print(graph_test)

