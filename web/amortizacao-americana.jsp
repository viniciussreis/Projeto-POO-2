<%-- 
    Document   : amortizacao-americana
    Created on : 15/03/2019, 14:56:10
    Author     : vsreis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
        <h1>Amortização Americana</h1>
        <hr/>
        
            Valor do Financiamento: <input type="number" name="financiamento">
            Taxa de Juros (em %): <input type="number" name="juros">
            Tempo: <input type="number" name="tempo">
            <input type="submit" name =" calcular" value="CALCULAR">
            <% if(request.getParameter("calcular")!=null){%>
            <% try{ %>
            <% int x=0; %>
            <% double f = Double.valueOf(request.getParameter("financiamento")); %>
            <% double jurosInput = Double.valueOf(request.getParameter("juros"));%>
            <% double tempo = Double.valueOf(request.getParameter("tempo"));%>
            <% double amortizacao = 0; %>
            <% double totalAmortizacao = 0; %>
            <% double parcela = 0; %>
            <% double totalParcela = 0; %>
            <% double jurosSaida = 0; %>
            <% double totalJurosSaida = 0;%>
            <% double saldoPagar = 0;%>
            <% double jurosEntrada = jurosInput/100;%>
            
            
            <%
            
        
        <%}catch(Exception){%>
    
</html>
