<%@page import="vo.Event"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String root = request.getContextPath(); %>
<%
String result = (String)request.getAttribute("result");
if(result != null){
%><%=result %>
<%
  return;
}
List<Event>list = (List)request.getAttribute("list");
%>
<div class="list">
<%
for(int i=0; i<list.size(); i++){
   Event ev = list.get(i);
   String imgpath = ev.getImgpath();
   String title = ev.getTitle();
   int no = ev.getNo();
   
    if(imgpath != null){
         int lastIndex = imgpath.lastIndexOf("\\");
         imgpath = imgpath.substring(lastIndex+1);
    }  
%>
 <div class="col-lg-4">
  <div class="product-item">
     <a href="<%=root%>/eventdetail.bt?num=<%=no%>">
     <img src="<%=root%>/upload/<%=imgpath%>" class="img-rounded"
            alt="NO IMAGE" height="300" width="300"></img>
   </a>
   <div class="info">
        <h4 class="title"><%=title%></h4>
     </div>
  </div>
  <br>
 </div>
<%
}
 %>
 </div>