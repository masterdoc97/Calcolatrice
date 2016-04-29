<%-- 
    Document   : index
    Created on : 18-apr-2015, 16.40.37
    Author     : docente
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calcolatrice Ajax</title>
        <script type="text/javascript">
            function ajaxResult(operazione, resultRegion) {
                if (!num1) var num1 = document.getElementById("num1");
                if (!num2) var num2 = document.getElementById("num2");
                var address = "calcola?num1=" + escape(num1.value) + "&num2=" + escape(num2.value) + "&op=" + operazione;
                var request = new XMLHttpRequest();
                request.onreadystatechange = function () {
                    showResponseText(request, resultRegion);
                };
                request.open("GET", address, true);
                request.send(null);
            }

            // Put response text in the HTML element that has given ID.
            function showResponseText(request, resultRegion) {
                //readyState = 4->terminato status = 200 -> senza errori
                if ((request.readyState == 4) && (request.status == 200)) {
                    htmlInsert(resultRegion, request.responseText);
                }
            }

            //Insert the html data into the element that has the specified id.

            function htmlInsert(id, htmlData) {
                document.getElementById(id).innerHTML = htmlData;
            }
        </script>
    </head>
    <body>
        <div align="center">
            <h1>Calcolatrice</h1>
            <p><hr/><br/>
            <div>
                <h4>Primo numero :</h4><input id="num1"><br/>
                <h4>Secondo numero :</h4><input id="num2">
            </div>
            <br/><br/>
            <input type="button" value="+" onclick='ajaxResult("a","risultato")'/>
            <input type="button" value="-" onclick='ajaxResult("s","risultato")'/>
            <input type="button" value="x" onclick='ajaxResult("m","risultato")'/>
            <input type="button" value="/" onclick='ajaxResult("d","risultato")'/>
            <br/><br/>
            <span>Il risultato vale </span><div id="risultato"></div>
        </p>
    </div> 
</body>
</html>