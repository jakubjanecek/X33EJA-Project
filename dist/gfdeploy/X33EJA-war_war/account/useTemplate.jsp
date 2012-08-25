<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="header.jsp" %>

<f:view>

    <title><h:outputText value="#{l10n.use_template}" /> - <h:outputText value="#{l10n.banking}" /></title>

    <%@include file="menu.jsp" %>
    <div id="content">
        <div class="padding">

            <h2><h:outputText value="#{l10n.use_template}"/></h2>
            <h3><h:outputText value="#{l10n.please_select_template}" /></h3>
            <h:form id="templates">
                <h:outputText value="#{TemplateManagedBean.actionMessage}" styleClass="infoMsg" />
                <h:dataTable value="#{TemplateManagedBean.allTemplates}" var="item">
                    <h:column>
                        <f:facet name="header"><h:outputText value="#{l10n.amount}" /></f:facet>
                        <h:outputText value="#{item.amount}" />
                    </h:column>
                    <h:column>
                        <f:facet name="header"><h:outputText value="#{l10n.cons_sym}" /></f:facet>
                        <h:outputText value="#{item.consSym}" />
                    </h:column>
                    <h:column>
                        <f:facet name="header"><h:outputText value="#{l10n.spec_sym}" /></f:facet>
                        <h:outputText value="#{item.specSym}" />
                    </h:column>
                    <h:column>
                        <f:facet name="header"><h:outputText value="#{l10n.var_sym}" /></f:facet>
                        <h:outputText value="#{item.varSym}" />
                    </h:column>
                    <h:column>
                        <f:facet name="header"><h:outputText value="#{l10n.message}" /></f:facet>
                        <h:outputText value="#{item.message}" />
                    </h:column>
                    <h:column>
                        <f:facet name="header"><h:outputText value="#{l10n.account}" /></f:facet>
                        <h:outputText value="#{item.account}" />
                    </h:column>
                    <h:column>
                        <f:facet name="header"><h:outputText value="#{l10n.edit}" /></f:facet>
                        <custom:radioButton id="edit" name="edit" overrideName="true" value="#{BankTransactionManagedBean.id}" itemValue="#{item.id}" />
                    </h:column>
                </h:dataTable>
                <h:commandButton id="select" value="#{l10n.select}" action="#{BankTransactionManagedBean.select}" />
                <h:message for="select" styleClass="error" />
            </h:form>
        </div>
    </div>

</f:view>

<%@include file="footer.jsp" %>
