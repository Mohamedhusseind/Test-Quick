<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
                padding: 0px;
                margin: 0px;background-image: url("images/cq5dam.web.512.341.jpg");
                background-repeat: no-repeat;
                background-size: cover;
            }
            .container
            {
                
                padding-left: 400px;
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
                margin-left: 40px;
                width: 250px;
                font: 25px;
                height: 25px;
                cursor: pointer;
            }
            button
            {
                margin-left: 132px;
                margin-top:  25px;
                cursor: pointer;
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
                height: 120px;
                position: fixed;
                width: 100%;
                left: 0;
                bottom: 0;

            }
        </style>
    </head>
    <body>
        <%
            //getting data from form
            String sid=(String)session.getAttribute("sid");
            String spassword=(String)session.getAttribute("spassword");
            String questionid = request.getParameter("question");
            String answer1 = request.getParameter("ans0");
            String answer2 = request.getParameter("ans1");
            String answer3 = request.getParameter("ans2");
            String dis="";
            try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gradience", "root", "");
                    Statement st = conn.createStatement();
                    ResultSet RS = null;
                    boolean x=true;
                    st = conn.createStatement();
                        String sql = "select SID from studentanswer";
                        RS = st.executeQuery(sql);
                        
                            while(RS.next()){
                                int id=RS.getInt("SID");
                            if(Integer.parseInt(sid) ==id)
                            {
                                dis="disabled";
                                x=false;
                                break;
                            }
                            else{
                                dis = " ";
                                
                            }}
                            if(x){
                                
                                    int i = st.executeUpdate("insert into studentanswer(SID,QID,AID)values('" + sid + "','" + Integer.parseInt(questionid )+ "','" + answer1 + "'),('" + sid + "','" + questionid + "','" + answer2 + "'),('" + sid + "','" + questionid + "','" + answer3 + "')");
                                //out.println("Your exam are Submited ");
                                
                                String sql2 = "select SID from studentanswer";
                                RS = st.executeQuery(sql2);
                                
                            }
                            while(RS.next()){
                                int id=RS.getInt("SID");
                            if(Integer.parseInt(sid) ==id)
                            {
                                dis="disabled";
                                break;
                            }
                            else{
                                dis=" ";
                            }}
                    
                } catch (Exception e) {
                    System.out.print(e);
                    e.printStackTrace();
                }
            
        %>
        <div class="navbar">
            <span class="gradience">Test Quick</span>
            
            <ul class="list"> 
                <li><a href="index.jsp">logout</a></li>
            </ul>
        </div>
        <div class="container">
            <h1 class="header">START YOUR QUIZE</h1>
            <form action="exam.jsp" method="post">
                <label id="check"> </label>
                <input type="submit"  name="submit" value="Start Exam" <%=dis%>/>
            </form>
            <form action="index.jsp" method="post">
                <button> Log Out </button>
            </form>
        </div>
            <footer class="footer">
            <p style="text-align: center; padding: 50px;color: white">@copy writer saved</p>
        </footer>
    </body>
</html>
