<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@ taglib uri="http://myfaces.apache.org/trinidad" prefix="tr" %>
<%@ taglib uri="http://myfaces.apache.org/trinidad/html" prefix="trh" %>
<%@ taglib uri="http://myfaces.apache.org/tomahawk" prefix="t" %>
<%@ taglib uri="http://jsftutorials.net/htmLib" prefix="htm" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Entrada Nota Fiscal</title>
<link rel="stylesheet" href="css/principal.css"  type="text/css" />
</head>
<body>
	<f:view>
		<htm:div id="mensagens" rendered="#{not empty facesContext.maximumSeverity}">
			<h:panelGrid id="painelMensagens" columns="2">
				<h:graphicImage value="images/delete-comment-red.gif" title="Erro!"></h:graphicImage>
				<h:messages></h:messages>
			</h:panelGrid>
		</htm:div>
		<htm:div id="divPrincipal" styleClass="corpoPrincipal">
			<h1 id="titulo">Factura de Proveedor</h1>
			<htm:div styleClass="corpoEsquerda">
				<htm:h2>Factura del proveedor guardada con éxito :)</htm:h2>
				<htm:div styleClass="previewNotaFiscal" rendered="#{not empty compraBean.compraSuccess}">
					<h:form id="notaFiscal">
						<t:div id="nrNF" forceId="true">
							<h:outputText styleClass="inputNrNF" value="Factura Nº "  />
							<h:outputText value="#{compraBean.compraSuccess.nroFactura}" >
							</h:outputText>
							<br />
							<htm:small style="font-size:10px;">Operación</htm:small>
							<h:outputText value="#{compraBean.compraSuccess.formaPago.nombre}" >
							</h:outputText>
						</t:div>
						<htm:div id="dadosNotaFiscal">
							<htm:p>Nombre/Razón Social:</htm:p><htm:big><h:outputText value="#{compraBean.compraSuccess.proveedor.nombre}"/></htm:big>
							<htm:p>Ruc/DNI/CI:</htm:p><htm:big><h:outputText value="#{compraBean.compraSuccess.proveedor.ruc}"/></htm:big>
							<htm:p>Ciudad:</htm:p><htm:big><h:outputText value="#{compraBean.compraSuccess.proveedor.ciudad.nombre}"/></htm:big>
							<htm:p>Dirección:</htm:p><htm:big><h:outputText value="#{compraBean.compraSuccess.proveedor.direccion}"/></htm:big>
							<htm:p>Teléfono:</htm:p><htm:big><h:outputText value="#{compraBean.compraSuccess.proveedor.telefono}"/></htm:big>
							<t:div id="calendario" forceId="true">
								<htm:p>
									<h:outputText value="Fecha Emisión:" />
									<h:outputText value="#{compraBean.compraSuccess.fecha}" />
								</htm:p>
							</t:div><!-- /calendario -->
						</htm:div><!-- /dadosNotaFiscal-->
						<t:dataTable id="produtosNotaFiscal" 
						value="#{compraBean.compraSuccess.detalle}" var="detalle" rowClasses="linhaEscuraNF, linhaClaraNF"
						styleClass="dataTableNotaFiscal" width="100%"
						>
							<h:column>
								<f:facet name="header">
									<h:outputText value="Nombre"></h:outputText>
								</f:facet>
								<h:outputText value="#{detalle.articulo.artnomreal}"></h:outputText>	
							</h:column>
							<h:column>
								<f:facet name="header">
									<h:outputText value="Cod."></h:outputText>
								</f:facet>
								<h:outputText value="#{detalle.articulo.artcodorigen}"></h:outputText>	
							</h:column>
							<h:column>
								<f:facet name="header">
									<h:outputText value="Precio"></h:outputText>
								</f:facet>
									<h:outputText value="#{detalle.precioUnitario}"></h:outputText>
							</h:column>
							<h:column>
								<f:facet name="header">
									<h:outputText value="Cant."></h:outputText>
								</f:facet>
								<h:outputText value="#{detalle.cantidad}"></h:outputText>
							</h:column>
							<h:column>
								<f:facet name="header">
									<h:outputText value="SubTotal"></h:outputText>
								</f:facet>
								<h:outputText value="#{detalle.subtotal}"></h:outputText>
								<f:facet name="footer">
									<h:outputText value="#{compraBean.compra.total}"  
									>
									</h:outputText>
								</f:facet>
							</h:column>
						</t:dataTable>
					</h:form>
				</htm:div><!-- /previewNotaFiscal -->
			</htm:div><!-- /corpoEsquerda -->
		</htm:div><!-- /divPrincipal -->
	</f:view>
</body>
</html>