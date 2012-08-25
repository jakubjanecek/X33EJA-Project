package cz.cvut.x33eja.entities;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.ManyToMany;

/**
 *
 * @author Lukas Camra
 */
@Entity
public class Employee extends Person implements Serializable {

    private static final long serialVersionUID = 1L;

    @ManyToMany
    private List<Customer> customers;

    public List<Customer> getCustomers() {
        return customers;
    }

    public void setCustomers(List<Customer> customers) {
        this.customers = customers;
    }
    private String phoneNumber;

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    @Override
    public String toString() {
        return "cz.cvut.x33eja.Employee[id=" + id + "]";
    }
}
