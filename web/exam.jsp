<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Random"%>
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
                background-color: #eee;
                margin: 0;
            }
            .container
            {
                
                padding-left: 300px;
                
            }
            h1
            {
                padding-left: 100px;
            }
            .header
            {
                color: #6fc1a5;
                margin-left:100px;
                width: 300px;
            }
            table
            {
                margin-left:  25px;
            }
            .input
            {
                width: 250px;
                height: 25px;
            }
            .submit
            {
                color: #393e46;
                margin-top: 20px;
            }
            form
            {
                color: white;
                background-color: grey;
                width: 500px;
                height: 250px;
                border-radius: 10px;
                margin-left: 70px;
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
                height: 100px;
                position: fixed;
                width: 100%;
                left: 0;
                bottom: 0;
            }
        </style>
    </head>
    <body>
        <div class="navbar">
            <span class="gradience">Test Quick</span>
            
            <ul class="list"> 
                <li><a href="index.jsp">logout</a></li>
            </ul>
        </div>
        <div class="container">
             <%
                 //connection database
                 Connection conn =null;
            Statement Stmt = null;
            PreparedStatement preparedstat = null;
            List<String> quest_DB = new ArrayList();
            List<String> answer_DB = new ArrayList();
            ResultSet RS = null;
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/gradience";
            String password="";
            String user="root";
            try{
                
            conn = (Connection) DriverManager.getConnection(url,user,password);
            Stmt = (Statement) conn.createStatement();
            //Gather data
                RS =Stmt.executeQuery("SELECT text FROM question");
                while(RS.next())
                {
                    String text=RS.getString("text");
                    quest_DB.add(text);
                }
                RS =Stmt.executeQuery("SELECT text FROM answer");
                while(RS.next())
                {
                    String text=RS.getString("text");
                    answer_DB.add(text);
                }
            }
            catch(Exception cnfe)
            {
            System.err.println("Exception: " + cnfe);
            }
            String sid=(String)session.getAttribute("sid");
            String spassword=(String)session.getAttribute("spassword");
            Random rand = new Random();
            List<String> quest_Lis = Arrays.asList("What is the Abbreviation of css ?", "html mean ?", "why js ?" );
          int questionIndex = rand.nextInt(quest_DB.size());
                    String randomQestion = quest_DB.get(questionIndex);
        %>
            <h1 class="header">Welcome <% out.println(sid); %></h1>
            
        <form action="studentpage.jsp" method="GET">
            <table class="table">
                <h1>Choose The Correct </h1>
            <tr>
                <td> <% out.print( randomQestion); %> </td>
            <tr>
                <tr>
                    <td>  </td>
            <tr>
                
                    <% 
                    List<Integer> coreectAnswer = Arrays.asList(1,2,3);
                    List<String> answers = new ArrayList<String>();
                     List<String> collect_answer = new ArrayList<String>();
                     int CAI = rand.nextInt(coreectAnswer.size());
                     
                     for(int x=0;x<5;x++){
                         collect_answer.add(answer_DB.get(questionIndex*5+x));
                         //out.println("<BR>"+collect_answer.get(x));
                     }
                
                for(int j=0;j<3;j++){
                    
                        int i=questionIndex;
                        out.print("<input type = 'hidden' name = 'question' value = '"+(i+1)+"' />");
                        int answerIndex=rand.nextInt(collect_answer.size());
                       
                        if(j==CAI)
                        {
                          out.print("<tr> <td><input type='radio' name='answer' value='"+collect_answer.get(0)+"'/>");
                                
                                out.print(collect_answer.get(0));
                                String o =collect_answer.get(0);
                                answers.add(o);
                            collect_answer.remove(o);
                                out.print(" <td/></tr>");
                        }
                        else{
                            
                       out.print("<tr> <td><input type='radio' name='answer' value='"+answer_DB.get(answerIndex)+"' calss='mycheck'/>");
                       out.print( collect_answer.get(answerIndex));
                       answers.add(collect_answer.get(answerIndex));
                       out.print(" <td/></tr>");
                       collect_answer.remove(answerIndex);
                       
                        }
                        String inp="ans"+j;
                        //add 1 for index start from zero and the database start from 1;
                        out.print("<input type = 'hidden' name ='"+inp+"' value = '"+(answer_DB.indexOf(answers.get(j))+1)+"' />");
                       // out.println(answer_DB.indexOf(answers.get(j))+1+"<br>"+inp+(answer_DB.indexOf(answers.get(j))+1));
                          
                    }
                
                    %>
            <tr>
                <td>
                    <input class="submit" type="submit" value="submit"/>
                </td>
            </tr>
            </tr>
            
            
            
            </table>
        </form>
        </div>
            <footer class="footer">
            <p style="text-align: center; padding: 50px;color: white">@copy writer saved</p>
        </footer>
    </body>
</html>
