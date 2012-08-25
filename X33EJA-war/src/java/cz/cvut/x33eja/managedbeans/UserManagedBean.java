package cz.cvut.x33eja.managedbeans;

import cz.cvut.x33eja.beans.AccountLocal;
import cz.cvut.x33eja.beans.UserLocal;
import cz.cvut.x33eja.entities.Account;
import cz.cvut.x33eja.entities.Customer;
import cz.cvut.x33eja.entities.Employee;
import cz.cvut.x33eja.errors.ErrorWriter;
import cz.cvut.x33eja.exceptions.ValidationException;
import java.util.LinkedList;
import java.util.List;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.model.SelectItem;
import javax.faces.validator.ValidatorException;

/**
 *
 * @author Lukas Camra
 */
public class UserManagedBean {

    private String name;

    private String surname;

    private String houseNumber;

    private String phoneNumber1;

    private String phoneNumber2;

    private String city;

    private String street;

    private String zip;

    private String email;

    private String userRole;

    private String username;

    private String password;

    private String actionMessage;

    private Long id;

    private Long idAccount;

    private String accountBalance;

    private String accountNumber;

    @EJB
    private UserLocal userBean;

    @EJB
    private AccountLocal accountBean;

    private String[] advisors;

    public String[] getAdvisors() {
        return advisors;
    }

    public void setAdvisors(String[] advisors) {
        this.advisors = advisors;
    }

    public UserManagedBean() {
    }

    public String getAccountBalance() {
        return accountBalance;
    }

    public void setAccountBalance(String accountBalance) {
        this.accountBalance = accountBalance;
    }

    public String getAccountNumber() {
        return accountNumber;
    }

    public void setAccountNumber(String accountNumber) {
        this.accountNumber = accountNumber;
    }

    public Long getIdAccount() {
        return idAccount;
    }

    public void setIdAccount(Long idAccount) {
        this.idAccount = idAccount;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getActionMessage() {
        return actionMessage;
    }

    public void setActionMessage(String actionMessage) {
        this.actionMessage = actionMessage;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getHouseNumber() {
        return houseNumber;
    }

    public void setHouseNumber(String houseNumber) {
        this.houseNumber = houseNumber;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhoneNumber1() {
        return phoneNumber1;
    }

    public void setPhoneNumber1(String phoneNumber1) {
        this.phoneNumber1 = phoneNumber1;
    }

    public String getPhoneNumber2() {
        return phoneNumber2;
    }

    public void setPhoneNumber2(String phoneNumber2) {
        this.phoneNumber2 = phoneNumber2;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getUserRole() {
        return userRole;
    }

    public void setUserRole(String userRole) {
        this.userRole = userRole;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getZip() {
        return zip;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }

    public List<Customer> getAllCustomers() {
        return userBean.getCustomers();
    }

    public List<Customer> getMyCustomers() {
        Employee emp = (Employee) accountBean.getCustomer();
        if (emp == null) {
            return new LinkedList<Customer>();
        }
        return emp.getCustomers();
    }

    public List<Employee> getMyAdvisors() {
        Customer cust = (Customer) accountBean.getCustomer();
        if (cust == null) {
            return new LinkedList<Employee>();
        }
        return cust.getAdvisors();
    }

    public String addCustomer() {
        if (zip == null || zip.equals("")) {
            zip = "0";
        }
        try {
            userBean.addCustomer(name, surname, houseNumber, phoneNumber1, phoneNumber2, city, street, zip, email, username, password, "customer", advisors);
        }
        catch (ValidationException ex) {
            String errorMsg = "";
            String type = "";
            switch (ex.getType()) {
                case USERNAME_ERROR:
                    errorMsg = "Username must be at least 5 characters long.";
                    type = "username";
                    break;
                case PASS_ERROR:
                    errorMsg = "Password must be at lest 5 characters long.";
                    type = "password";
                    break;
                case ROLE_ERROR:
                    errorMsg = "Incorrect role!";
                    type = "username";
                    break;
                default:
                    break;
            }
            ErrorWriter.writeError(errorMsg, type, FacesContext.getCurrentInstance());
            return null;
        }
        setActionMessage("Customer added successfully.");
        return "addUserSuccess";
    }

    public String delete() {
        if (id == null) {
            ErrorWriter.writeError("No customer was selected!", "deleteButton", FacesContext.getCurrentInstance());
            return null;
        }
        userBean.deleteUser(id);
        setActionMessage("Customer deleted successfully.");
        return "deleteUserSuccess";
    }

    public String edit() {
        if (id == null) {
            ErrorWriter.writeError("No customer was selected!", "deleteButton", FacesContext.getCurrentInstance());
            return null;
        }
        Customer c = (Customer) userBean.getCustomer(id);
        this.name = c.getName();
        this.city = c.getContact().getCity();
        this.email = c.getContact().getEmail();
        this.houseNumber = c.getContact().getHouseNumber();
        this.name = c.getName();
        this.password = c.getUserData().getPassword();
        this.phoneNumber1 = c.getContact().getPhoneNumber1();
        this.phoneNumber2 = c.getContact().getPhoneNumber2();
        this.street = c.getContact().getStreet();
        this.surname = c.getSurname();
        this.userRole = c.getUserData().getRoleUser();
        this.username = c.getUserData().getUsername();
        this.zip = String.valueOf(c.getContact().getZip());
        return "editUser";
    }

    public String editUser() {
        if (zip == null || zip.equals("")) {
            zip = "0";
        }
        try {
            userBean.editCustomer(name, surname, houseNumber, phoneNumber1, phoneNumber2, city, street, zip, email, username, password, "customer", advisors, id);
        }
        catch (ValidationException ex) {
            String errorMsg = "";
            String type = "";
            switch (ex.getType()) {
                case USERNAME_ERROR:
                    errorMsg = "Username must be at least 5 characters long.";
                    type = "username";
                    break;
                case PASS_ERROR:
                    errorMsg = "Password must be at lest 5 characters long.";
                    type = "password";
                    break;
                case ROLE_ERROR:
                    errorMsg = "Incorrect role!";
                    type = "username";
                    break;
                default:
                    break;
            }
            ErrorWriter.writeError(errorMsg, type, FacesContext.getCurrentInstance());
            return null;
        }
        setActionMessage("Customer edited successfully.");
        return "editUserCompleted";
    }

    public List<Account> getUserAccounts() {
        Customer c = (Customer) userBean.getCustomer(id);
        return c.getAccounts();
    }

    public String addAccount() {
        setActionMessage("");
        try {
            accountBean.addAccount(id, accountBalance, accountNumber);
        }
        catch (ValidationException ex) {
            ErrorWriter.writeError("Invalid parameters.", "number", FacesContext.getCurrentInstance());
            return null;
        }
        setActionMessage("Account added successfully.");
        return "addAccountSuccess";
    }

    public String deleteAccount() {
        if (idAccount == null) {
            ErrorWriter.writeError("No account was selected!", "deleteButton", FacesContext.getCurrentInstance());
            return null;
        }
        setActionMessage("");
        try {
            accountBean.deleteAcount(idAccount);
        }
        catch (ValidationException ex) {
            ErrorWriter.writeError("Invalid parameters.", "number", FacesContext.getCurrentInstance());
            return null;
        }
        setActionMessage("Account deleted successfully.");
        return "deleteAccountSuccess";
    }

    public SelectItem[] getAllAdvisors() {
        List<Employee> list = userBean.getEmployees();
        SelectItem[] result = new SelectItem[list.size()];
        int i = 0;
        SelectItem s = new SelectItem();
        for (Employee emp : list) {
            result[i] = new SelectItem(emp.getId(), emp.getName() + " " + emp.getSurname());
            i++;
        }
        return result;
    }

    public void validateAdvisors(FacesContext facesContext, UIComponent component, Object value) {
        String[] advisor = (String[]) value;
        if (advisor.length == 0) {
            throw new ValidatorException(new FacesMessage("No advisor was selected!"));
        }
    }
}
