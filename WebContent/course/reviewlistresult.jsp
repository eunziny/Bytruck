<%@page import="vo.Review"%>
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
List<Review>list = (List)request.getAttribute("list");
%>
<tr>
<%
for(int i=0; i<list.size(); i++){
	Review rv =  list.get(i);
	int no = rv.getNo();
	String title = rv.getTitle();
	String posted = rv.getPosted();
	String user_id = rv.getUser_id();
%>
	<tr>
		<td><%=no %></td>
		<td><a href="<%=root%>/reviewdetail.bt?num=<%=no%>"><%=title %></a></td>
		<td><%=user_id %></td>
		<td><%=posted %></td>
	</tr>
<%
}
 %>
</tr>