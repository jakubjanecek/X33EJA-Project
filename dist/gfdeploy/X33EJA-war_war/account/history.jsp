<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="header.jsp" %>

<f:view>

    <title><h:outputText value="#{l10n.history}" /> - <h:outputText value="#{l10n.banking}" /></title>

    <%@include file="menu.jsp" %>
    <div id="content">
        <div class="padding">
            <h2><h:outputText value="#{l10n.history}" /></h2>
            <h:outputText value="#{BankTransactionManagedBean.actionMessage}" styleClass="infoMsg" />
            <h3><h:outputText value="#{l10n.account}" /></h3>
            <h:form>
                <h:selectOneMenu value="#{BankTransactionManagedBean.selectedAccountId}" onchange="this.form.submit()">
                    <f:selectItems value="#{BankTransactionManagedBean.customersAccountsById}"/>
                </h:selectOneMenu>
            </h:form>
            <h3><h:outputText value="#{l10n.incoming_transactions}" /></h3>
            <h:dataTable var="item" value="#{BankTransactionManagedBean.incomingBankTransactions}">
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="#{l10n.from}" />
                    </f:facet>
                    <h:outputText value="#{item.fromAccount.number}"/>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="#{l10n.to}" />
                    </f:facet>
                    <h:outputText value="#{item.toAccount.number}"/>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="#{l10n.amount}" />
                    </f:facet>
                    <h:outputText value="#{item.amount}"/>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="#{l10n.date}" />
                    </f:facet>
                    <h:outputText value="#{item.dateTrans}"/>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="#{l10n.var_sym}" />
                    </f:facet>
                    <h:outputText value="#{item.varSym}"/>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="#{l10n.spec_sym}" />
                    </f:facet>
                    <h:outputText value="#{item.specSym}"/>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="#{l10n.cons_sym}" />
                    </f:facet>
                    <h:outputText value="#{item.consSym}"/>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="#{l10n.message}" />
                    </f:facet>
                    <h:outputText value="#{item.message}"/>
                </h:column>
            </h:dataTable>

            <h3><h:outputText value="#{l10n.outcoming_transactions}" /></h3>
            <h:dataTable var="item" value="#{BankTransactionManagedBean.outcomingBankTransactions}">
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="#{l10n.from}" />
                    </f:facet>
                    <h:outputText value="#{item.fromAccount.number}"/>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="#{l10n.to}" />
                    </f:facet>
                    <h:outputText value="#{item.toAccount.number}"/>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="#{l10n.amount}" />
                    </f:facet>
                    <h:outputText value="#{item.amount}"/>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="#{l10n.date}" />
                    </f:facet>
                    <h:outputText value="#{item.dateTrans}"/>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="#{l10n.var_sym}" />
                    </f:facet>
                    <h:outputText value="#{item.varSym}"/>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="#{l10n.spec_sym}" />
                    </f:facet>
                    <h:outputText value="#{item.specSym}"/>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="#{l10n.cons_sym}" />
                    </f:facet>
                    <h:outputText value="#{item.consSym}"/>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="#{l10n.message}" />
                    </f:facet>
                    <h:outputText value="#{item.message}"/>
                </h:column>
            </h:dataTable>

        </div>
    </div>

</f:view>

<%@include file="footer.jsp" %>