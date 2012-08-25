package cz.cvut.x33eja.beans;

import cz.cvut.x33eja.entities.Contact;
import cz.cvut.x33eja.entities.Customer;
import cz.cvut.x33eja.entities.Employee;
import cz.cvut.x33eja.entities.Person;
import cz.cvut.x33eja.entities.UserData;
import cz.cvut.x33eja.exceptions.ValidationException;
import cz.cvut.x33eja.exceptions.ValidationException.ERROR_TYPE;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.security.DeclareRoles;
import javax.annotation.security.RolesAllowed;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author Jakub Janeček
 */
@Stateless
@DeclareRoles({"customer","admin"})
public class UserBean implements UserLocal {

    @PersistenceContext
    private EntityManager em;

    @RolesAllowed({"admin"})
    public void deleteUser(long id) {
        Customer c = em.find(Customer.class, id);
        List<Employee> advisorList = c.getAdvisors();
        for (Employee emp : advisorList) {
            emp.getCustomers().remove(c);
            em.merge(emp);
        }
        em.remove(c);
        em.flush();
    }

    @RolesAllowed({"customer","admin"})
    private List<Employee> getAdvisorsFromArray(String[] advisors) {
        ArrayList<Employee> list = new ArrayList<Employee>();
        for (String temp : advisors) {
            Long id = Long.valueOf(temp);
            list.add(getEmployee(id.longValue()));
        }
        em.flush();
        return list;
    }

    @RolesAllowed({"admin"})
    public void addCustomer(String name, String surname, String houseNumber, String phoneNumber1, String phoneNumber2, String city, String street, String zip, String email, String Username, String password, String userRole, String[] advisor) throws ValidationException {
        Customer c = new Customer();
        Contact contact = new Contact();
        contact.setCity(city);
        contact.setEmail(email);
        contact.setHouseNumber(houseNumber);
        contact.setPhoneNumber1(phoneNumber1);
        contact.setPhoneNumber2(phoneNumber2);
        contact.setStreet(street);
        contact.setZip(Integer.valueOf(zip));
        UserData userdata = new UserData();
        userdata.setPassword(password);
        userdata.setRoleUser(userRole);
        userdata.setUsername(Username);
        c.setName(name);
        c.setSurname(surname);
        c.setContact(contact);
        c.setUserData(userdata);
        userdata.setPerson(c);
        List<Employee> list = getAdvisorsFromArray(advisor);
        c.setAdvisors(getAdvisorsFromArray(advisor));
        if (validateUser(userdata)) {
            em.persist(contact);
            em.persist(userdata);
            em.persist(c);
            for (Employee emp : list) {
                emp.getCustomers().add(c);
                em.merge(emp);
            }
            em.flush();
        }
    }

    @RolesAllowed({"admin"})
    public void editCustomer(String name, String surname, String houseNumber, String phoneNumber1, String phoneNumber2, String city, String street, String zip, String email, String Username, String password, String userRole, String[] advisors, long id) throws ValidationException {
        Customer c = (Customer) em.find(Person.class, id);
        Contact contact = c.getContact();
        contact.setCity(city);
        contact.setEmail(email);
        contact.setHouseNumber(houseNumber);
        contact.setPhoneNumber1(phoneNumber1);
        contact.setPhoneNumber2(phoneNumber2);
        contact.setStreet(street);
        contact.setZip(Integer.valueOf(zip));
        UserData userdata = c.getUserData();
        userdata.setPassword(password);
        userdata.setRoleUser(userRole);
        userdata.setUsername(Username);
        c.setName(name);
        c.setSurname(surname);
        c.setContact(contact);
        c.setUserData(userdata);
        List<Employee> list = getAdvisorsFromArray(advisors);
        List<Employee> allEmployee = getEmployees();
        c.setAdvisors(getAdvisorsFromArray(advisors));
        if (validateUser(userdata)) {
            for (Employee emp : allEmployee) {
                if (emp.getCustomers().contains(c)) {
                    emp.getCustomers().remove(c);
                    em.merge(emp);
                }
            }
            for (Employee emp : list) {
                if (!emp.getCustomers().contains(c)) {
                    emp.getCustomers().add(c);
                }
                em.merge(emp);
            }
            em.merge(contact);
            em.merge(c);
            em.flush();
        }
    }

    @RolesAllowed({"customer","admin"})
    public Person getCustomer(long id) {
        em.flush();
        return em.find(Customer.class, id);
    }

    @RolesAllowed({"customer","admin"})
    public Employee getEmployee(long id) {
        return em.find(Employee.class, id);
    }

    @RolesAllowed({"customer","admin"})
    public List<Customer> getCustomers() {
        Query q = em.createQuery("Select c from Customer c");
        return (List<Customer>) q.getResultList();
    }

    @RolesAllowed({"customer","admin"})
    public List<Employee> getEmployees() {
        Query q = em.createQuery("Select c from Employee c");
        return (List<Employee>) q.getResultList();
    }

    private boolean validateUser(UserData user) throws ValidationException {
        if (user.getPassword().length() < 5) {
            throw new ValidationException(ERROR_TYPE.PASS_ERROR);
        }
        if (!user.getRoleUser().equals("admin") && !user.getRoleUser().equals("customer")) {
            throw new ValidationException(ERROR_TYPE.ROLE_ERROR);
        }
        if (user.getUsername().length() < 5) {
            throw new ValidationException(ERROR_TYPE.USERNAME_ERROR);
        }
        return true;
    }
}
