<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="header.jsp" %>

<f:view>

    <title><h:outputText value="#{l10n.accounts}" /> - <h:outputText value="#{l10n.banking}" /></title>

    <%@include file="menu.jsp" %>
    <div id="content">
        <div class="padding">
            <h2><h:outputText value="#{l10n.accounts}" /></h2>
            <h:dataTable value="#{AccountManagedBean.usersAccounts}"  var="item">
                <h:column>
                    <f:facet name="header"><h:outputText value="#{l10n.number}" /></f:facet>
                    <h:outputText value="#{item.number}" />
                </h:column>
                <h:column>
                    <f:facet name="header"><h:outputText value="#{l10n.balance}" /></f:facet>
                    <h:outputText value="#{item.balance}" />
                </h:column>
            </h:dataTable>

            <br />
            <h2><h:outputText value="#{l10n.advisors}" /></h2>

            <h:dataTable value="#{UserManagedBean.myAdvisors}" var="item">
                    <h:column>
                        <f:facet name="header"><h:outputText value="#{l10n.name}" /></f:facet>
                        <h:outputText value="#{item.name}" />
                    </h:column>
                    <h:column>
                        <f:facet name="header"><h:outputText value="#{l10n.surname}" /></f:facet>
                        <h:outputText value="#{item.surname}" />
                    </h:column>
                    <h:column>
                        <f:facet name="header"><h:outputText value="#{l10n.phoneNumber}" /></f:facet>
                        <h:outputText value="#{item.phoneNumber}" />
                    </h:column>
                </h:dataTable>
        </div>
    </div>

</f:view>

<%@include file="footer.jsp" %>
