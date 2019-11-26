<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            body
            {
                background-image: url("images/cq5dam.web.512.341.jpg");
                background-repeat: no-repeat;
                background-size: cover;
                padding: 0px;
                margin: 0px;
            }
            .container
            {
                padding-left: 450px;
                padding-top: 100px;
                
            }
            .header
            {
                color: #6fc1a5;
            }
            table
            {
                margin-left:  25px;
            }
            input
            {
                width: 250px;
                height: 25px;
            }
            form
            {
                background-color: #393e46;
                width: 300px;
                height: 250px;
                padding-top: 30px;
                border-radius: 10px;
                
            }
            .h1
            {
                color: #6fc1a5;
                text-align: center;
            }
            #lab,#labid,#labpass
            {
                padding: 2px;
                color: #ef4339;
            }
            .button
            {
                width: 90px;
                cursor: pointer;
                margin-left:80px;
                margin-top:20px; 
            }
            input
            {
                border-bottom-color: #88c0ad80;
            }
            .navbar
            {
                margin: 0px;
                background-color: #393e46;
                padding-left: 50px;
                height: 50px;
                
            }
            .gradience
            {
                float: left;
                font-size: 30px;
                font-family: monospace;
                color:#6fc1a5;
                margin-top:10px;
                overflow: hidden;
                width: 50%;
                
            }
            .list
            {
                list-style: none;
                float: right;
                font-size: 25px;
                padding: 0px;
                margin: 0px;
            }
            .list li 
            {
               padding-top: 10px ;
               padding-right: 30px;
            }
            .list li a
            {
                text-decoration: none;
                color: #6fc1a5;
            }
            .clear
            {
                clear: both;
            }
            .footer
            {
                margin-top: auto;
                background-color: #393e46;
                height: 80px;
                position: fixed;
                width: 100%;
                left: 0;
                bottom: 0;
                
            }
        </style>
        <script type="text/javascript">
            function checkForm(form)
{
    if (form.id.value == "") {
        document.getElementById("lab").innerHTML="Error: UserID cannot be blank!";
        document.getElementById("labid").innerHTML="*";
        document.getElementById("labpass").innerHTML="";
        return false;
    }
    else if (form.password.value == "") {
        document.getElementById("lab").innerHTML="Error: UserPassword cannot be blank!";
        document.getElementById("labid").innerHTML="";
        document.getElementById("labpass").innerHTML="*";
        return false;
    }
    else return true;
}
        </script>
    </head>
    <body>
        <div class="navbar">
            <span class="gradience">Test Quick</span>
            
            <ul class="list"> 
                <li><a href="index.jsp">logout</a></li>
            </ul>
        </div>
        <div class="container">
            <h1 class="header">SOLVE YOUR QUIZE</h1>
            
            <form action="NewServlet" method="post" onsubmit="return checkForm(this)" >
            <h1 class="h1">Log in</h1>
            <table class="table">
            <tr>
            <label id="lab">
                <%
                    if(request.getParameter("value")!=null)
                   out.print( request.getParameter("value") );
                %>
            </label>
            <tr><td><label id="labid"></label><input type="number" name="id" placeholder="EnterID" /></td></tr>
            
            <tr><td><label id="labpass"></label><input type="password" name="password" placeholder="EnterPassword" /></td></tr>
            
            <tr>
                <td><input class="button" type="submit"  value="Log in"/></td> 
            </tr>
            </table>
        </form>
        </div>
        <footer class="footer">
            <p style="text-align: center; padding: 20px;color: white">@copy writer saved</p>
        </footer>
    </body>
</html>
