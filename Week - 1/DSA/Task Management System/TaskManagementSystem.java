public class TaskManagementSystem {
    private Node head;
    private Node tail;
    private int size;

    public TaskManagementSystem() {
        this.head = null;
        this.tail = null;
        this.size = 0;
    }

  
    public void addTask(Task task) {
        Node newNode = new Node(task);
        if (head == null) {
            head = newNode;
            tail = newNode;
        } else {
            tail.next = newNode;
            tail = newNode;
        }
        size++;
    }


    public Task searchTaskById(String taskId) {
        Node current = head;
        while (current != null) {
            if (current.task.getTaskId().equals(taskId)) {
                return current.task;
            }
            current = current.next;
        }
        return null;
    }


    public void traverseTasks() {
        Node current = head;
        while (current != null) {
            System.out.println(current.task);
            current = current.next;
        }
    }


    public boolean deleteTaskById(String taskId) {
        Node current = head;
        Node previous = null;

        while (current != null) {
            if (current.task.getTaskId().equals(taskId)) {
                if (previous == null) {
                    head = current.next;
                } else {
                    previous.next = current.next;
                }

                if (current.next == null) {
                    tail = previous;
                }

                size--;
                return true;
            }
            previous = current;
            current = current.next;
        }
        return false;
    }

 
    public int getSize() {
        return size;
    }
}