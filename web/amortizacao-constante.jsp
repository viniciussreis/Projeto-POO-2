<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<style>
    
    html, body{
        height: 90%;
        width: 100%;
    }
    
    .content{
        width: 100%; 
        min-height: 100%; 
        background-color: azure;
    }
    
    *  {
    margin:0;
    padding:0;
    }
    
</style>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Amortização Constante</title>
        <%@include file="WEB-INF/jspf/header.jspf"%>
    </head>
    
         <%@include file="WEB-INF/jspf/menu.jspf"%>
         <h1>Amortização Constante</h1>
         
         
             <table align="center">
                 <tr>
                     <td>Valor Financiado:</td><td> <input type="number" name="financiamento"></td>
                     <td>Taxa de Juros (em %):</td><td> <input type="number" name=" juros"></td>
                     <td>Tempo (meses):</td><td> <input type="number" name="tempo"></td>
                 </tr>
                 
                  <td colspan="3">
                                <button type="submit" >Enviar</button>
                                <button type="reset" >Limpar</button>
                  </td>
                  
             </table>
             <% Locale localeBR = new  Locale("pt", "BR"); %>
             <% NumberFormat dinheiro = NumberFormat.getCurrencyInstance(localeBR); %>
             <% if(request.getParameter("Enviar")!=null){ %>
             
              <% try{ %>
            <% int x=1; %>
            <% double f = Double.valueOf(request.getParameter("financiamento")); %>
            <% double jurosInput = Double.valueOf(request.getParameter("juros"));%>
            <% double mes = Double.valueOf(request.getParameter("tempo"));%>
            <% double amortizacao = 0; %>
            <% double totalAmortizacao = 0; %>
            <% double parcela = 0; %>
            <% double totalParcela = 0; %>
            <% double jurosSaida = 0; %>
            <% double totalJurosSaida = 0;%>
            <% double saldoPagar = 0;%>
            <% double jurosEntrada = jurosInput/100;%>
            
            <%amortizacao = f / mes; %>
            <% jurosSaida = jurosEntrada * f; %>
            <% parcela = amortizacao + jurosSaida; %>
            <% saldoPagar = f - amortizacao; %>
            
            <% totalAmortizacao+= amortizacao; %>]
            <% totalJurosSaida += totalJurosSaida; %>
            <% totalParcela += parcela; %>
            
            <table> border="1" alien="center">
                
                <tr>
                    <th>#</th>
                    <th>Parcelas</th>
                    <th> Amortizações</th><th>Juros</th>
                    <th>Saldo Devedor</th>
                </tr> 
            
                <tr>
                       <td align="center"><%= x %></td>
                       <td align="right"><%= dinheiro.format(parcela) %></td>
                       <td align="right"><%= dinheiro.format(amortizacao) %></td>
                       <td align="right"><%= dinheiro.format(jurosSaida) %></td>
                       <td align="right"><%= dinheiro.format(saldoPagar)%></td>
                       
                    </tr>
                    
                    <tr>
                        <% for(x =2 ; x<=mes; x++){%>
                        <% jurosSaida =  jurosEntrada * saldoPagar; %>
                        <% saldoPagar = saldoPagar - amortizacao; %>
                        <% parcela = jurosSaida + amortizacao; %>
                        <tr>
                        <tr>
                            <td align="center"><%= x %></td>
                            <td align="right"><%= dinheiro.format(parcela) %></td>
                            <td align="right"><%= dinheiro.format(amortizacao) %></td>
                            <td align="right"><%= dinheiro.format(jurosSaida) %></td>
                            <td align="right"><%= dinheiro.format(saldoPagar)%></td> 
                        </tr>
                        <% totalAmortizacao = totalAmortizacao + amortizacao; %>
                        <% totalJurosSaida  += jurosSaida; %>
                        <% totalParcela  += parcela; %>
                        
                        <% }%>
                        
                    </tr>
                    <tr>
                        <td> >> </td>
                        <td align="right"><%= dinheiro.format(totalParcela) %></td>
                        <td align="right"><%= dinheiro.format(totalAmortizacao) %></td>
                        <td align="right"><%= dinheiro.format(totalJurosSaida) %></td>
                        <td><center><b> <<-TOTAIS </b></center></td> 
                    </tr> 
                </table>
                        
            <% }catch(Exception e){%>
                    <h2 style="color:red">Número Inválido</h2>
                <% }%>
            <% } %>
        </form>
    </body>
 
            <div class="content">
                   Teste
            </div>
            
            <%@include file="WEB-INF/jspf/footer.jspf"%>
    
</html>
