import star_gate.star_gate.star_gate as sg

if __name__ == '__main__':
    cargo = sg.StarGate()
    cargo.read('../Seagate_basic/empiar-11998/Import/job001/movies.star')
    print(len(cargo.blocks['movies']['table']))

    count = 0
    for i in range(1,50):
        cargo = sg.StarGate()
        cargo.read('../Seagate_basic/empiar-11998/Select/job002/micrographs_split' + str(i) + '.star')
        count += (len(cargo.blocks['movies']['table']))
    print(count)