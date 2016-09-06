<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="input_process.jsp" method="post">
	<table>
		<tr>
			<th>		이름 :</th>
			<td>  <input type="text" name="name" id="name">  </td>
		</tr>
			<tr>
			<th>	나이 :</th>
			<td><input type="text" name="age" id="age">  </td>
		</tr>
			<tr>
			<th>		전화 :  </th>
			<td><input type="text" name="tel" id="tel">  </td>
		</tr>
			<tr>
			<th>		주소 :  </th>
			<td><input type="text" name="address" id="address">  </td>
		</tr>
			<tr>
			<th>이메일 :  </th>
			<td><input type="text" name="email" id="email">  </td>
		</tr>
	</table>

	  


		
		<input type="submit" value="전송">
	</form>

</body>
</html>