package cz.cvut.x33eja.beans;

import cz.cvut.x33eja.entities.Account;
import cz.cvut.x33eja.entities.Customer;
import cz.cvut.x33eja.entities.Person;
import cz.cvut.x33eja.entities.Template;
import cz.cvut.x33eja.entities.UserData;
import cz.cvut.x33eja.exceptions.ValidationException;
import cz.cvut.x33eja.exceptions.ValidationException.ERROR_TYPE;
import java.math.BigInteger;
import java.util.List;
import javax.annotation.Resource;
import javax.annotation.security.DeclareRoles;
import javax.annotation.security.RolesAllowed;
import javax.ejb.SessionContext;
import javax.ejb.Stateful;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author Jakub Janeček
 */
@Stateful
@DeclareRoles({"customer", "admin"})
public class AccountBean implements AccountLocal {

    @PersistenceContext
    private EntityManager em;

    @Resource
    private SessionContext ctx;

    private Person customer;

    public AccountBean() {
    }

    @RolesAllowed({"customer"})
    public void addTemplate(BigInteger amount, int consSym, long varSym, long specSym, String message, String account) throws ValidationException {
        authenticate(false);
        Template template = new Template();
        template.setAmount(amount);
        template.setConsSym(consSym);
        template.setVarSym(varSym);
        template.setSpecSym(specSym);
        template.setMessage(message);
        template.setAccount(account);
        if (validateTemplate(template)) {
            em.persist(template);
        }
        ((Customer) customer).getTemplates().add(template);
        em.merge(customer);
        em.flush();
    }

    @RolesAllowed({"customer"})
    public void editTemplate(long id, BigInteger amount, int consSym, long varSym, long specSym, String message, String account) throws ValidationException {
        authenticate(false);
        Template template = em.find(Template.class, id);
        template.setAmount(amount);
        template.setConsSym(consSym);
        template.setVarSym(varSym);
        template.setSpecSym(specSym);
        template.setMessage(message);
        template.setAccount(account);
        if (validateTemplate(template)) {
            em.merge(template);
            em.flush();
        }
    }

    @RolesAllowed({"customer"})
    public void deleteTemplate(long id) {
        authenticate(false);
        Template template = em.find(Template.class, id);
        ((Customer) customer).getTemplates().remove(template);
        em.merge(customer);
        em.flush();
    }

    @RolesAllowed({"customer"})
    public List<Template> getAllTemplates() {
        authenticate(true);
        List<Template> list = ((Customer) customer).getTemplates();
        System.out.println("fl done");
        return list;
    }

    @RolesAllowed({"customer", "admin"})
    public Template getTemplate(long id) {
        authenticate(false);
        return em.find(Template.class, id);
    }

    @RolesAllowed({"customer", "admin"})
    public Person getCustomer() {
        authenticate(true);
        return customer;
    }

    @RolesAllowed({"admin"})
    public void addAccount(long person, String balance, String number) {
        authenticate(false);
        Customer c = em.find(Customer.class, person);
        Account a = new Account();
        a.setBalance(new BigInteger(balance));
        a.setNumber(number);
        a.setCustomer(c);
        c.getAccounts().add(a);
        em.persist(a);
        em.merge(c);
        em.flush();
    }

    @RolesAllowed({"admin"})
    public void deleteAcount(long id) {
        authenticate(false);
        Account a = em.find(Account.class, id);
        Customer c = em.find(Customer.class, a.getCustomer().getId());
        c.getAccounts().remove(a);
        em.merge(c);
        em.remove(a);
        em.flush();
    }

    public boolean authenticate(boolean now) {
        if (customer == null || now) {
            String username = ctx.getCallerPrincipal().getName();
            Query q = em.createQuery("Select u from UserData u Where u.username = ?1");
            q.setParameter(1, username);
            try {
                UserData data = (UserData) q.getSingleResult();
                customer = data.getPerson();
                return true;
            }
            catch (NoResultException ex) {
                ex.printStackTrace();
                return false;
            }
            catch (Exception ex) {
                ex.printStackTrace();
                return false;
            }
        }
        em.flush();
        return true;
    }

    private boolean validateTemplate(Template template) throws ValidationException {
        if (template.getAmount().compareTo(new BigInteger("0")) != 1) {
            throw new ValidationException(ERROR_TYPE.AMOUNT_ERROR);
        }
        if (template.getConsSym() < 0 && template.getConsSym() >= 10000) {
            throw new ValidationException(ERROR_TYPE.CONS_ERROR);
        }
        if (template.getSpecSym() < 0 && template.getSpecSym() >= 100000000) {
            throw new ValidationException(ERROR_TYPE.SPEC_ERROR);
        }
        if (template.getVarSym() < 0 && template.getVarSym() >= 100000000) {
            throw new ValidationException(ERROR_TYPE.VAR_ERROR);
        }
        if (template.getMessage().length() > 255) {
            throw new ValidationException(ERROR_TYPE.MSG_ERROR);
        }
        return true;
    }
}
