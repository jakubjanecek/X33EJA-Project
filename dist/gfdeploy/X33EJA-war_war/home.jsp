<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<f:view>
    <html xmlns="http://www.w3.org/1999/xhtml">
        <head>
            <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
            <meta http-equiv="content-language" content="en" />
            <meta name="author" content="code: Jakub Janecek; janecjak@fel.cvut.cz" />
            <link rel="stylesheet" type="text/css" href="css/styles.css" />
            <title><h:outputText value="#{l10n.home}" /> - <h:outputText value="#{l10n.banking}" /></title>
        </head>
        <body>
            <div id="header">
                <div id="headerLeft">
                    <strong id="logo">čvutBank<span></span></strong>
                </div>
                <div id="headerRight">
                    <h1><h:outputText value="#{l10n.banking}" /></h1>
                </div>
            </div>


            <div id="content">
                <div class="padding">
                    <h2><h:outputText value="#{l10n.home}" /></h2>
                    <ul>
                        <li><a href="account/index.jsf" title="<h:outputText value="#{l10n.account_section}" />"><h:outputText value="#{l10n.account_section}" /></a></li>
                        <li><a href="admin/customers.jsf" title="<h:outputText value="#{l10n.admin_section}" />"><h:outputText value="#{l10n.admin_section}" /></a></li>
                    </ul>
                </div>
            </div>
        </body>
    </html>
</f:view>
