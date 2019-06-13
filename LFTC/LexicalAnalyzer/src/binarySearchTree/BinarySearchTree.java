package binarySearchTree;

public class BinarySearchTree {

    private Node root;
    private static int currentIndex;

    public BinarySearchTree() {
        root = null;
        currentIndex = 0;
    }


    private Node addHelper(Node current, String value) {
        if(current == null) {
            return new Node(++currentIndex, value);
        }

        if(value.compareTo(current.getValue()) < 0) {
            current.setLeft(addHelper(current.getLeft(), value));
        }
        else if(value.compareTo(current.getValue()) > 0) {
            current.setRight(addHelper(current.getRight(), value));
        }

        return current;
    }

    public int add(String value) {
        root = addHelper(root, value);
        return getIndex(value);
    }

    private int containsNodeHelper(Node current, String value) {
        if(current == null) {
            return -1;
        }

        if(value.equals(current.getValue())) {
            return current.getIndex();
        }

        return value.compareTo(current.getValue()) < 0 ? containsNodeHelper(current.getLeft(), value)
                                                       : containsNodeHelper(current.getRight(), value);


    }

    public int getIndex(String value) {
        return containsNodeHelper(root, value);
    }


    private Node deleteHelper(Node current, String value) {
        if( current == null) {
            return null;
        }

        if( value.equals(current.getValue())) {
            if( current.getLeft() == null && current.getRight() == null)
                return null;

            if( current.getRight() == null)
                return current.getLeft();

            if( current.getLeft() == null)
                return current.getRight();

            String smallestValue  = findSmallestValue(current.getRight());
            current.setValue(smallestValue);
            current.setRight(deleteHelper(current.getRight(), smallestValue));

            return current;

        }

        if( value.compareTo(current.getValue()) < 0) {
            current.setLeft(deleteHelper(current.getLeft(), value));

            return current;
        }

        current.setRight(deleteHelper(current.getRight(), value));

        return current;
    }


    public void delete(String value) {
        root = deleteHelper(root, value);
    }

    public void traverseInOrder(Node node, StringBuilder content) {
        if(node != null) {
            Node left = node.getLeft();
            Node right = node.getRight();
            traverseInOrder(node.getLeft(), content);
            content.append(node.getValue()).append(": ").append(node.getIndex()).append("\n\t");
            String leftStr="Left: { null }\n\t";
            String rightStr="Right: { null }\n\t";
            if(left != null) {
                leftStr = "Left: { "  + left.toString() +  " }\n\t";
            }
            if(right != null) {
                rightStr = "Right: { " + right.toString() + " }\n\t";
            }
            content.append(leftStr).append(rightStr).append("\n\t");

            traverseInOrder(node.getRight(), content);
        }
    }

    public String getOrder() {
        StringBuilder sb = new StringBuilder("Symbol table: {\n\t");
        traverseInOrder(root, sb);
        sb.append("}\n");

        return sb.toString();

    }

    private String findSmallestValue(Node root) {

        return root.getLeft() == null ? root.getValue() : findSmallestValue(root.getLeft());
    }




}


