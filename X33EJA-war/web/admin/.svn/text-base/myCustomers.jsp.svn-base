<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="header.jsp" %>

<title>Add Template - Internet Banking</title>

<%@include file="menu.jsp" %>
<f:view>
    <div id="content">
        <div class="padding">
            <h2>My customers</h2>
            
                <h:dataTable value="#{UserManagedBean.myCustomers}" var="item">
                    <h:column>
                        <f:facet name="header"><h:outputText value="Name" /></f:facet>
                        <h:outputText value="#{item.name}" />
                    </h:column>
                    <h:column>
                        <f:facet name="header"><h:outputText value="Surname" /></f:facet>
                        <h:outputText value="#{item.surname}" />
                    </h:column>
                    <h:column>
                        <f:facet name="header"><h:outputText value="City" /></f:facet>
                        <h:outputText value="#{item.contact.city}" />
                    </h:column>
                    <h:column>
                        <f:facet name="header"><h:outputText value="Phone number 1" /></f:facet>
                        <h:outputText value="#{item.contact.phoneNumber1}" />
                    </h:column>
                    <h:column>
                        <f:facet name="header"><h:outputText value="Phone number 2" /></f:facet>
                        <h:outputText value="#{item.contact.phoneNumber2}" />
                    </h:column>
                </h:dataTable>

        </div>
    </div>
</f:view>
</body>
</html>