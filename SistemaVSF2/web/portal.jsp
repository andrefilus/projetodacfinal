<%-- 
    Document   : portal
    Created on : Jun 13, 2016, 12:21:26 AM
    Author     : Andre
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
    <head>
        <link href="bootstrap-3.3.6-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="bootstrap-3.3.6-dist/js/bootstrap.min.js" type="text/javascript"></script>
        <title>Banco VSF</title>
    </head>
    <body>
        <div class="container theme-showcase" role="main" style="padding-top: 100px;">
            <div class="jumbotron" style="padding-left: 250px;">
                <h3>Banco VSF - Virtude do Sistema Financeiro</h1>
                    <div>
                        <form acti method="POST">
                            <table>
                                <tbody>
                                    <tr>
                                        <td style="padding: 10px;">
                                            Olá, <c:out value="${cliente.nome}"  />                                            
                                        </td>
                                        <td style="padding: 10px;">
                                            <c:out value="${conta.numAgencia}"  />
                                        </td>
                                        <td style="padding: 10px;">
                                            <c:out value="${conta.numConta}"  />
                                        </td>
                                        <td style="padding: 10px;">
                                            <a href="ProcessaLoginLogout?action=logout" >Logout</a> <br/>
                                        </td>                                        
                                    </tr>                                    
                                </tbody>
                            </table>
                        </form>
                    </div>
                    <div>
                        <table>
                            <thead>
                                <tr>
                                    <th style="padding: 5px;">Conta Atual</th>
                                    <th style="padding: 5px;">Saldo</th>
                                    <th style="padding: 5px;">Limite</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td style="padding: 5px;"> ${conta.numConta} </td>
                                    <td style="padding: 5px;"> ${conta.saldo} </td>
                                    <td style="padding: 5px;"> ${conta.limite} </td>
                                </tr>
                            </tbody>
                        </table>
                        <table>
                            <thead>
                                <tr>
                                    <th style="padding: 5px;">Todas as suas contas</th>
                                    <th style="padding: 5px;">Saldo</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td style="padding: 5px;">${qtdeContas}</td>
                                    <td style="padding: 5px;">${totalSaldos}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div>
                        <form method="POST" action="Portal?action=extratos" >
                            <c:url var="extCompleto" value="Portal?action=extratos" >
                                <param name="extrato" value="" />
                            </c:url>
                            <c:url var="extQuinzeDias" value="Portal?action=extratos" >
                                <param name="extrato" value="15" />
                            </c:url>
                            <c:url var="extTrintaDias" value="Portal?action=extratos" >
                                <param name="extrato" value="30" />
                            </c:url>
                            <a href="todasContas.jsp" >Todas Contas</a> |
                            <a href="${extCompleto}"  >Extrato Completo</a> |
                            <a href="${extQuinzeDias}" >Extrato Últimos 15 dias</a> | 
                            <a href="${extTrintaDias}" >Extrato Últimos 30 dias</a>
                            <a href="transferencias.jsp" >Transferências</a> |
                            <a href="depositos.jsp" >Depósito</a> | 
                            <c:if test="${conta.tipoConta == 'J'}" > 
                                <a href="saques.jsp" >Saque</a> | 
                            </c:if> 
                            <a href="Portal?action=encerramento" >Encerramento Conta-Corrente</a>
                        </form>
                    </div>
            </div>
        </div>
    </body>
</html>