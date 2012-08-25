<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="header.jsp" %>

<title>Send message - Internet Banking</title>

<%@include file="menu.jsp" %>
<f:view>
    <div id="content">
        <div class="padding">
            <h2>Send message</h2>
            <h:outputText value="#{MessageManagedBean.actionMessage}" styleClass="infoMsg" />
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="Message:" />
                    <h:message for="message" styleClass="error" />
                    <h:inputTextarea id="message" value="#{MessageManagedBean.message}" />
                    <h:commandButton action="#{MessageManagedBean.sendMessage}" value="Send message" />
                </h:panelGrid>
            </h:form>
            <br />
            <h2>Sent messages</h2>
            <h:form>
                <h:dataTable value="#{MessageManagedBean.allMessages}" var="item">
                    <h:column>
                        <f:facet name="header"><h:outputText value="Date" /></f:facet>
                        <h:outputText value="#{item.dateMess}" />
                    </h:column>
                    <h:column>
                        <f:facet name="header"><h:outputText value="Message" /></f:facet>
                        <h:outputText value="#{item.text}" />
                    </h:column>
                    <h:column>
                        <custom:radioButton id="show" name="show" overrideName="true" value="#{MessageManagedBean.id}" itemValue="#{item.id}" />
                    </h:column>
                </h:dataTable>
                <h:commandButton id="showButton" value="Show detail" action="#{MessageManagedBean.showMessage}" />
                <h:message for="showButton" styleClass="error" />
            </h:form>
        </div>
    </div>
</f:view>
</body>
</html>