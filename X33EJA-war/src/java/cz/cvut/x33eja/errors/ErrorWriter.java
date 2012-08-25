package cz.cvut.x33eja.errors;

import java.util.Iterator;
import javax.faces.application.FacesMessage;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;

/**
 *
 * @author Lukas Camra
 */
public class ErrorWriter {

    public static void writeError(String error, String id, FacesContext current) {
        FacesMessage message = new FacesMessage(error);
        FacesContext context = current;
        UIComponent mybutton = findComponent(context.getViewRoot(), id, current);
        context.addMessage(mybutton.getClientId(context), message);
    }

    private static UIComponent findComponent(UIComponent parent, String id, FacesContext current) {
        if (id.equals(parent.getId())) {
            return parent;
        }
        Iterator<UIComponent> kids = parent.getFacetsAndChildren();
        while (kids.hasNext()) {
            UIComponent kid = kids.next();
            UIComponent found = findComponent(kid, id, current);
            if (found != null) {
                return found;
            }
        }
        return null;
    }
}
