
public class EmployeeManagementSystem {
    private Employee[] employees;
    private int size;
    private static final int INITIAL_CAPACITY = 10;

    public EmployeeManagementSystem() {
        employees = new Employee[INITIAL_CAPACITY];
        size = 0;
    }

 
    public void addEmployee(Employee employee) {
        if (size >= employees.length) {
            resize();
        }
        employees[size++] = employee;
    }

   
    public Employee searchEmployeeById(String employeeId) {
        for (int i = 0; i < size; i++) {
            if (employees[i].getEmployeeId().equals(employeeId)) {
                return employees[i];
            }
        }
        return null;
    }

  
    public void traverseEmployees() {
        for (int i = 0; i < size; i++) {
            System.out.println(employees[i]);
        }
    }

    
    public boolean deleteEmployeeById(String employeeId) {
        for (int i = 0; i < size; i++) {
            if (employees[i].getEmployeeId().equals(employeeId)) {
                
                for (int j = i; j < size - 1; j++) {
                    employees[j] = employees[j + 1];
                }
                employees[--size] = null; 
                return true;
            }
        }
        return false;
    }

    
    private void resize() {
        int newCapacity = employees.length * 2;
        Employee[] newEmployees = new Employee[newCapacity];
        System.arraycopy(employees, 0, newEmployees, 0, size);
        employees = newEmployees;
    }
}
