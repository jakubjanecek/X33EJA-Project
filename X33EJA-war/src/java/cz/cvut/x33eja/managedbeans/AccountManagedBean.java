package cz.cvut.x33eja.managedbeans;

import cz.cvut.x33eja.beans.AccountLocal;
import cz.cvut.x33eja.entities.Account;
import cz.cvut.x33eja.entities.Customer;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;

/**
 *
 * @author Lukas Camra
 */
public class AccountManagedBean {

    @EJB
    private AccountLocal accountBean;

    public AccountManagedBean() {
    }

    public List<Account> getUsersAccounts() {
        List<Account> list = ((Customer) accountBean.getCustomer()).getAccounts();
        if (list == null || list.size() == 0) {
            return new ArrayList<Account>();
        }
        return list;
    }
}
