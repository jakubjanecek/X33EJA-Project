<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="header.jsp" %>

<title>Add Template - Internet Banking</title>

<%@include file="menu.jsp" %>
<f:view>
    <div id="content">
        <div class="padding">
            <h2>Edit User</h2>
            <h:outputText value="#{UserManagedBean.actionMessage}" styleClass="infoMsg" />
            <h:form id="editUser">
                <h:panelGrid columns="3">
                    <h:outputText value="Name:"/>
                    <h:inputText id="name" value="#{UserManagedBean.name}" title="Name" required="true">
                        <f:validateLength minimum="0" maximum="255" />
                    </h:inputText>
                    <h:message for="name" styleClass="error" />
                    <h:outputText value="Surname:"/>
                    <h:inputText id="surname" value="#{UserManagedBean.surname}" title="Surname" required="true">
                        <f:validateLength minimum="0" maximum="255" />
                    </h:inputText>
                    <h:message for="name" styleClass="error" />
                    <h:outputText value="House number:"/>
                    <h:inputText id="houseNumber" value="#{UserManagedBean.houseNumber}" title="houseNumber">
                        <f:validateLongRange minimum="0" maximum="10000" />
                    </h:inputText>
                    <h:message for="houseNumber" styleClass="error" />
                    <h:outputText value="Phone number 1:"/>
                    <h:inputText id="phoneNumber1" value="#{UserManagedBean.phoneNumber1}" title="phoneNumber1">
                        <f:validateLength minimum="0" maximum="20" />
                    </h:inputText>
                    <h:message for="phoneNumber1" styleClass="error" />
                    <h:outputText value="Phone number 2:"/>
                    <h:inputText id="phoneNumber2" value="#{UserManagedBean.phoneNumber2}" title="phoneNumber2">
                        <f:validateLength minimum="0" maximum="20" />
                    </h:inputText>
                    <h:message for="phoneNumber2" styleClass="error" />
                    <h:outputText value="City:"/>
                    <h:inputText id="city" value="#{UserManagedBean.city}" title="city">
                        <f:validateLength minimum="0" maximum="255" />
                    </h:inputText>
                    <h:message for="city" styleClass="error" />
                    <h:outputText value="Street:"/>
                    <h:inputText id="street" value="#{UserManagedBean.street}" title="street">
                        <f:validateLength minimum="0" maximum="255" />
                    </h:inputText>
                    <h:message for="street" styleClass="error" />
                    <h:outputText value="ZIP:"/>
                    <h:inputText id="zip" value="#{UserManagedBean.zip}" title="zip">
                        <f:validateLongRange minimum="0" maximum="100000" />
                    </h:inputText>
                    <h:message for="zip" styleClass="error" />
                    <h:outputText value="Email:"/>
                    <h:inputText id="email" value="#{UserManagedBean.email}" title="email">
                        <f:validateLength minimum="0" maximum="255" />
                    </h:inputText>
                    <h:message for="email" styleClass="error" />
                    <h:outputText value="Username:"/>
                    <h:inputText id="username" value="#{UserManagedBean.username}" title="username">
                        <f:validateLength minimum="5" maximum="255" />
                    </h:inputText>
                    <h:message for="username" styleClass="error" />
                    <h:outputText value="Password:"/>
                    <h:inputText id="password" value="#{UserManagedBean.password}" title="password">
                        <f:validateLength minimum="5" maximum="255" />
                    </h:inputText>
                    <h:message for="password" styleClass="error" />
                    <h:outputText value="Advisors:"/>
                    <h:selectManyListbox requiredMessage="At least 1 advisor has to be selected" required="true" id="menu" value="#{UserManagedBean.advisors}">
                        <f:selectItems value="#{UserManagedBean.allAdvisors}" />
                    </h:selectManyListbox>
                    <h:message for="menu" styleClass="error" />
                    <h:commandButton value="Edit" id="editButton" action="#{UserManagedBean.editUser}" />
                </h:panelGrid>
            </h:form>

            <br/>
            <h2>Accounts</h2>
            <h:form id="accounts">
                <h:dataTable value="#{UserManagedBean.userAccounts}"  var="item">
                    <h:column>
                        <f:facet name="header"><h:outputText value="Number" /></f:facet>
                        <h:outputText value="#{item.number}" />
                    </h:column>
                    <h:column>
                        <f:facet name="header"><h:outputText value="Balance" /></f:facet>
                        <h:outputText value="#{item.balance}" />
                    </h:column>
                    <h:column>
                        <f:facet name="header"><h:outputText value="Delete" /></f:facet>
                        <custom:radioButton id="delete" name="delete" overrideName="true" value="#{UserManagedBean.idAccount}" itemValue="#{item.id}" />
                    </h:column>
                </h:dataTable>
                <h:commandButton id="deleteButton" value="Delete" action="#{UserManagedBean.deleteAccount}" />
                <h:message for="deleteButton" styleClass="error" />
            </h:form>
            <br/>
            <h2>Add account</h2>
            <h:form id="addAccount">
                <h:panelGrid columns="3">
                    <h:outputText value="Number:"/>
                    <h:inputText id="number" value="#{UserManagedBean.accountNumber}" title="Number" required="true">
                        <f:validateLength minimum="4" maximum="30" />
                    </h:inputText>
                    <h:message for="number" styleClass="error" />
                    <h:outputText value="Balance:"/>
                    <h:inputText id="balance" value="#{UserManagedBean.accountBalance}" title="Balance" required="true">
                        <f:validateLongRange minimum="0" maximum="999999999" />
                    </h:inputText>
                    <h:message for="balance" styleClass="error" />
                </h:panelGrid>
                <h:commandButton id="addButton" value="Add" action="#{UserManagedBean.addAccount}" />
            </h:form>

        </div>
    </div>
</f:view>
</body>
</html>