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
<title>Acceso al Sistema</title>
<link rel="stylesheet" href="css/principal.css"  type="text/css" />

</head>
<body>
<f:view>
		<c:import url="mensajes.jsp"></c:import>
		<htm:div id="divPrincipal" styleClass="corpoPrincipal">
			<c:import url="cabecera.jsp">
				<c:param name="titulo" value="Acceso al Sistema"></c:param>
			</c:import>
			<htm:div styleClass="corpoEsquerda">
				<htm:fieldset style="borda">
					<htm:legend style="legenda">Login</htm:legend>
					<h:form id="formLogin">
						<h:panelGrid columns="2" columnClasses="colunaDireita, colunaEsquerda">
							<h:outputText value="Usuario " styleClass="labelInput" />
							<h:inputText id="inputLogin" value="#{loginBean.usuario.login }"
							 required="true" requiredMessage="Ingrese un usuario"></h:inputText>
							<h:outputText value="Clave " styleClass="labelInput" />
							<h:inputSecret id="inputSenha" value="#{loginBean.usuario.pass }"
							 required="true" requiredMessage="Ingrese una clave"></h:inputSecret>
							<f:facet name="footer">
								<h:commandButton styleClass="panelBotaoConfirmar" value="Acceder" 
								action="#{loginBean.verifyLogin }"></h:commandButton>
							</f:facet>
						</h:panelGrid>
					</h:form>
				</htm:fieldset>
			</htm:div>
		</htm:div>
</f:view>
</body>
</html>