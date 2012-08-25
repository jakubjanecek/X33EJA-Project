<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="header.jsp" %>

<title>Add Template - Internet Banking</title>

<%@include file="menu.jsp" %>
<f:view>
    <div id="content">
        <div class="padding">
            <h2>Customers</h2>
            <h:form id="templates">
                <h:outputText value="#{UserManagedBean.actionMessage}" styleClass="infoMsg" />
                <p><a href="addCustomer.jsf">Add customer</a></p>
                <h:dataTable value="#{UserManagedBean.allCustomers}" var="item">
                    <h:column>
                        <f:facet name="header"><h:outputText value="Name" /></f:facet>
                        <h:outputText value="#{item.name}" />
                    </h:column>
                    <h:column>
                        <f:facet name="header"><h:outputText value="Surname" /></f:facet>
                        <h:outputText value="#{item.surname}" />
                    </h:column>
                    <h:column>
                        <f:facet name="header"><h:outputText value="City" /></f:facet>
                        <h:outputText value="#{item.contact.city}" />
                    </h:column>
                    <h:column>
                        <f:facet name="header"><h:outputText value="Edit" /></f:facet>
                        <custom:radioButton id="edit" name="edit" overrideName="true" value="#{UserManagedBean.id}" itemValue="#{item.id}" />
                    </h:column>
                </h:dataTable>
                <h:commandButton id="editButton" value="Edit" action="#{UserManagedBean.edit}" />
                <h:commandButton id="deleteButton" value="Delete" action="#{UserManagedBean.delete}" />
                <h:message for="deleteButton" styleClass="error" />
            </h:form>

        </div>
    </div>
</f:view>
</body>
</html>