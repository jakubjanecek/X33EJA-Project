<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="header.jsp" %>

<f:view>

    <title><h:outputText value="#{l10n.templates}" /> - <h:outputText value="#{l10n.banking}" /></title>

    <%@include file="menu.jsp" %>

    <div id="content">
        <div class="padding">
            <h2><h:outputText value="#{l10n.templates}" /></h2>
            <h:form id="templates">
                <h:outputText value="#{TemplateManagedBean.actionMessage}" styleClass="infoMsg" />
                <p><h:commandLink action="#{TemplateManagedBean.add}" value="#{l10n.add_template}" /></p>
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
                        <custom:radioButton id="edit" name="edit" overrideName="true" value="#{TemplateManagedBean.id}" itemValue="#{item.id}" />
                    </h:column>
                </h:dataTable>
                <h:commandButton id="editButton" value="#{l10n.edit}" action="#{TemplateManagedBean.edit}" />
                <h:commandButton id="deleteButton" value="#{l10n.delete}" action="#{TemplateManagedBean.deleteTemplate}" />
                <h:message for="deleteButton" styleClass="error" />
            </h:form>
        </div>
    </div>

</f:view>

<%@include file="footer.jsp" %>