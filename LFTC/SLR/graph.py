import sys
import getopt
import check


class SLR1Graph:
    """Plot the parser states graph of a given grammar"""

    def __init__(self, filecontent, separator='->'):
        """Initialization
        Paramaters:
            filecontent := File as a list of lines (readlines)"""
        # Graph variables
        self._graph = None
        self._nodes = list()
        self._checker = check.SLR1Checker(filecontent, separator)
        self._checker.check()
        representation = self._checker.get_representation()
        self._symbols = representation['symbols']
        self._itemsets = representation['itemsets']
        self._connections = representation['connections']
        self._labeled_connections = self._get_labeled_connections()

    def _get_labeled_connections(self):
        """Return the list of connections labeled by the symbol which caused the
        transition"""
        labeled_connections = list()
        for connection in self._connections:
            # symbol: the grammar symbol of GOTO(Itemset, Grammar_symbol)
            label = self._symbols[self._itemsets[connection[1]][0][1][self._itemsets[connection[1]][0][0]]]
            labeled_connections.append([connection[0], connection[1], label])
        return labeled_connections

    def print_graph(self):

        output_file = open('closure.txt', 'w+')
        length_items = str(len(self._itemsets))
        output_file.write(length_items + "\n")

        """If the grammar is SLR(1), print the parser states graph"""
        for pos, itemset in enumerate(self._itemsets):
            a = self._checker.get_string_rules(itemset, pos)
            # print a
            output_file.write(a)
            # print "Connected to (GOTO, itemset):"
            for labeled_connection in self._labeled_connections:
                if labeled_connection[0] == pos:
                    b = str(labeled_connection[2] + "," + str(labeled_connection[1]) + "\n")
                    # print b
                    output_file.write(b)
            output_file.write("\n\n")
            # print "\n" + "-"*80 + "\n"


def main():
    """Main"""
    separator = '->'
    args = ["slr.txt"]

    if len(args) == 0:
        print("WARNING: No file supplied, doing nothing")
    for filex in args:
        with open(filex, 'r') as fpt:
            gen = SLR1Graph(fpt.readlines(), separator)
            gen.print_graph()


if __name__ == "__main__":
    main()
