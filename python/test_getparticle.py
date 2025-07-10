import star_gate.star_gate.star_gate as sg
import os
JOB_DIR_PATH = '../../Seagate_basic/empiar-11998/' 
FILENAME = 'particles.star'
DIR = os.listdir(JOB_DIR_PATH)
result = []
for dir in DIR:
    try:
        for job_dir in os.listdir(JOB_DIR_PATH + dir):
            path = JOB_DIR_PATH + dir + '/' + job_dir + '/' + FILENAME
            if os.path.exists(path):
                result.append(dir +'/'+ job_dir)
    except:
        pass

print(result)