package cz.cvut.x33eja.beans;

import cz.cvut.x33eja.entities.Customer;
import cz.cvut.x33eja.entities.Person;
import cz.cvut.x33eja.entities.Template;
import cz.cvut.x33eja.exceptions.ValidationException;
import java.math.BigInteger;
import java.util.List;
import javax.ejb.Local;

/**
 * Interface of a session bean allowing you to operate a bank account.
 *
 * @author Jakub Janeček
 */
@Local
public interface AccountLocal {

    /**
     * Adds a template.
     *
     * @param amount amount of money
     * @param consSym constant symbol
     * @param varSym variable symbol
     * @param specSym specific symbol
     * @param message additional information
     * @throws ValidationException if data validation fails
     */
    void addTemplate(BigInteger amount, int consSym, long varSym, long specSym, String message, String account) throws ValidationException;

    /**
     * Edits a template with given data.
     *
     * @param id ID of the template to be edited
     * @param amount new amount or empty
     * @param consSym new constant symbol or empty
     * @param varSym new variable symbol or empty
     * @param specSym new specific symbol or empty
     * @param message new message or empty
     * @throws ValidationException if data validation fails
     */
    void editTemplate(long id, BigInteger amount, int consSym, long varSym, long specSym, String message, String account) throws ValidationException;

    /**
     * Deletes a template with given ID.
     *
     * @param id ID of the template to be deleted
     */
    void deleteTemplate(long id);

    /**
     * Returns a list of all customer's templates
     * 
     * @return list of all customer's templates
     */
    List<Template> getAllTemplates();

    /**
     * Returns a template with given ID.
     *
     * @param id ID of the template
     * @return template with given ID
     */
    Template getTemplate(long id);

    /**
     * Returns currently logged customer.
     *
     * @return Person customer
     */
    Person getCustomer();

    /**
     * Adds an account.
     * 
     * @param person person it belongs to
     * @param balance initial balance
     * @param number number of the account
     * @throws ValidationException if data validation fails
     */
    void addAccount(long person, String balance, String number) throws ValidationException;

    /**
     * Deletes an account.
     *
     * @param id ID of the account to be deleted
     * @throws ValidationException if data validation fails
     */
    void deleteAcount(long id) throws ValidationException;

    /**
     * Performs authentication.
     *
     * @return boolean if authentication was successful or not
     */
    boolean authenticate(boolean now);
}
