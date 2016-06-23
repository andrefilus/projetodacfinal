<%-- 
    Document   : depositos
    Created on : Jun 13, 2016, 2:51:09 PM
    Author     : Andre
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <link href="bootstrap-3.3.6-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="bootstrap-3.3.6-dist/js/bootstrap.min.js" type="text/javascript"></script>
        <title>Banco VSF</title>
    </head>
    <body>
           <div class="container " role="main" style="padding-top: 100px;">
            <div class="jumbotron" style="padding-left: 250px;">
                <h3>Banco VSF - Virtude do Sistema Financeiro</h1>
                  
                        <form>
                            <table>
                                <tbody>
                                    <tr>
                                        <td style="padding: 10px;">
                                            Olá, <c:out value="${cliente.nome}"  />                                            
                                        </td>
                                        <td style="padding: 10px;">
                                            <a href="ProcessaLoginLogout?action=logout" >Logout</a> <br/>
                                        </td>                                        
                                    </tr>                                    
                                </tbody>
                            </table>
                        </form>
                   
                    <div>
                        <form method="POST" action="Portal?action=depositar">
                            Agência/Conta <input type="text" class="form-control" style="width:20%" value="${conta.numAgencia} - ${conta.numConta}" readonly="true" /></br>
                            Agência<input type="text" class="form-control" style="width:20%"  name="agenciaDeposito" required="required" maxlength="4" /> 
                            Conta Destino<input type="text" class="form-control"name="contaDeposito" style="width:20%" required="required" maxlength="6" />
                            &nbsp;
                            Valor <input type="text" class="form-control" name="valor" style="width:20%" required="required" maxlength="18" /> </br>
                            <!-- <div class="input-group">
                                 <span class="input-group-addon">Valor</span>
                                 <input type="text" name class="form-control" aria-label="Amount (to the nearest dollar)">
                                 <span class="input-group-addon">.00</span>
                             </div>
                             Token: <input type="text" name="token" /></br> -->
                            <input type="reset"  class="btn btn-sm btn-default" value="Cancelar" /> &nbsp;
                            <input type="submit" class="btn btn-sm btn-warning" value="Depositar" />
                            
                            
                        </form>
                    </div>
                            <br>
                    <div>
                        <c:url var="allContas" value="Portal?action=todasContas" />
                        <c:url var="transfers" value="transferencias.jsp" />
                        <c:url var="transfTerc" value="transfTerceiros.jsp" />
                        <c:url var="depositos" value="depositos.jsp" />
                        <c:url var="encerrar" value="encerramento.jsp" />
                        <c:url var="sacar" value="saques.jsp" />
                        <c:url var="extCompleto" value="Portal?action=extratos" >
                            <c:param name="extrato" value="" />
                        </c:url>
                        <c:url var="extQuinzeDias" value="Portal?action=extratos" >
                            <c:param name="extrato" value="15" />
                        </c:url>
                        <c:url var="extTrintaDias" value="Portal?action=extratos" >
                            <c:param name="extrato" value="30" />
                        </c:url>
                        <a href="${allContas}" >Todas Contas</a> |
                        <a href="${extCompleto}"  >Extrato Completo</a> |
                        <a href="${extQuinzeDias}" >Extrato Últimos 15 dias</a> | 
                        <a href="${extTrintaDias}" >Extrato Últimos 30 dias</a>
                        <c:if test="${contas.size() > 1}">
                            <a href="${transfers}" >Transferências para minha conta</a> |
                        </c:if>  
                        <a href="${transfTerc}" >Transferências para Terceiros</a> |
                        <a href="${depositos}" >Depósito</a> | 
                        <c:if test="${conta.tipoConta == 'J'}" > 
                            <a href="${sacar}" >Saque</a> | 
                        </c:if> 
                        <a href="${encerrar}" >Encerramento Conta-Corrente</a>
                    </div> 
                    ${msg} </br>
                    ${mensagemDOR}
            </div>
        </div>
    </body>
</html>
