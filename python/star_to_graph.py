import os
import sys
import star_gate.star_gate.star_gate as sg
from get_select_info import get_amount_particule, job_w_particle

import graph

def read_starfile(filename):
    
    cargo = sg.StarGate()
    cargo.read(filename)
    particle_per_select = get_amount_particule(job_w_particle)
    max_particle = 0
    for value in particle_per_select.values():
        if value > max_particle:
            max_particle = value
    key_list = list(particle_per_select.keys())
    for key in key_list:
        value = particle_per_select.pop(key)
        new_key = key.replace('/particles.star', '')
        new_key = new_key[-6:]
        particle_per_select.update({new_key : value})
    print(particle_per_select)
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
    node_select_list = []
    for job_name in jobs_dict.keys():
        new_node = graph.Node(job_name)

        if job_name[-7:][:-1] in particle_per_select.keys():
            new_node.nb_particle = particle_per_select[job_name[-7:][:-1]]
            print(job_name)
            node_select_list.append(new_node)
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
    max_particle = 0
    for node_select in node_select_list:
        if node_select.nb_particle > max_particle:
            max_particle = node_select.nb_particle
    

    minus_root = graph.Node('imaginary')
    
    for key, node in node_dict.items():
        if len(node.get_parents()) == 0:
            minus_root.add_child(node)
        
    node_dict['imaginary'] = minus_root
    minus_root.max_particle = max_particle
    for node_select in node_select_list:
        set_particles_flux(node_select, node_select.nb_particle, max_particle)
    leave_without_part = []
    for key, node in node_dict.items():
        if len(node.get_children()) == 0 and not hasattr(node, 'nb_particle'):
            leave_without_part.append(node)

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

def set_particles_flux(node, nb_particle, particle_max):
    if  hasattr(node, 'nb_particle'):
        if node.nb_particle > nb_particle:
            node.nb_particle = nb_particle
    else:
         node.nb_particle = nb_particle  
    for child in node.get_children():
        set_particles_flux(child, nb_particle, particle_max)

if __name__ == '__main__':
    graph_test = read_starfile('default_pipeline.star')
    print(graph_test)


