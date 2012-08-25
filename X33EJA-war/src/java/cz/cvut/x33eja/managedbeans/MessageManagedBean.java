package cz.cvut.x33eja.managedbeans;

import cz.cvut.x33eja.beans.MessageLocal;
import cz.cvut.x33eja.entities.Message;
import cz.cvut.x33eja.errors.ErrorWriter;
import cz.cvut.x33eja.exceptions.ValidationException;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.faces.context.FacesContext;

/**
 *
 * @author Jakub Janeček
 */
public class MessageManagedBean {

    @EJB
    private MessageLocal messageBean;

    private Long id;

    private Date dateMess;

    private String message;

    private String actionMessage;

    public MessageManagedBean() {
    }

    public String showMessage() {
        if (id == null) {
            ErrorWriter.writeError("No message was selected", "showButton", FacesContext.getCurrentInstance());
            return null;
        }
        Message m = messageBean.showMessageDetail(id);
        message = m.getText();
        dateMess = m.getDateMess();
        return "show";
    }

    public String contactBank() {
        return "success";
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getDateMess() {
        return dateMess;
    }

    public void setDateMess(Date dateMess) {
        this.dateMess = dateMess;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getActionMessage() {
        return actionMessage;
    }

    public void setActionMessage(String actionMessage) {
        this.actionMessage = actionMessage;
    }

    public List<Message> getAllMessages() {
        List<Message> list = messageBean.showMessages();
        for (Message m : list) {
            int len = m.getText().length();
            m.setText(m.getText().substring(0, 20 < len ? 20 : len));
        }
        return list;
    }

    public String sendMessage() {
        try {
            messageBean.sendMessage(message);
        }
        catch (ValidationException ex) {
            ErrorWriter.writeError("Message must be at least 10 characters long.", "message", FacesContext.getCurrentInstance());
            setActionMessage(null);
            return null;
        }
        message = null;
        setActionMessage("Message sent successfully.");
        return "sendSuccess";
    }
}
