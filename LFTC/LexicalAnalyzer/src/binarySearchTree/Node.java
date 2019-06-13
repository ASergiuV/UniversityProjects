package binarySearchTree;

public class Node {
    private int index;
    private String value;
    private Node left;
    private Node right;

    Node(int index, String value) {
        this.index = index;
        this.value = value;
        left = null;
        right = null;
    }

    @Override
    public String toString() {

        return this.value + ": " + this.index;
    }

    public int getIndex() {
        return index;
    }

    public void setIndex(int index) {
        this.index = index;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public Node getLeft() {
        return left;
    }

    public void setLeft(Node left) {
        this.left = left;
    }

    public Node getRight() {
        return right;
    }

    public void setRight(Node right) {
        this.right = right;
    }
}
