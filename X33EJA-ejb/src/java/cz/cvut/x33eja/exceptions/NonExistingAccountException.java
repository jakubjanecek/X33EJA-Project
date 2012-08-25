package cz.cvut.x33eja.exceptions;

/**
 *
 * @author Jakub Janeček
 */
public class NonExistingAccountException extends Exception {

    /**
     * Creates a new instance of <code>NonExistingAccountException</code> without detail message.
     */
    public NonExistingAccountException() {
    }

    /**
     * Constructs an instance of <code>NonExistingAccountException</code> with the specified detail message.
     * @param msg the detail message.
     */
    public NonExistingAccountException(String msg) {
        super(msg);
    }
}
