import binarySearchTree.BinarySearchTree;

public class SymbolTable {

    private BinarySearchTree binaryTree;

    public SymbolTable() {

        binaryTree = new BinarySearchTree();
    }

    public int add(String value) {

        return this.binaryTree.add(value);
    }

    public int contains(String value){

        return this.binaryTree.getIndex(value);
    }

    @Override
    public String toString() {

        return binaryTree.getOrder();
    }


}
