package cz.cvut.x33eja.beans;

import cz.cvut.x33eja.entities.Message;
import cz.cvut.x33eja.exceptions.ValidationException;
import java.util.List;
import javax.ejb.Local;

/**
 * Interface of a session bean allowing you to send and receive messages.
 *
 * @author Jakub Janeček
 */
@Local
public interface MessageLocal {

    /**
     * Returns list of all messages.
     *
     * @return list of all messages
     */
    List<Message> showMessages();

    /**
     * Returns a message.
     *
     * @param id ID of the message to be returned
     * @return a message
     */
    Message showMessageDetail(long id);

    /**
     * Sends a message to all bank customers.
     *
     * @param message the message to be sent
     * @throws ValidationException if data validation fails
     */
    void sendMessage(String message) throws ValidationException;
}
