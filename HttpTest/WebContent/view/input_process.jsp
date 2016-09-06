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
<%@page import="java.io.*" %>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@page import="com.oreilly.servlet.MultipartRequest" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	ServletContext sc = session.getServletContext();
	String rootPath = sc.getRealPath(File.separator);
	
	String filePath = rootPath +  "ExcelRepository";

	if (!(new File(filePath).exists())) { // 저장 경로가 존재하지 않으면 폴더 생성
		new File(filePath).mkdir();
	}

	String savePath = "C:\\upload";
	
	String Server_URL =  "http://"+request.getServerName()+":"+ request.getServerPort()+ request.getContextPath()+"/ExcelRepository";
	System.out.println(Server_URL);
	int sizeLimit = 5 * 1024 * 1024;
	
	
	try {
		
		MultipartRequest req = new MultipartRequest(request, filePath, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());
		String orgFileName = req.getOriginalFileName("myFile");
		String sysFileName = req.getFilesystemName("myFile");
		
		String name = req.getParameter("name");
		String tel = req.getParameter("tel");
		String age = req.getParameter("age");
		String address = req.getParameter("address");
		String email = req.getParameter("email");
		
		
		HttpDTO dto = new HttpDTO();
		ArrayList<HttpDTO> list = new ArrayList<HttpDTO>();
		
		dto.setUsername(name);
		dto.setTel(tel);
		dto.setAge(age);
		dto.setAddress(address);
		dto.setEmail(email);
		dto.setFilename(Server_URL+"/"+sysFileName);

		Connection con;
		Statement stat;


		String url = "jdbc:oracle:thin:@localhost:1521:KNLDB"; 
		String id = "test";
		String pw = "1234";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			con = DriverManager.getConnection(url, id, pw);
			stat = con.createStatement();
			
			String sql = String.format("insert into httptest(name, tel, age, address, email, filename) "
					+ "values ( '%s', '%s', '%s', '%s', '%s', '%s')",
					dto.getUsername(),
					dto.getTel(),
					dto.getAge(),
					dto.getAddress(),
					dto.getEmail(),
					dto.getFilename()
					);
			
			System.out.println(sql);
			
			int result = stat.executeUpdate(sql);
			
			if(result > 0 ){
				out.print("성공");
				dto.setResult("성공");
			}else{
				out.print("실패");
				dto.setResult("실패");
			}
			
			System.out.print(result + " : result");

		} catch (Exception e) {
			out.print("실패");
			System.out.println(e.toString());
		}
		
	} catch(Exception e) {
		e.printStackTrace();
	}
	
	


%>

<% 
	System.out.print("호출호출");
%>

