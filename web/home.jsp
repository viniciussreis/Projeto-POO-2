<%-- 
    Document   : index
    Created on : 15/03/2019, 14:52:57
    Author     : vsreis
--%>

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
        <title>Home</title>
    </head>
    <body>
            <%@include file="WEB-INF/jspf/header.jspf"%>
            <%@include file="WEB-INF/jspf/menu.jspf"%>
   
            <div class="content">
                   Teste
            </div>
            
            <%@include file="WEB-INF/jspf/footer.jspf"%>
    </body>
</html>
