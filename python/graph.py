class Node:
    def __init__(self, data):
        self.children = []
        self.parents = []
        self.data = data
        self.rank = None
    def add_child(self, node):
        self.children.append(node)
        node.parents.append(self)
    def get_connection(self):
        return self.children + self.parents
    def get_children(self):
        return self.children
    def get_parents(self):
        return self.parents
    def remove(self):
        for node in self.get_children():
            node.parents.remove(self)
        for node in self.get_parents():
            node.children.remove(self)
    def get_graph(self, done = [], result = {}):
        for node in self.get_connection():
            data = node.data
            if not data in done:
                node_info = {'parents' : [], 'children': [], 'rank' : 0}
                for node_2 in node.get_children():
                    node_info['children'].append(node_2.data)
                for node_2 in node.get_parents():
                    node_info['parents'].append(node_2.data)
                node_info['rank'] = node.get_rank()
                if hasattr(self, 'nb_particle'):
                    aaa = self.nb_particle
                else:
                    aaa = None
                node_info['nb_particle'] =aaa
                result[data] = node_info
                done.append(data)
                result = node.get_graph(done, result)

        return result
    def set_rank(self,n):
        self.rank = n
        #print(self.rank)

    def get_rank(self):
        return self.rank
    
    def __str__(self):
        result = str()

        for key, item in self.get_graph().items():
            result+= str(key) + ' : ' + str(item['parents']) + ' --> ' + str(item['children']) +  ' | ' + str(item['nb_particle']) + '\n'
        return result 

if __name__ == '__main__':
    test_graph = Node('a')
    for a in range(3):
        new_node = Node(a)
        test_graph.connect(new_node)
    for b in range(3,5):
        new_node = Node(b)
        test_graph.connection[1].connect(new_node)
    print(test_graph.get_graph())