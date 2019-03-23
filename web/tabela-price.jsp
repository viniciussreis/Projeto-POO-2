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
        top: 31%;
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
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf"%>
            <%@include file="WEB-INF/jspf/menu.jspf"%>
            
            <div class="content">
                <form>
                    <table border='0' class='tabelaForm' align='center' cellspacing='3'>
                        <tr>
                            <td width='32%'>Valor 1: <input type='text' name='valor1'></td>
                            <td width='32%'>Valor 1: <input type='text' name='valor2'></td>
                            <td width='32%'>Valor 1: <input type='text' name='valor3'></td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <button type="submit" >Enviar</button>
                                <button type="reset" >Limpar</button>
                            </td>
                        </tr>
                    </table>
                </form>
                <br/>
                <table border='1' class="tabela" align='center' cellspacing='0' cellpadding='4'>
                    <tr bgcolor='#e0e0eb'>
                        <th class="celulas">Parcela</th>
                        <th class="celulas">Valor</th>
                        <th class="celulas">Juros</th>
                        <th class="celulas">Amortização</th>
                        <th class="celulas">Saldo Devedor</th>
                    </tr>
                </table>
            </div>
            
        <%@include file="WEB-INF/jspf/footer.jspf"%>
    </body>
</html>
