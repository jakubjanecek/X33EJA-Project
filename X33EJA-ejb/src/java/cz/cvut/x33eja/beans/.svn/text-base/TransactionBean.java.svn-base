package cz.cvut.x33eja.beans;

import cz.cvut.x33eja.entities.Account;
import cz.cvut.x33eja.entities.BankTransaction;
import cz.cvut.x33eja.exceptions.NonExistingAccountException;
import cz.cvut.x33eja.exceptions.NotEnoughMoneyException;
import cz.cvut.x33eja.exceptions.ValidationException;
import cz.cvut.x33eja.exceptions.ValidationException.ERROR_TYPE;
import java.math.BigInteger;
import javax.annotation.security.DeclareRoles;
import javax.annotation.security.RolesAllowed;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author Jakub Janeček
 */
@Stateless
@RolesAllowed({"customer","admin"})
public class TransactionBean implements TransactionLocal {

    @PersistenceContext
    private EntityManager em;

    @RolesAllowed({"customer","admin"})
    public void transfer(String from, String to, BigInteger amount, int consSym, long varSym, long specSym, String message) throws
        NonExistingAccountException, IllegalArgumentException, NotEnoughMoneyException, ValidationException {
        if (amount.longValue() <= 0) {
            throw new IllegalArgumentException();
        }
        BankTransaction b = new BankTransaction();
        b.setAmount(amount);
        b.setConsSym(consSym);
        b.setDateTrans(new java.sql.Date(new java.util.Date().getTime()));
        b.setVarSym(varSym);
        b.setSpecSym(specSym);
        b.setMessage(message);
        Query q = em.createQuery("Select d from Account d where d.number=?1");
        q.setParameter(1, from);
        Account aFrom = null;
        try {
            aFrom = (Account) q.getSingleResult();
        }
        catch (NoResultException ex) {
            throw new NonExistingAccountException("from");
        }
        if (aFrom.getBalance().subtract(amount).longValue() < 0 && !from.equals("0")) {
            throw new NotEnoughMoneyException();
        }
        q.setParameter(1, to);
        Account aTo = null;
        try {
            aTo = (Account) q.getSingleResult();
        }
        catch (NoResultException ex) {
            throw new NonExistingAccountException("to");
        }
        b.setFromAccount(aFrom);
        b.setToAccount(aTo);
        if (!from.equals("0")) {
            aFrom.setBalance(aFrom.getBalance().subtract(amount));
        }
        if (!to.equals("0")) {
            aTo.setBalance(aTo.getBalance().add(amount));
        }

        if (validateTransaction(b)) {
            aFrom.getOutcomingTransactions().add(b);
            aTo.getIncomingTransactions().add(b);
            em.persist(b);
            em.flush();
        }
    }

    @RolesAllowed({"customer","admin"})
    public boolean isAccountExist(String number) {
        Query q = em.createQuery("Select d from Account d where d.number=?1");
        q.setParameter(1, number);
        if (q.getResultList().size() == 0) {
            return false;
        }
        return true;
    }

    private boolean validateTransaction(BankTransaction transaction) throws ValidationException {
        if (transaction.getAmount().compareTo(new BigInteger("0")) != 1) {
            throw new ValidationException(ERROR_TYPE.AMOUNT_ERROR);
        }
        if (transaction.getConsSym() < 0 && transaction.getConsSym() >= 10000) {
            throw new ValidationException(ERROR_TYPE.CONS_ERROR);
        }
        if (transaction.getSpecSym() < 0 && transaction.getSpecSym() >= 10000000000L) {
            throw new ValidationException(ERROR_TYPE.SPEC_ERROR);
        }
        if (transaction.getVarSym() < 0 && transaction.getVarSym() >= 10000000000L) {
            throw new ValidationException(ERROR_TYPE.VAR_ERROR);
        }
        if (transaction.getMessage().length() > 255) {
            throw new ValidationException(ERROR_TYPE.MSG_ERROR);
        }
        return true;
    }
}
