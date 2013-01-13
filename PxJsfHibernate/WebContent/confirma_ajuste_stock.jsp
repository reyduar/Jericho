<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@ taglib uri="http://myfaces.apache.org/trinidad" prefix="tr" %>
<%@ taglib uri="http://myfaces.apache.org/trinidad/html" prefix="trh" %>
<%@ taglib uri="http://myfaces.apache.org/tomahawk" prefix="t" %>
<%@ taglib uri="http://jsftutorials.net/htmLib" prefix="htm" %>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Autorización Ajuste</title>
<link rel="stylesheet" href="css/principal.css"  type="text/css" />
</head>
<body>
<f:view>
		<c:import url="mensajes.jsp"></c:import>
		<htm:div id="divPrincipal" styleClass="corpoPrincipal">
			<c:import url="cabecera.jsp">
				<c:param name="titulo" value="Confirmar Ajuste de Stock"></c:param>
			</c:import>
			<c:import url="menu.jsp">
			</c:import>
			<htm:div styleClass="corpoEsquerda">
				<htm:fieldset style="borda">
					<htm:legend style="legenda">Confirmar Ajustes</htm:legend>
					<h:form id="baixaEstoque">
						<t:dataTable value="#{confirmaAjusteStock.pendientesConfirmar}" var="ajuste"
						rowClasses="linhaClara, linhaEscura" styleClass="dataTableProdutos"
						renderedIfEmpty="false" binding="#{confirmaAjusteStock.dataTableConfirmarAjuste}"
						>
							<t:column>
								<f:facet name="header"><h:outputText value="Articulo"></h:outputText></f:facet>
								<h:outputText value="#{ajuste.articulo.artnomreal}"></h:outputText>
							</t:column>
							<t:column>
								<f:facet name="header"><h:outputText value="Disp." title="Cantidad disponible"></h:outputText></f:facet>
								<h:outputText value="#{ajuste.articulo.artstockmin}"></h:outputText>
							</t:column>
							<t:column>
								<f:facet name="header"><h:outputText value="Soli." title="Cantidad Solicitada"></h:outputText></f:facet>
								<h:outputText value="#{ajuste.ajcant_solicitada}"></h:outputText>
							</t:column>
							<t:column>
								<f:facet name="header"><h:outputText value="Conf." title="Cantidad Confirmada"></h:outputText></f:facet>
								<h:inputText value="#{ajuste.ajcant_confirmada}" converterMessage="Valor invalido">
									<f:converter converterId="javax.faces.Integer" />
								</h:inputText>
							</t:column>
							<h:column>
								<h:commandButton styleClass="panelBotaoConfirmar" value="Confirmar" action="#{confirmaAjusteStock.confirmar}"
								onclick="return confirm('Confirmar Ajuste?');"
								></h:commandButton>
							</h:column>
						</t:dataTable>
					</h:form>
				</htm:fieldset>
			</htm:div>
		</htm:div>
</f:view>
</body>
</html>