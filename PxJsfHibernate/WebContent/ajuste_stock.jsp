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
				<c:param name="titulo" value="Solicitar Ajuste de Stock"></c:param>
			</c:import>
			<c:import url="menu.jsp">
			</c:import>
			<htm:div styleClass="corpoEsquerda">
				<htm:fieldset style="borda">
					<htm:legend style="legenda">Articulo</htm:legend>
					<h:form id="formBaixaEstoque">
						<h:dataTable value="#{stockBean.articulosStock}" var="articulo"
						rowClasses="linhaClara, linhaEscura" styleClass="dataTableProdutos"
						binding="#{stockBean.dataTableArticulosDisponibles}">
							<h:column>
								<f:facet name="header"><h:outputText value="Cod."></h:outputText></f:facet>
								<h:outputText value="#{articulo.codigo}"></h:outputText>
							</h:column>
							<h:column>
								<f:facet name="header"><h:outputText value="Articulo"></h:outputText></f:facet>
								<h:outputText value="#{articulo.artnomreal}"></h:outputText>
							</h:column>
							<h:column>
								<f:facet name="header"><h:outputText value="Articulo"></h:outputText></f:facet>
								<h:outputText value="#{articulo.artcodorigen}"></h:outputText>
							</h:column>
							<h:column>
								<f:facet name="header"><h:outputText value="Disp."></h:outputText></f:facet>
								<h:outputText value="#{articulo.artstockmin}"></h:outputText>
							</h:column>
							<h:column>
								<f:facet name="header"><h:outputText value="Incluir"></h:outputText></f:facet>
								<h:commandButton styleClass="panelBotaoAdicionar" value="Incluir" action="#{stockBean.incluirArticulo}"></h:commandButton>
							</h:column>
						</h:dataTable>
					</h:form>
					</htm:fieldset>
					<htm:fieldset style="borda">
					<htm:legend style="legenda">Articulos Seleccionados</htm:legend>
					<h:form id="baixaEstoque">
						<t:dataTable value="#{stockBean.articulosSeleccionados}" var="ajusteStock"
						rowClasses="linhaClara, linhaEscura" styleClass="dataTableProdutos"	
						renderedIfEmpty="false" binding="#{stockBean.dataTableAjusteStock}"
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
								<f:facet name="header"><h:outputText value="Cant."></h:outputText></f:facet>
								<h:inputText value="#{ajusteStock.ajcant_solicitada}" converterMessage="Cantidad: Valor inválido ">
										<f:converter converterId="javax.faces.Integer"/>
								</h:inputText>
							</t:column>
							<h:column>
								<f:facet name="header"><h:outputText value="Excluir"></h:outputText></f:facet>
								<h:commandButton styleClass="panelBotaoSubtrair" value="Excluir" action="#{stockBean.excluirArticulo}"></h:commandButton>
							</h:column>
						</t:dataTable>
						<h:commandButton styleClass="panelBotaoConfirmar" value="Confirmar" action="#{stockBean.confirmarAjusteStock}"></h:commandButton>
					</h:form>
					
				</htm:fieldset>
			</htm:div>
		</htm:div>
</f:view>
</body>
</html>