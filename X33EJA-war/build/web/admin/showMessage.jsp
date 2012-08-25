<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="header.jsp" %>

<title>Show message - Internet Banking</title>

<%@include file="menu.jsp" %>
<f:view>
    <div id="content">
        <div class="padding">
            <h2>Message</h2>
            <h:outputText value="#{MessageManagedBean.message}" />
        </div>
    </div>
</f:view>
</body>
</html>