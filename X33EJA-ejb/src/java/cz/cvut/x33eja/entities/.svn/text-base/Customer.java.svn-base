package cz.cvut.x33eja.entities;

import java.io.Serializable;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

/**
 *
 * @author Lukas Camra
 */
@Entity
public class Customer extends Person implements Serializable {

    private static final long serialVersionUID = 1L;

    @OneToMany(mappedBy = "customer", cascade = CascadeType.REMOVE,  fetch = FetchType.EAGER)
    private List<Account> accounts;

    public List<Account> getAccounts() {
        return accounts;
    }

    public void setAccounts(List<Account> accounts) {
        this.accounts = accounts;
    }
    @OneToMany(cascade = CascadeType.REMOVE)
    private List<Template> templates;

    @ManyToMany(mappedBy = "customers")
    private List<Employee> advisors;

    @OneToOne(cascade = CascadeType.REMOVE)
    private Contact contact;

    public Contact getContact() {
        return contact;
    }

    public void setContact(Contact contact) {
        this.contact = contact;
    }

    public List<Employee> getAdvisors() {
        return advisors;
    }

    public void setAdvisors(List<Employee> advisors) {
        this.advisors = advisors;
    }

    public List<Template> getTemplates() {
        return templates;
    }

    public void setTemplates(List<Template> templates) {
        this.templates = templates;
    }

    @Override
    public String toString() {
        return "cz.cvut.x33eja.Customer[id=" + id + "]";
    }
}
