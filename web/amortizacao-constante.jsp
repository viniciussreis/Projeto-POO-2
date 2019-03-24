<%@page import="java.text.NumberFormat"%>
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
        <title>Amortização Constante</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf"%>
        <%@include file="WEB-INF/jspf/menu.jspf"%>
        
        <form>
            <table border='0' class='tabelaForm' align='center' cellspacing='3'>
                <tr>
                    <td width='32%'>Valor Emprestimo: <input type='text' name='vlEmprestimo'></td>
                    <td width='32%'>Quantidade de meses: <input type='text' name='qtdeMeses'></td>
                    <td width='32%'>Juros(%): <input type='text' name='vlJuros'></td>
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
        <%  int meses = Integer.parseInt(request.getParameter("qtdeMeses"));
            Float emprestimo = Float.parseFloat(request.getParameter("vlEmprestimo"));
            Float taxaJuros = Float.parseFloat(request.getParameter("vlJuros"));
            Float amConstante = emprestimo / meses;
            Float salDevedor = emprestimo;
            Float prestação;
            Float juros;
        %>
        <table border='1' class="tabela" align='center' cellspacing='0' cellpadding='4'>
            <tr bgcolor='#e0e0eb'>
                <th class="celulas">Mês</th>
                <th class="celulas">Prestação</th>
                <th class="celulas">Juros</th>
                <th class="celulas">Amortização</th>
                <th class="celulas">Saldo Devedor</th>
            </tr>
            <tr>
                <th>0</th>
                <td></td>
                <td></td>
                <td></td>
                <td>
                    <%= NumberFormat.getCurrencyInstance().format(salDevedor)%>
                </td>
            </tr>
            <tr>
                <%
                    for (int i = 1; i <= meses; i++) {
                        juros = (meses - i + 1) * (taxaJuros / 100) * amConstante;
                        prestação = amConstante + juros;
                        salDevedor = salDevedor - amConstante;
                %>
                <th><%= i%></th>
                <td><%= NumberFormat.getCurrencyInstance().format(prestação)%></td>
                <td><%= NumberFormat.getCurrencyInstance().format(juros)%></td>
                <td><%= NumberFormat.getCurrencyInstance().format(amConstante)%></td>
                <td><%= NumberFormat.getCurrencyInstance().format(salDevedor)%></td>
            </tr>
            <%}%>
        </table>

        <% } catch (Exception e) {
                if (request.getParameter("valor") != null) {
                    out.println(e);
                }
            }%>    

        <%@include file="WEB-INF/jspf/footer.jspf"%>

    </body>
</html>

