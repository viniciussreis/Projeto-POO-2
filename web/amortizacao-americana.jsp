<%-- 
    Document   : amortizacao-americana
    Created on : 15/03/2019, 14:56:10
    Author     : vsreis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>

    html, body{
        height: 90%;
        width: 100%;
    }

    *  {
        margin:0;
        padding:0;
    }

    .content{
        width: 100%; 
        min-height: 100%; 
        background-color: azure;
    }

    .tabelaForm{
        margin: 0;
        position: absolute;
        top: 23%;
        left: 50%;
        margin-right: -50%;
        transform: translate(-50%, -50%);
    }

    .tabela{
        margin: 0;
        position: absolute;
        top: 60%;
        left: 50%;
        margin-right: -50%;
        transform: translate(-50%, -50%);
    }

    .celulas{
        width: 250px;
    }

    td{
        text-align: center;
    }

</style>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Amortização Americana</title>   
    </head>
    <body>

        <%@include file="WEB-INF/jspf/header.jspf"%>
        <%@include file="WEB-INF/jspf/menu.jspf"%>

        <form>
            <table border='0' class='tabelaForm' align='center' cellspacing='3'>
                <tr>
                    <td width='32%'>Valor Total: <input type='text' name='valorTotal'></td>
                    <td width='32%'>Quantidade de parcelas: <input type='text' name='qtdeParcelas'></td>
                    <td width='32%'>Juros(%): <input type='text' name='juros'></td>
                </tr>
                <tr>
                    <td colspan="3">
                        <button type="submit" name="Calcular">Enviar</button>
                        <button type="reset" >Limpar</button>
                    </td>
                </tr>
            </table>
        </form>
        <br/>
        <% try { %>
        <%  int qtdeParc = Integer.parseInt(request.getParameter("qtdeParcelas"));
            Float valorTotal = Float.parseFloat(request.getParameter("valorTotal"));
            Float taxaJuros = Float.parseFloat(request.getParameter("juros"));
            Float jurosMensal = valorTotal * (taxaJuros / 100);
            Float jurosTotal = 0f;
            int mes = 0;
        %>
        <table border='1' class="tabela" align='center' cellspacing='0' cellpadding='4'>
            <tr bgcolor='#e0e0eb'>
                <th class="celulas">Mês</th>
                <th class="celulas">Saldo Devedor</th>
                <th class="celulas">Amortização</th>
                <th class="celulas">Juros</th>
                <th class="celulas">Prestação</th>
            </tr>
            <tbody>
                <% do { %>
                <% if (mes == 0) {%>
                <tr>
                    <th scope="row"><%= mes%></th>
                    <td><%= valorTotal%></td>
                    <td>-</td>
                    <td>-</td>
                    <td>-</td>
                </tr>
                    <% } else if (mes < qtdeParc) {%>
                <tr>
                    <th scope="row"><%= mes%></th>
                    <td><%= valorTotal%></td>
                    <td>-</td>
                    <td><%= jurosMensal%></td>
                    <td> <%= jurosMensal%> </td>
                </tr>
                    <%}
                            mes++;
                            jurosTotal += jurosMensal;
                        } while (mes < qtdeParc);
                    %>
                <tr>
                    <th scope="row"><%= mes%></th>
                    <td>-</td>
                    <td><%= valorTotal%></td>
                    <td><%= jurosMensal%></td>
                    <td><%= valorTotal + jurosMensal%></td>
                </tr>
            </tbody> 
            <tfoot>
                <tr>
                    <th scope="row">TOTAL</th>
                    <td></td>
                    <td><%= valorTotal%></td>
                    <td><%= jurosTotal%></td>          
                    <td><%= valorTotal + jurosTotal%></td>
                </tr>
            </tfoot>
        </table>
        <% } catch (Exception e) {
                if (request.getParameter("valor") != null) {
                    out.println(e);
                }
            }%>    

        <%@include file="WEB-INF/jspf/footer.jspf"%>
    </body>
</html> 

