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
<title>Ajuste de Stock</title>
<link rel="stylesheet" href="css/principal.css"  type="text/css" />

</head>
<body>
<f:view>
		<c:import url="mensajes.jsp"></c:import>
		<htm:div id="divPrincipal" styleClass="corpoPrincipal">
			<c:import url="cabecera.jsp">
				<c:param name="titulo" value="Solicitud de Ajuste de Stock"></c:param>
			</c:import>
			<c:import url="menu.jsp">
			</c:import>
			<htm:div styleClass="corpoEsquerda">
				<htm:h2>Solicitud efetuada con Exito!</htm:h2>
				<htm:h4>Solicite autorización para realizar los ajustes de existencia en el Stock.</htm:h4>
				<htm:fieldset style="borda">
					<htm:legend style="legenda">Detalle de ajuste</htm:legend>
						<t:dataTable value="#{stockBean.ajusteStockSuccess}" var="ajusteStock"
						rowClasses="linhaClara, linhaEscura" styleClass="dataTableNotaFiscal"
						renderedIfEmpty="false" 
						>
							<t:column>
								<f:facet name="header"><h:outputText value="Cod."></h:outputText></f:facet>
								<h:outputText value="#{ajusteStock.articulo.codigo}"></h:outputText>
							</t:column>
							<t:column>
								<f:facet name="header"><h:outputText value="Articulo"></h:outputText></f:facet>
								<h:outputText value="#{ajusteStock.articulo.artnomreal}"></h:outputText>
							</t:column>
							<t:column>
								<f:facet name="header"><h:outputText value="Articulo"></h:outputText></f:facet>
								<h:outputText value="#{ajusteStock.articulo.artcodorigen}"></h:outputText>
							</t:column>
							<t:column>
								<f:facet name="header"><h:outputText value="Disp."></h:outputText></f:facet>
								<h:outputText value="#{ajusteStock.articulo.artstockmin}"></h:outputText>
							</t:column>
							<t:column>
								<f:facet name="header"><h:outputText value="Cant.Ajuste"></h:outputText></f:facet>
								<h:outputText value="#{ajusteStock.ajcant_solicitada}"></h:outputText>
							</t:column>
						</t:dataTable>
				</htm:fieldset>
			</htm:div>
		</htm:div>
</f:view>
</body>
</html>