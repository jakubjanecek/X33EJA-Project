package cz.cvut.x33eja.beans;

import cz.cvut.x33eja.entities.Message;
import cz.cvut.x33eja.exceptions.ValidationException;
import cz.cvut.x33eja.exceptions.ValidationException.ERROR_TYPE;
import java.sql.Date;
import java.util.List;
import javax.annotation.Resource;
import javax.annotation.security.DeclareRoles;
import javax.annotation.security.RolesAllowed;
import javax.ejb.Stateless;
import javax.jms.JMSException;
import javax.jms.ObjectMessage;
import javax.jms.Queue;
import javax.jms.QueueConnection;
import javax.jms.QueueConnectionFactory;
import javax.jms.Session;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author Jakub Janeček
 */
@Stateless
@DeclareRoles({"customer","admin"})
public class MessageBean implements MessageLocal {

    @PersistenceContext
    private EntityManager em;

    @Resource(name = "jmsConnectionFactory", mappedName = "jmsConnectionFactory")
    private QueueConnectionFactory jmsFactory;

    @Resource(name = "jmsQueue", mappedName = "jmsQueue")
    private Queue queue;

    @RolesAllowed({"customer","admin"})
    public List<Message> showMessages() {
        Query q = em.createQuery("Select m from Message m");
        return q.getResultList();
    }

    @RolesAllowed({"customer","admin"})
    public Message showMessageDetail(long id) {
        return em.find(Message.class, id);
    }

    @RolesAllowed({"admin"})
    public void sendMessage(String message) throws ValidationException {
        Message m = new Message();
        m.setText(message);
        m.setDateMess(new Date(new java.util.Date().getTime()));
        if (validateMessage(m)) {
            try {
                QueueConnection conn = jmsFactory.createQueueConnection();
                Session session = conn.createSession(false, Session.AUTO_ACKNOWLEDGE);
                ObjectMessage msg = session.createObjectMessage();
                msg.setObject(m);
                session.createProducer(queue).send(msg);
                em.flush();
            }
            catch (JMSException ex) {
                // report
            }
        }
    }

    private boolean validateMessage(Message message) throws ValidationException {
        if (message.getText().length() < 10 || message.getText().length() > 10000) {
            throw new ValidationException(ERROR_TYPE.MSG_ERROR);
        }
        return true;
    }
}
