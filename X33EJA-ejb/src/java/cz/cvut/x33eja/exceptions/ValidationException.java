package cz.cvut.x33eja.exceptions;

/**
 *
 * @author Jakub Janeček
 */
public class ValidationException extends Exception {

    public static enum ERROR_TYPE {

        AMOUNT_ERROR, CONS_ERROR, VAR_ERROR, SPEC_ERROR, MSG_ERROR, PASS_ERROR, ROLE_ERROR, USERNAME_ERROR

    }
    private ERROR_TYPE type;

    /**
     * Creates a new instance of <code>ValidationException</code> without detail message.
     */
    public ValidationException() {
    }

    public ValidationException(ERROR_TYPE type) {
        this.type = type;
    }

    /**
     * Constructs an instance of <code>ValidationException</code> with the specified detail message.
     * @param msg the detail message.
     */
    public ValidationException(String msg) {
        super(msg);
    }

    public ERROR_TYPE getType() {
        return type;
    }
}
