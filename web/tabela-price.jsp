<%@page import="java.text.DecimalFormat"%>
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
        top: 50%;
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
        <title>Tabela Price</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf"%>
        <%@include file="WEB-INF/jspf/menu.jspf"%>

        <div class="content">
            <form>
                <table border='0' class='tabelaForm' align='center' cellspacing='3'>
                    <tr>
                        <td width='32%'>Valor Presente: <input type='text' name='valorPresente'></td>
                        <td width='32%'>Taxa(%): <input type='text' name='taxa'></td>
                        <td width='32%'>Periodo: <input type='text' name='periodo'></td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <button type="submit" name="calcular">Enviar</button>
                            <button type="reset" >Limpar</button>
                        </td>
                    </tr>
                </table>
            </form>
            <br/>
            <% if (request.getParameter("calcular") != null) {%>
            <%try {%>
            <%double valorPresente = Double.valueOf(request.getParameter("valorPresente")); %>
            <%double taxa = Double.valueOf(request.getParameter("taxa")); %>
            <%int periodo = Integer.parseInt(request.getParameter("periodo"));%>

            <table border='1' class="tabela" align='center' cellspacing='0' cellpadding='4'>
                <tr bgcolor='#e0e0eb'>
                    <th class="celulas">Parcela</th>
                    <th class="celulas">Valor</th>
                    <th class="celulas">Juros(<%=taxa%>)</th>
                    <th class="celulas">Amortização</th>
                    <th class="celulas">Saldo Devedor</th>
                </tr>
                <%DecimalFormat decimalFormat = new DecimalFormat("#0.00");%>
                <%taxa = taxa / 100; %>
                <%double valor = valorPresente * ((Math.pow((1 + taxa), periodo) * taxa) / (Math.pow((1 + taxa), 8) - 1)); %>

                <% for (int i = 1; i <= periodo; i++) {%>
                <%double juros = valorPresente * taxa; %>
                <%double amortizacao = valor - juros;%>
                <%valorPresente = valorPresente - amortizacao;%>

                <tr>
                    <th class="celulas"><%= i%></th>
                    <th class="celulas"><%= decimalFormat.format(valor)%></th>
                    <th class="celulas"><%= decimalFormat.format(juros)%></th>
                    <th class="celulas"><%= decimalFormat.format(amortizacao)%></th>
                    <th class="celulas"><%= decimalFormat.format(valorPresente)%></th>
                </tr>          

                <%}%>

            </table>

            <%} catch (Exception e) {%>

            <%}%>
            <%}%>
        </div>

        <%@include file="WEB-INF/jspf/footer.jspf"%>
    </body>
</html>
