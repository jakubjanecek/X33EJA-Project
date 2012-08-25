<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="header.jsp" %>

<f:view>

    <title><h:outputText value="#{l10n.messages}" /> - <h:outputText value="#{l10n.banking}" /></title>

    <%@include file="menu.jsp" %>
    <div id="content">
        <div class="padding">
            <h2><h:outputText value="#{l10n.messages}" /></h2>
            <h:form id="messages">
                <h:outputText value="#{MessageManagedBean.actionMessage}" styleClass="infoMsg" />
                <h:dataTable value="#{MessageManagedBean.allMessages}" var="item">
                    <h:column>
                        <f:facet name="header"><h:outputText value="#{l10n.date}" /></f:facet>
                        <h:outputText value="#{item.dateMess}" />
                    </h:column>
                    <h:column>
                        <f:facet name="header"><h:outputText value="#{l10n.message}" /></f:facet>
                        <h:outputText value="#{item.text}" />
                    </h:column>
                    <h:column>
                        <f:facet name="header"><h:outputText value="#{l10n.show_message}" /></f:facet>
                        <custom:radioButton id="show" name="show" overrideName="true" value="#{MessageManagedBean.id}" itemValue="#{item.id}" />
                    </h:column>
                </h:dataTable>
                <h:commandButton id="showButton" value="#{l10n.show}" action="#{MessageManagedBean.showMessage}" />
                <h:message for="showButton" styleClass="error" />
            </h:form>
        </div>
    </div>

</f:view>

<%@include file="footer.jsp" %>