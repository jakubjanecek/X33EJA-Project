<%@page contentType="text/html" pageEncoding="UTF-8"%>
</head>
<body>

    <div id="header">
        <div id="headerLeft">
            <strong id="logo">čvutBank<span></span></strong>
        </div>
        <div id="headerRight">
            <div id="logoutMenu">
                <ul>
                    <li><a href="/X33EJA-war/logout.jsp" title="Logout"><h:outputText value="#{l10n.logout}" /></a></li>
                </ul>
            </div>
            <h1><h:outputText value="#{l10n.banking}" /></h1>
            <ul id="menu">
                <li><a href="/X33EJA-war/account/index.jsf" title=""><h:outputText value="#{l10n.accounts}" /></a></li>
                <li><a href="/X33EJA-war/account/order.jsf" title=""><h:outputText value="#{l10n.order}" /></a></li>
                <li><a href="/X33EJA-war/account/history.jsf" title=""><h:outputText value="#{l10n.history}" /></a></li>
                <li><a href="/X33EJA-war/account/templates.jsf" title=""><h:outputText value="#{l10n.templates}" /></a></li>
                <li><a href="/X33EJA-war/account/messages.jsf" title=""><h:outputText value="#{l10n.messages}" /></a></li>
            </ul>
        </div>
    </div>
