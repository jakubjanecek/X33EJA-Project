package cz.cvut.x33eja.beans;

import cz.cvut.x33eja.exceptions.NonExistingAccountException;
import cz.cvut.x33eja.exceptions.NotEnoughMoneyException;
import cz.cvut.x33eja.exceptions.ValidationException;
import java.math.BigInteger;
import javax.ejb.Local;

/**
 * Interface of a session bean allowing you to work with transactions.
 *
 * @author Jakub Janeček
 */
@Local
public interface TransactionLocal {

    /**
     * Transfers money from one account to another. The amount is added to "to" account and is subtracted from "from" account.
     *
     * @param from number of the account we are transferring from
     * @param to number of the account we are transferring to
     * @param amount amount of money to be transferred
     * @param consSym constant symbol
     * @param varSym variable symbol
     * @param specSym specific symbol
     * @param message additional information
     *
     * @throws NonExistingAccountException if the "from" or "to" account does not exist.
     * @throws IllegalArgumentException if the amount is less than or equal to zero
     * @throws NotEnoughMoneyException if the amount value is greater than the amount of money at "from" account
     * @throws ValidationException if data validation fails
     */
    void transfer(String from, String to, BigInteger amount, int consSym, long varSym, long specSym, String message) throws NonExistingAccountException, IllegalArgumentException, NotEnoughMoneyException, ValidationException;

    /**
     * Verifies existence of specified account.
     *
     * @param number number of the account to be verified
     * @return true if account exists
     */
    public boolean isAccountExist(String number);
}
