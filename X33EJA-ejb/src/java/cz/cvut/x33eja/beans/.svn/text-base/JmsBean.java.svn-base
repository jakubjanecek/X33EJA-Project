package cz.cvut.x33eja.beans;

import javax.ejb.ActivationConfigProperty;
import javax.ejb.MessageDriven;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.ObjectMessage;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 * Message-driven bean processing bank messages.
 *
 * @author Jakub Janeček
 */
@MessageDriven(mappedName = "jmsQueue", activationConfig = {
    @ActivationConfigProperty(propertyName = "acknowledgeMode", propertyValue = "Auto-acknowledge"),
    @ActivationConfigProperty(propertyName = "destinationType", propertyValue = "javax.jms.Queue")
})
public class JmsBean implements MessageListener {

    @PersistenceContext
    private EntityManager em;

    public JmsBean() {
    }

    /*
     * Processes a received message.
     *
     * @param message the received message
     */
    public void onMessage(Message message) {
        if (message instanceof ObjectMessage) {
            cz.cvut.x33eja.entities.Message m;
            try {
                m = (cz.cvut.x33eja.entities.Message) ((ObjectMessage) message).getObject();
                em.persist(m);
            }
            catch (JMSException ex) {
                // report
            }
        }
    }
}
