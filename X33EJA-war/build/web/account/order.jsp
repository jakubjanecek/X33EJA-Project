<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="header.jsp" %>

<f:view>

    <title><h:outputText value="#{l10n.order}" /> - <h:outputText value="#{l10n.banking}" /></title>

    <%@include file="menu.jsp" %>
    <div id="content">
        <div class="padding">
            <h2><h:outputText value="#{l10n.order}" /></h2>
            <h3><h:outputText value="#{l10n.create}" /></h3>
            <p><a href="useTemplate.jsf"><h:outputText value="#{l10n.use_template}" /></a></p>
            <h:form>
                <h:panelGrid columns="3">
                    <h:outputText value="#{l10n.from}" />
                    <h:selectOneMenu value="#{BankTransactionManagedBean.fromAccount}" >
                        <f:selectItems value="#{BankTransactionManagedBean.customersAccounts}"/>
                    </h:selectOneMenu>
                    <h:message for="fromAccount" styleClass="error"/>
                    <h:outputText value="#{l10n.to}"/>
                    <h:inputText id="toAccount" value="#{BankTransactionManagedBean.toAccount}" validator="#{BankTransactionManagedBean.validateNumber}" title="#{l10n.to}" required="true" />
                    <h:message for="toAccount" styleClass="error"/>
                    <h:outputText value="#{l10n.amount}"/>
                    <h:inputText id="amount" value="#{BankTransactionManagedBean.amount}" title="#{l10n.amount}" required="true">
                        <f:validateLongRange minimum="0" maximum="999999999" />
                    </h:inputText>
                    <h:message for="amount" styleClass="error" />
                    <h:outputText value="#{l10n.cons_sym}"/>
                    <h:inputText id="consSym" value="#{BankTransactionManagedBean.consSym}" title="#{l10n.cons_sym}">
                        <f:validateLongRange minimum="0" maximum="10000" />
                    </h:inputText>
                    <h:message for="consSym" styleClass="error" />
                    <h:outputText value="#{l10n.spec_sym}"/>
                    <h:inputText id="specSym" value="#{BankTransactionManagedBean.specSym}" title="#{l10n.spec_sym}">
                        <f:validateLongRange minimum="0" maximum="100000000" />
                    </h:inputText>
                    <h:message for="specSym" styleClass="error" />
                    <h:outputText value="#{l10n.var_sym}"/>
                    <h:inputText id="varSym" value="#{BankTransactionManagedBean.varSym}" title="#{l10n.var_sym}">
                        <f:validateLongRange minimum="0" maximum="100000000" />
                    </h:inputText>
                    <h:message for="varSym" styleClass="error" />
                    <h:outputText value="#{l10n.message}"/>
                    <h:inputText id="message" value="#{BankTransactionManagedBean.message}" title="#{l10n.message}">
                        <f:validateLength maximum="255" />
                    </h:inputText>
                    <h:message for="message" styleClass="error" />
                    <h:commandButton value="#{l10n.order}" id="orderButton" action="#{BankTransactionManagedBean.order}" />
                    <h:message for="orderButton" styleClass="error" />
                </h:panelGrid>
            </h:form>

        </div>
    </div>

</f:view>

<%@include file="footer.jsp" %>


