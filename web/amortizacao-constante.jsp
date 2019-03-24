<%@page import="java.text.NumberFormat"%>
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


        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Amortização Constante</title>
        <%@include file="WEB-INF/jspf/header.jspf"%>
        
       <!-- Bootstrap 4-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        
        <link href="scr/css/sticky-footer-navbar.css" rel="stylesheet">
        <main role="main" class="container">
            <h1 class="mt-5">Amortizacao constante</h1>
            <br/>
            <form>
                <p>Valor emprestimo:</p>
                <input type="number" required="true" name="vlEmprestimo"/><br/>
                <p>Quantidade de meses:</p>
                <input type="number" required="true" name="qtdeMeses"/><br/>
                <p>Juros (%):</p>
                <input type="number" required="true" name="vlJuros"/><br/>
                <input type="submit" value="Calcular"/>
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
                    <table class="table table-sm">
                <thead class="thead-dark">
                    <tr><th>Mês</th><th>Saldo devedor</th><th>Amortização</th><th>Juros</th><th>Prestação</th></tr>
                </thead>
                        <tr>
                            <th>0</th>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>
                                <%= NumberFormat.getCurrencyInstance().format(salDevedor) %>
                            </td>
                        </tr>
                        <tr>
                            <%
                                for(int i=1; i<=meses; i++) {
                                    juros=(meses-i+1)*(taxaJuros/100)*amConstante;
                                    prestação = amConstante + juros;
                                    salDevedor = salDevedor - amConstante;
                            %>
                            <th><%= i %></th>
                            <td><%= NumberFormat.getCurrencyInstance().format(prestação) %></td>
                            <td><%= NumberFormat.getCurrencyInstance().format(juros) %></td>
                            <td><%= NumberFormat.getCurrencyInstance().format(amConstante) %></td>
                            <td><%= NumberFormat.getCurrencyInstance().format(salDevedor) %></td>
                        </tr>
                            <%}%>
                    </table>

            <% } catch (Exception e) {
                    if (request.getParameter("valor") != null) {
                        out.println(e);
                    }
                }%>    
        </main>

       
 <div class="content">
                   
            </div>
            
            <%@include file="WEB-INF/jspf/footer.jspf"%>



    </body>
</html>
        
        
   
      

            <div class="content">
                   
            </div>
            
            <%@include file="WEB-INF/jspf/footer.jspf"%>

