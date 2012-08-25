<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="header.jsp" %>

<title>Add Template - Internet Banking</title>

<%@include file="menu.jsp" %>
<f:view>
    <div id="content">
        <div class="padding">
            <h2>Add User</h2>
            <h:form id="addUser">
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
                    <h:inputText id="username" required="true" requiredMessage="The username must be between 5 and 255 characters long" validatorMessage="The password must be between 5 and 255 characters long" value="#{UserManagedBean.username}" title="username">
                        <f:validateLength minimum="5" maximum="255" />
                    </h:inputText>
                    <h:message for="username" styleClass="error" />
                    <h:outputText value="Password:"/>
                    <h:inputText id="password" validatorMessage="The password must be between 5 and 255 characters long" required="true" requiredMessage="The password must be between 5 and 255 characters long" value="#{UserManagedBean.password}" title="password">
                        <f:validateLength minimum="5" maximum="255" />
                    </h:inputText>
                    <h:message for="password" styleClass="error" />
                    <h:outputText value="Advisors:"/>
                    <h:selectManyListbox requiredMessage="At least 1 advisor has to be selected" required="true" id="menu" value="#{UserManagedBean.advisors}">
                        <f:selectItems value="#{UserManagedBean.allAdvisors}" />
                    </h:selectManyListbox>
                    <h:message for="menu" styleClass="error" />
                    <h:commandButton value="Add" id="addButton" action="#{UserManagedBean.addCustomer}" />
                </h:panelGrid>
            </h:form>

        </div>
    </div>
</f:view>
</body>
</html>