<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="header.jsp" %>

<f:view>

    <title><h:outputText value="#{l10n.edit_template}" /> - <h:outputText value="#{l10n.banking}" /></title>

    <%@include file="menu.jsp" %>
    <div id="content">
        <div class="padding">
            <h2><h:outputText value="#{l10n.edit_template}" /></h2>
            <h:form id="editTemplate">
                <h:inputHidden id="id" value="#{TemplateManagedBean.id}" />
                <h:panelGrid columns="3">
                    <h:outputText value="#{l10n.amount}"/>
                    <h:inputText id="amount" value="#{TemplateManagedBean.amount}" title="#{l10n.amount}" required="true">
                        <f:validateLongRange minimum="0" maximum="999999999" />
                    </h:inputText>
                    <h:message for="amount" styleClass="error" />
                    <h:outputText value="#{l10n.spec_sym}"/>
                    <h:inputText id="specSym" value="#{TemplateManagedBean.specSym}" title="#{l10n.spec_sym}">
                        <f:validateLongRange minimum="0" maximum="100000000" />
                    </h:inputText>
                    <h:message for="specSym" styleClass="error" />
                    <h:outputText value="#{l10n.cons_sym}"/>
                    <h:inputText id="consSym" value="#{TemplateManagedBean.consSym}" title="#{l10n.cons_sym}">
                        <f:validateLongRange minimum="0" maximum="10000" />
                    </h:inputText>
                    <h:message for="consSym" styleClass="error" />
                    <h:outputText value="#{l10n.var_sym}"/>
                    <h:inputText id="varSym" value="#{TemplateManagedBean.varSym}" title="#{l10n.var_sym}">
                        <f:validateLongRange minimum="0" maximum="100000000" />
                    </h:inputText>
                    <h:message for="varSym" styleClass="error" />
                    <h:outputText value="#{l10n.message}"/>
                    <h:inputText id="message" value="#{TemplateManagedBean.message}" title="#{l10n.message}">
                        <f:validateLength maximum="255" />
                    </h:inputText>
                    <h:message for="message" styleClass="error" />
                    <h:outputText value="#{l10n.account}"/>
                    <h:inputText id="account" value="#{TemplateManagedBean.account}" title="#{l10n.account}">
                        <f:validateLength maximum="255" />
                    </h:inputText>
                    <h:message for="account" styleClass="error" />
                    <h:commandButton value="#{l10n.edit}" id="editButton" action="#{TemplateManagedBean.editTemplate}" />
                </h:panelGrid>
            </h:form>
        </div>
    </div>

</f:view>

<%@include file="footer.jsp" %>