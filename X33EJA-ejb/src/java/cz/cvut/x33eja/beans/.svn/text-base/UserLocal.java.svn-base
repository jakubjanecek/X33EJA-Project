package cz.cvut.x33eja.beans;

import cz.cvut.x33eja.entities.Customer;
import cz.cvut.x33eja.entities.Employee;
import cz.cvut.x33eja.entities.Person;
import cz.cvut.x33eja.exceptions.ValidationException;
import java.util.List;
import javax.ejb.Local;

/**
 * Interface of a session bean allowing you to manage users.
 *
 * @author Jakub Janeček
 */
@Local
public interface UserLocal {

    /**
     * Deletes the user with given ID.
     *
     * @param id ID of the user to be deleted
     */
    void deleteUser(long id);

    /**
     * Adds customer to database.
     *
     * @param name name of the customer
     * @param surname surname of the customer
     * @param houseNumber house number of the customer
     * @param phoneNumber1 first phone number of the customer
     * @param phoneNumber2 second phone number of the customer
     * @param city city where customer lives
     * @param street street where customer lives
     * @param zip zip code of the town quator where customer lives
     * @param email email of the customer
     * @param Username customer's username
     * @param password customer's password
     *
     * @throws ValidationException if data validation fails
     */
    public void addCustomer(String name, String surname, String houseNumber, String phoneNumber1, String phoneNumber2, String city, String street, String zip, String email, String Username, String password, String userRole, String[] advisors) throws ValidationException;

    /**
     * Edits customer to database.
     *
     * @param name name of the customer
     * @param surname surname of the customer
     * @param houseNumber house number of the customer
     * @param phoneNumber1 first phone number of the customer
     * @param phoneNumber2 second phone number of the customer
     * @param city city where customer lives
     * @param street street where customer lives
     * @param zip zip code of the town quator where customer lives
     * @param email email of the customer
     * @param Username customer's username
     * @param password customer's password
     *
     * @throws ValidationException if data validation fails
     */
    public void editCustomer(String name, String surname, String houseNumber, String phoneNumber1, String phoneNumber2, String city, String street, String zip, String email, String Username, String password, String userRole, String[] advisors, long id) throws ValidationException;

    /**
     * Returns a customer with given ID.
     *
     * @param id ID of the customer to be returned
     * @return Person customer
     */
    public Person getCustomer(long id);

    /**
     * Returns a list of all customers
     *
     * @return list of all customers
     */
    public List<Customer> getCustomers();

    /**
     * Returns a list of all employees
     * @return list of all employees
     */
    public List<Employee> getEmployees();

}
