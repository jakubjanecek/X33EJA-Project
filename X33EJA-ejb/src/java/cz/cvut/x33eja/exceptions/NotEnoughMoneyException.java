package cz.cvut.x33eja.exceptions;

/**
 *
 * @author Jakub Janeček
 */
public class NotEnoughMoneyException extends Exception {

    /**
     * Creates a new instance of <code>NotEnoughMoneyException</code> without detail message.
     */
    public NotEnoughMoneyException() {
    }

    /**
     * Constructs an instance of <code>NotEnoughMoneyException</code> with the specified detail message.
     * @param msg the detail message.
     */
    public NotEnoughMoneyException(String msg) {
        super(msg);
    }
}
