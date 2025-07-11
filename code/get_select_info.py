import star_gate.star_gate.star_gate as sg
import os
JOBS_DIR_PATH = '../../Seagate_basic/empiar-11998/'
SELECT_DIR_PATH = '../../Seagate_basic/empiar-11998/Select/' 
FILENAME = 'particles.star'
job_select_dir = os.listdir(SELECT_DIR_PATH)
 
# cargo = sg.StarGate()
# for file_name in job_select_dir:
#     try:
#         cargo.read(SELECT_DIR_PATH + file_name + '/' + FILENAME)
#         nb_particle = len(cargo.blocks['particles']['table'])
#         print(file_name + ' : ' + str(nb_particle) + ' particles')
#     except:
#         print(print(file_name + ' : ' + 'no_infos'))

def count_line(filename):
    with open(filename, 'r') as fp:
        for count, line in enumerate(fp):
            pass
    return count + 1

def get_list_file_with_particle(directory):
    FILENAME = 'particles.star'
    DIR = os.listdir(directory)
    result = []
    for dir in DIR:
        try:
            for job_dir in os.listdir(directory + dir):
                path = directory + dir + '/' + job_dir + '/' + FILENAME
                if os.path.exists(path):
                    result.append(path)
        except:
            pass
    return result

def get_amount_particule(job_select_list):
    particule_per_job = dict()
    for file_name in job_select_list:
        file = file_name
        if os.path.exists(file):
            amount = count_line(file)-51
            if amount > 0:
                particule_per_job[file_name] = amount
    return particule_per_job
job_w_particle = get_list_file_with_particle(JOBS_DIR_PATH)

if __name__ == '__main__':
    jobs = get_list_file_with_particle(JOBS_DIR_PATH)
    job_list = get_amount_particule(jobs)
    for job_name, amount in job_list.items():
        print(job_name + ' : ' + str(amount) + ' particles')

