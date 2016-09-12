<%@page import="java.io.PrintWriter"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.HttpDTO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("utf-8");
	
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	String age = request.getParameter("age");
	String address = request.getParameter("address");
	String email = request.getParameter("email");
	
	//3. 수정 테스트
	HttpDTO dto = new HttpDTO();
	ArrayList<HttpDTO> list = new ArrayList<HttpDTO>();
	
	dto.setUsername(name);
	dto.setTel(tel);
	dto.setAge(age);
	dto.setAddress(address);
	dto.setEmail(email);

	Connection con;
	Statement stat;

	//테스트
	String url = "jdbc:oracle:thin:@localhost:1521:KNLDB"; 
	String id = "test";
	String pw = "1234";

	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");

		con = DriverManager.getConnection(url, id, pw);
		stat = con.createStatement();
		
		String sql = "select name, tel, age, address, email, filename from httptest";
		
		ResultSet rs = stat.executeQuery(sql);
		
		while(rs.next()){
			HttpDTO httpdto = new HttpDTO();
			httpdto.setUsername(rs.getString("name"));
			httpdto.setTel(rs.getString("tel"));
			httpdto.setAge(rs.getString("age"));
			httpdto.setAddress(rs.getString("address"));
			httpdto.setEmail(rs.getString("email"));
			httpdto.setFilename(rs.getString("filename"));
			httpdto.setResult(dto.getResult());
			list.add(httpdto);
		}
		
		ObjectMapper om = new ObjectMapper();
		String json = om.writeValueAsString(list);
		System.out.println("search json : " + json);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter printout = response.getWriter();
		printout.print(json);
		printout.close();
	
		con.close();
		stat.close();

	} catch (Exception e) {
		out.print("실패");
		System.out.println(e.toString());
	}


%>

<% 
	System.out.print("호출호출");
%>

