<%@page import="vo.Board"%>
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
List<Board>list = (List)request.getAttribute("list");
%>
<tr>
<%
for(int i=0; i<list.size(); i++){
	Board b =  list.get(i);
	int no = b.getNo();
	String title = b.getTitle();
	String posted = b.getPosted();
	String user_id = b.getUser_id();
%>
	<tr>
		<td><%=no %></td>
		<td><a href="<%=root%>/boarddetail.bt?num=<%=no%>&type=0"><%=title %></a></td>
		<td><%-- <%=user_id %> --%>관리자</td>
		<td><%=posted %></td>
	</tr>
<%
}
 %>
</tr>