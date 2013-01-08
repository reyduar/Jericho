<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@ taglib uri="http://myfaces.apache.org/trinidad" prefix="tr" %>
<%@ taglib uri="http://myfaces.apache.org/trinidad/html" prefix="trh" %>
<%@ taglib uri="http://myfaces.apache.org/tomahawk" prefix="t" %>
<%@ taglib uri="http://jsftutorials.net/htmLib" prefix="htm" %>

<f:subview id="s_mensagens" rendered="#{not empty facesContext.maximumSeverity}">
	<div id="mensagens" >
		<h:panelGrid id="painelMensagens" columns="2">
			<h:graphicImage value="images/delete-comment-red.gif" title="Erro!"></h:graphicImage>
			<h:messages></h:messages>
		</h:panelGrid>
	</div>
</f:subview>

