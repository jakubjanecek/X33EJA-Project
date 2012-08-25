package cz.cvut.x33eja.managedbeans;

import cz.cvut.x33eja.beans.AccountLocal;
import cz.cvut.x33eja.entities.Template;
import cz.cvut.x33eja.errors.ErrorWriter;
import cz.cvut.x33eja.exceptions.ValidationException;
import java.math.BigInteger;
import java.util.List;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.model.SelectItem;

/**
 *
 * @author Jakub Janeček
 */
public class TemplateManagedBean {

    @EJB
    private AccountLocal accountBean;

    private String id;

    private String amount;

    private String consSym;

    private String specSym;

    private String varSym;

    private String message;

    private Long selectedTemplateId;

    private String actionMessage;

    private String account;

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public TemplateManagedBean() {
    }

    public Long getSelectedTemplateId() {
        return selectedTemplateId;
    }

    public void setSelectedTemplateId(Long selectedTemplateId) {
        this.selectedTemplateId = selectedTemplateId;
    }

    public String add() {
        return "add";
    }

    public String addTemplate() {
        if (specSym == null || specSym.equals("")) {
            specSym = "0";
        }
        if (varSym == null || varSym.equals("")) {
            varSym = "0";
        }
        if (consSym == null || consSym.equals("")) {
            consSym = "0";
        }
        if (amount == null || amount.equals("")) {
            amount = "0";
        }
        try {
            accountBean.addTemplate(new BigInteger(amount), Integer.valueOf(consSym), Long.valueOf(varSym), Long.valueOf(specSym), message, account);
        }
        catch (ValidationException ex) {
            String errorMsg = "";
            String type = "";
            switch (ex.getType()) {
                case AMOUNT_ERROR:
                    errorMsg = "Amount must be greater than zero.";
                    type = "amount";
                    break;
                case CONS_ERROR:
                    errorMsg = "Constant symbol must be correct.";
                    type = "consSym";
                    break;
                case SPEC_ERROR:
                    errorMsg = "Constant symbol must be correct.";
                    type = "specSym";
                    break;
                case VAR_ERROR:
                    errorMsg = "Constant symbol must be correct.";
                    type = "varSym";
                    break;
                case MSG_ERROR:
                    errorMsg = "Message must be maximum 255 characters long.";
                    type = "message";
                    break;
                default:
                    break;
            }
            ErrorWriter.writeError(errorMsg, type, FacesContext.getCurrentInstance());
            return null;
        }
        setActionMessage("Template added successfully.");
        return "addSuccess";
    }

    public String edit() {
        if (id == null || id.equals("")) {
            ErrorWriter.writeError("No template was selected!", "deleteButton", FacesContext.getCurrentInstance());
            return null;
        }
        Template t = accountBean.getTemplate(Long.valueOf(id));
        this.id = t.getId().toString();
        this.amount = t.getAmount().toString();
        this.consSym = String.valueOf(t.getConsSym());
        this.varSym = String.valueOf(t.getVarSym());
        this.specSym = String.valueOf(t.getSpecSym());
        this.message = t.getMessage();
        return "edit";
    }

    public String editTemplate() {
        if (specSym == null || specSym.equals("")) {
            specSym = "0";
        }
        if (varSym == null || varSym.equals("")) {
            varSym = "0";
        }
        if (consSym == null || consSym.equals("")) {
            consSym = "0";
        }
        if (amount == null || amount.equals("")) {
            amount = "0";
        }
        try {
            accountBean.editTemplate(Long.valueOf(id), new BigInteger(new Integer(amount).toString()), Integer.valueOf(consSym), Long.valueOf(varSym), Long.valueOf(specSym), message, account);
        }
        catch (ValidationException ex) {
            String errorMsg = "";
            String type = "";
            switch (ex.getType()) {
                case AMOUNT_ERROR:
                    errorMsg = "Amount must be greater than zero.";
                    type = "amount";
                    break;
                case CONS_ERROR:
                    errorMsg = "Constant symbol must be correct.";
                    type = "consSym";
                    break;
                case SPEC_ERROR:
                    errorMsg = "Constant symbol must be correct.";
                    type = "specSym";
                    break;
                case VAR_ERROR:
                    errorMsg = "Constant symbol must be correct.";
                    type = "varSym";
                    break;
                case MSG_ERROR:
                    errorMsg = "Message must be maximum 255 characters long.";
                    type = "message";
                    break;
                default:
                    break;
            }
            ErrorWriter.writeError(errorMsg, type, FacesContext.getCurrentInstance());
            return null;
        }
        setActionMessage("Template edited successfully.");
        return "editSuccess";
    }

    public String deleteTemplate() {
        if (id == null || id.equals("")) {
            ErrorWriter.writeError("No template was selected!", "deleteButton", FacesContext.getCurrentInstance());
            return null;
        }
        accountBean.deleteTemplate(Long.valueOf(id));
        setActionMessage("Template deleted successfully.");
        return "deleteSuccess";
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public String getConsSym() {
        return consSym;
    }

    public void setConsSym(String consSym) {
        this.consSym = consSym;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getSpecSym() {
        return specSym;
    }

    public void setSpecSym(String specSym) {
        this.specSym = specSym;
    }

    public String getVarSym() {
        return varSym;
    }

    public void setVarSym(String varSym) {
        this.varSym = varSym;
    }

    public String getActionMessage() {
        return actionMessage;
    }

    public void setActionMessage(String actionMessage) {
        this.actionMessage = actionMessage;
    }

    public SelectItem[] getAllTemplatesSelect() {
        List<Template> list = accountBean.getAllTemplates();
        SelectItem[] result = new SelectItem[list.size()];
        int i = 0;
        for (Template temp : list) {
            result[i] = new SelectItem(temp.getId(), "Template " + temp.getId());
            i++;
        }
        return result;
    }

    public List<Template> getAllTemplates() {
        List<Template> list = accountBean.getAllTemplates();
        return list;
    }
}
