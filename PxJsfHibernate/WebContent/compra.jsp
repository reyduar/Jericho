<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<title>Factura de Proveedor</title>
<link rel="stylesheet" href="css/principal.css"  type="text/css" />
</head>
<body>
	<f:view>
	
		<htm:div id="divPrincipal" styleClass="corpoPrincipal">
			<c:import url="cabecera.jsp">
				<c:param name="titulo" value="Factura de Compra"></c:param>
			</c:import><!-- import: para barra de cabecera (JSTL) -->
			<c:import url="menu.jsp">
			</c:import>
			
			<c:import url="mensajes.jsp"></c:import><!-- import: para mensaje de error (JSTL) -->
			<htm:div styleClass="corpoEsquerda">
			
				<htm:fieldset styleClass="borda"><!-- fieldset de proveedor  -->
				
					<htm:legend styleClass="legenda">Proveedor</htm:legend>
					<h:form id="formProveedor"><!-- form general html  -->
						
						<tr:subform><!-- subform de trinidad  -->
							
								<h:panelGrid columns="2" styleClass="panelGrid"	columnClasses="colunaDireita, colunaEsquerda">
									<h:outputText value="Proveedor: " styleClass="labelInput"></h:outputText>
									
									<h:selectOneMenu id="selectProveedpr" value="#{compraBean.codigoProveedor }"
										title="Seleccione un proveedor" disabled="#{not empty compraBean.compra.proveedor}"
										required="true" requiredMessage="Seleccione un proveedor.">
										<f:selectItems value="#{compraBackingBean.proveedores  }" />
									</h:selectOneMenu>
									<h:panelGroup></h:panelGroup>
									
									<h:panelGroup>
										<h:commandButton id="confirmarProveedor" value="Confirmar" action="#{compraBean.comfirmarProveedor}" styleClass="panelBotaoConfirmar"></h:commandButton>
										<h:commandButton id="modificarProveedor" value="Modificar" actionListener="#{compraBean.modificarProveedor}" styleClass="panelBotaoEditar"></h:commandButton>
									</h:panelGroup><!-- grid grupo de botones  -->
									
								</h:panelGrid><!-- grid grupo de columnas  -->
							</tr:subform><!-- subform de trinidad  -->
						
						<h:panelGrid columns="1" styleClass="panelGrid" rendered="#{empty compraBean.compra.proveedor}">
							<h:panelGrid columns="2" width="100%" columnClasses="colunaDireita, colunaEsquerda">
								<h:outputText value="Nombre :" styleClass="labelInput"></h:outputText>
								<h:inputText id="inputNombreProveedor" value="#{compraBackingBean.proveedor.nombre }" 
								 converter="stringNull" 
								 ></h:inputText>
								<h:outputText value="Ruc :" styleClass="labelInput"></h:outputText>
								<h:inputText id="inputRucProveedor" value="#{compraBackingBean.proveedor.ruc }"
								converter="stringNull" 
								></h:inputText>
							</h:panelGrid>
							<h:commandButton id="buscarProveedor" value="Buscar" styleClass="panelBotaoConsultar"></h:commandButton>
						</h:panelGrid><!-- grid para filtrar  -->
						
					</h:form><!-- form general html  -->
				</htm:fieldset><!-- fieldset de proveedor  -->
				
				<htm:fieldset styleClass="borda" rendered="#{not empty compraBean.compra.proveedor}"><!-- fieldset de articulos  -->
					<htm:legend styleClass="legenda">Artículo</htm:legend>
					
						<h:form id="formArticulos">
								<t:panelGrid columns="1" styleClass="panelGrid" >
									<t:panelGrid columns="2" width="100%" columnClasses="colunaDireita, colunaEsquerda" >
										<h:outputText value="Nombre :" styleClass="labelInput"></h:outputText>
										<h:inputText id="inputDescArticulo" value="#{compraBackingBean.articulo.artnomreal }"
										converter="stringNull" >
										</h:inputText>
									</t:panelGrid>
									<h:commandButton id="consultarArticulo" value="Buscar" styleClass="panelBotaoConsultar"></h:commandButton>
								</t:panelGrid>
						
							<t:dataTable id="listaArticulos" styleClass="dataTableProdutos" width="100%"
							value="#{compraBackingBean.articulos}" var="articulo" rowClasses="linhaClara, linhaEscura">
								<t:column sortable="true" sortPropertyName="codigo" >
										<f:facet name="header">
											<h:outputText value="Cod."></h:outputText>
										</f:facet>
										<h:outputText value="#{articulo.codigo}"></h:outputText>
								</t:column><!-- 1º Columna  -->
								
								<t:column sortable="true" sortPropertyName="artnomreal">
										<f:facet name="header">
											<h:outputText value="Nombre"></h:outputText>
										</f:facet>
										<h:outputText value="#{articulo.artnomreal }"></h:outputText>
								</t:column><!-- 2º Columna  --> 
								
								<t:column>
										<f:facet name="header">
											<h:outputText value="#"></h:outputText>
										</f:facet>
										<h:selectBooleanCheckbox id="articuloSelecionado"
										value="#{compraBean.articulosSelecionados[articulo.codigo]}"></h:selectBooleanCheckbox>
								</t:column><!-- 3º Columna  --> 
								
								<f:facet name="footer">
										<h:outputText value="No hay artículos."
										rendered="#{empty compraBackingBean.articulos}"></h:outputText>
								</f:facet>
								</t:dataTable>
								<h:commandButton id="selecionarArticulo"  rendered="#{not empty compraBackingBean.articulos}"
								value="Incluir" styleClass="panelBotaoAdicionar" actionListener="#{compraBean.selecionarArticulo}">
								</h:commandButton>
					</h:form><!-- form de articulos  -->
				
				</htm:fieldset><!-- fieldset de articulos -->
				
			</htm:div><!-- Div cuerpo de izquierda  -->
				<htm:div styleClass="corpoDireita" ><!-- Div cuerpo de Derecho  -->
					<htm:div styleClass="previewNotaFiscal"  rendered="#{not empty compraBean.compra.proveedor}">
						<h:form id="notaFiscal">
								<t:div id="nrNF" forceId="true">
									<h:outputText styleClass="inputNrNF" value="Factura Proveedor Nº: "  />
									<h:inputText value="#{compraBean.compra.nroFactura}" required="true" requiredMessage="Ingrese Nº de Factura."
									style="width:300px; height:30px">
										<f:converter converterId="javax.faces.Long"  />
										<f:validateLongRange maximum="9999999" minimum="1"  />
									</h:inputText>
									<br />
									<htm:small style="font-size:10px;">Operación</htm:small>
									<h:selectOneMenu id="selectTipOpe" value="#{compraBean.operacion.codigo}">
										<f:selectItems value="#{compraBackingBean.operaciones}" />
									</h:selectOneMenu>
								</t:div>
						
							<htm:div id="dadosNotaFiscal">
								<htm:p>Nombre/Razón Social:</htm:p><htm:big><h:outputText value="#{compraBean.compra.proveedor.nombre}"/></htm:big>
								<htm:p>Ruc/DNI/CI:</htm:p><htm:big><h:outputText value="#{compraBean.compra.proveedor.ruc}"/></htm:big>
								<htm:p>Ciudad:</htm:p><htm:big><h:outputText value="#{compraBean.compra.proveedor.ciudad.nombre}"/></htm:big>
								<htm:p>Dirección:</htm:p><htm:big><h:outputText value="#{compraBean.compra.proveedor.direccion}"/></htm:big>
								<htm:p>Teléfono:</htm:p><htm:big><h:outputText value="#{compraBean.compra.proveedor.telefono}"/></htm:big>
								<t:div id="calendario" forceId="true">
									<htm:p>
										<h:outputText value="Fecha Emisión:" />
										<t:inputCalendar value="#{compraBean.compra.fecha}" renderAsPopup="true" renderPopupButtonAsImage="true"
											popupButtonImageUrl="images/search-blue.gif"  style="width:100px; height:10px"
										></t:inputCalendar>
									</htm:p>
<%-- 									<htm:p> --%>
<%-- 										<h:outputText value="Fecha de Entrada:" /> --%>
<%-- 										<t:inputCalendar value="#{compraBean.compra.fecha}" renderAsPopup="true" renderPopupButtonAsImage="true" --%>
<%-- 											popupButtonImageUrl="images/search-blue.gif" --%>
<%-- 										></t:inputCalendar> --%>
<%-- 									</htm:p> --%>
								</t:div><!-- /calendario -->
							</htm:div><!-- Div datos de la factura -->
							<t:dataTable id="produtosNotaFiscal" rendered="#{not empty compraBean.compra.detalle}"
								value="#{compraBean.compra.detalle}" var="detalle" rowClasses="linhaEscuraNF, linhaClaraNF"
								styleClass="dataTableNotaFiscal" width="100%">
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
									<h:inputText value="#{detalle.precioUnitario}" converterMessage="Precio: Se espera valor numerico"
										validatorMessage="Valor esperado: Esperando valor entre 10000 e 0">
										<f:converter converterId="javax.faces.Double" />
										<f:validateDoubleRange maximum="10000" minimum="0" />
									</h:inputText>
								</h:column>
								<h:column>
									<f:facet name="header">
										<h:outputText value="Cant."></h:outputText>
									</f:facet>
									<h:inputText value="#{detalle.cantidad}" converterMessage="Cantidad: Se espera valor numerico"
										validatorMessage="Cantidad: Esperando valor entre 10000 e 0">
										<f:converter converterId="javax.faces.Integer" />
										<f:validateDoubleRange maximum="10000" minimum="0" />
								</h:inputText>
								</h:column>
								<h:column>
									<f:facet name="header">
										<h:outputText value="Total"></h:outputText>
									</f:facet>
									<h:inputText value="#{detalle.subtotal}" converterMessage="Subtotal: Se espera valor numerico"
										validatorMessage="Subtotal:  Esperando valor entre 1000000 e 0">
										<f:converter converterId="javax.faces.Double" />
										<f:validateDoubleRange maximum="1000000" minimum="0" />
									</h:inputText>
									<f:facet name="footer">
										<h:inputText value="#{compraBean.compra.total}" readonly="true" ></h:inputText>
									</f:facet><!-- footer para campo total  -->
								</h:column>
								<h:column>
									<h:selectBooleanCheckbox id="excluirProduto"
									value="#{compraBean.articulosExcluidos[detalle.articulo.codigo]}">
									</h:selectBooleanCheckbox>
								</h:column>
								<f:facet name="footer">
									<h:commandButton styleClass="panelBotaoSubtrair" value="Excluir"
										rendered="#{not empty compraBean.compra.detalle}" actionListener="#{compraBean.excluirArticulo}"></h:commandButton>
								</f:facet>
							</t:dataTable>
							<h:commandButton styleClass="panelBotaoConfirmar" value="Guardar"
							rendered="#{not empty compraBean.compra.detalle}" action="#{compraBean.guardarFacturaCompra}"
							onclick="return confirm('¿Confirmar ingreso de Factura de Compra?');"
							></h:commandButton>
					</h:form>
				</htm:div><!-- Div vista de nota fiscal  -->
			</htm:div><!-- Div cuerpo de Derecho  -->
		</htm:div><!-- Div principal  -->
	</f:view>
</body>
</html>