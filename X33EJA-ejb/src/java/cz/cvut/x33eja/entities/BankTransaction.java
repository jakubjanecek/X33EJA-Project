package cz.cvut.x33eja.entities;

import java.io.Serializable;
import java.math.BigInteger;
import java.sql.Date;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

/**
 *
 * @author Lukas Camra
 */
@Entity
public class BankTransaction implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private BigInteger amount;

    private int consSym;

    private Date dateTrans;

    private String message;

    private long specSym;

    private long varSym;

    @ManyToOne
    private Account fromAccount;

    @ManyToOne
    private Account toAccount;

    public Account getFromAccount() {
        return fromAccount;
    }

    public void setFromAccount(Account fromAccount) {
        this.fromAccount = fromAccount;
    }

    public Account getToAccount() {
        return toAccount;
    }

    public void setToAccount(Account toAccount) {
        this.toAccount = toAccount;
    }

    public BigInteger getAmount() {
        return amount;
    }

    public void setAmount(BigInteger amount) {
        this.amount = amount;
    }

    public int getConsSym() {
        return consSym;
    }

    public void setConsSym(int consSym) {
        this.consSym = consSym;
    }

    public Date getDateTrans() {
        return dateTrans;
    }

    public void setDateTrans(Date dateTrans) {
        this.dateTrans = dateTrans;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public long getSpecSym() {
        return specSym;
    }

    public void setSpecSym(long specSym) {
        this.specSym = specSym;
    }

    public long getVarSym() {
        return varSym;
    }

    public void setVarSym(long varSym) {
        this.varSym = varSym;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final BankTransaction other = (BankTransaction) obj;
        if (this.id != other.id && (this.id == null || !this.id.equals(other.id))) {
            return false;
        }
        if (this.fromAccount != other.fromAccount && (this.fromAccount == null || !this.fromAccount.equals(other.fromAccount))) {
            return false;
        }
        if (this.toAccount != other.toAccount && (this.toAccount == null || !this.toAccount.equals(other.toAccount))) {
            return false;
        }
        return true;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 31 * hash + (this.id != null ? this.id.hashCode() : 0);
        hash = 31 * hash + (this.fromAccount != null ? this.fromAccount.hashCode() : 0);
        hash = 31 * hash + (this.toAccount != null ? this.toAccount.hashCode() : 0);
        return hash;
    }

    @Override
    public String toString() {
        return "cz.cvut.x33eja.Transaction[id=" + id + "]";
    }
}
