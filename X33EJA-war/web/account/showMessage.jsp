<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="header.jsp" %>

<f:view>

    <title><h:outputText value="#{l10n.show_message}" /> - <h:outputText value="#{l10n.banking}" /></title>

    <%@include file="menu.jsp" %>
    <div id="content">
        <div class="padding">
            <h2><h:outputText value="#{l10n.message}" /></h2>
            <h:outputText value="#{MessageManagedBean.message}" />
        </div>
    </div>

</f:view>

<%@include file="footer.jsp" %>