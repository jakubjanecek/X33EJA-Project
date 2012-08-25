<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="header.jsp" %>

<title>Cashier Office - Internet Banking</title>

<%@include file="menu.jsp" %>
<f:view>
    <div id="content">
        <div class="padding">
            <h2>Cashier Office</h2>
            <h:outputText value="#{BankTransactionManagedBean.actionMessage}" styleClass="infoMsg" />
            <h:form>
                <h:panelGrid columns="3">
                    <h:outputText value="Number:" />
                    <h:inputText id="number" required="true" requiredMessage="Number cannot be empty!" validator="#{BankTransactionManagedBean.validateNumber}" value="#{BankTransactionManagedBean.cashierNumber}">
                        <f:validateLength minimum="4" maximum="30" />
                    </h:inputText>
                    <h:message for="number" styleClass="error" />
                    <h:outputText value="Amount"/>
                    <h:inputText id="amount" required="true" requiredMessage="Amount cannot be empty!" validator="#{BankTransactionManagedBean.validateAmount}" value="#{BankTransactionManagedBean.cashierAmount}">
                        <f:validateLongRange minimum="0" maximum="999999999" />
                    </h:inputText>
                    <h:message for="amount" styleClass="error" />
                    <h:commandButton action="#{BankTransactionManagedBean.withdrawMoney}" value="Withdraw money" />
                    <h:commandButton id="button" action="#{BankTransactionManagedBean.putMoney}" value="Put money" />
                    <h:message for="button" />
                </h:panelGrid>
            </h:form>
        </div>
    </div>
</f:view>
</body>
</html>