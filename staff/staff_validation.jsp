<html>
<head>
</head>
<body>
<%@ page import = "java.sql.*"%>
<%
          String usr_name =  request.getParameter("usr");
          String paswd =  request.getParameter("pwd");
          String authentication_pwd=null;
        try{
            Connection con = null;
            PreparedStatement stmt = null;
            String url = "jdbc:mysql://localhost: 3306/hotel_reservationdb";
            String user = "root";
            String password = "Kavya@1911";
            con = DriverManager.getConnection(url, user, password);
            stmt = con.prepareStatement("select password from receptionist where user_name=?");
            stmt.setString(1,usr_name);
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                authentication_pwd = rs.getString("password");
            }
            if(authentication_pwd!=null){
                if(authentication_pwd.equals(paswd)){
	                session.setAttribute("usr", usr_name);
	                session.setAttribute("pwd", paswd);
                   request.getRequestDispatcher("staff_options.jsp").forward(request, response);
                }
                else{
	                out.println("<h1 style=\"text-align:center; background: red;\">Incorrect details</h1>");
	                out.println("<a style=\"display:block; text-align: center; text-decoration:none;\" href='staff.html'>Go to home</a>");
                }
            }
            else{
	        out.println("<h1 style=\"text-align:center; background: red;\">Incorrect details</h1>");
	        out.println("<a style=\"display:block; text-align: center; text-decoration:none;\" href='staff.html'>Go to home</a>");
            }
        }
        catch(SQLException e){
            out.println("<h1>Not connected to database</h1><br>");
            e.printStackTrace();}
%>
</body>
</html>