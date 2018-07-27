<%@page import="vo.Advertisement"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String root = request.getContextPath(); %>
<%
String result = (String)request.getAttribute("result");
if(result != null){
%><%=result %>
<%
  return;
}
List<Advertisement>list = (List)request.getAttribute("list");
%>
<tr>
<%
for(int i=0; i<list.size(); i++){
	Advertisement ad =  list.get(i);
	int no = ad.getNo();
	String title = ad.getTitle();
	String posted = ad.getPosted();
	String user_id = ad.getUser_id();
%>
	<tr>
		<td><%=no %></td>
		<td><a href="<%=root%>/advertisedetail.bt?num=<%=no%>"><%=title %></a></td>
		<td><%=user_id %></td>
		<td><%=posted %></td>
	</tr>
<%
}
 %>
</tr>