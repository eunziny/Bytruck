<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="calendar" value="${requestScope.calendar}" />
{
"calendar":[
<c:forEach var="i" items="${calendar}" varStatus="status">
	<c:if test="${status.index > 0}">,</c:if>
	{
	"title":"${i.title}",
	"start":"${i.date}",
	"detail":"${i.detail}"
	}
</c:forEach>
]
}
<%-- <c:if test="${!empty calendar}"> --%>
<%-- 


[
    {
      title  : 'event1',
      start  : '2010-01-01'
    },


[
	<c:forEach var="i" items="${calendar}" varStatus="status">
	<c:if test="${status.index > 0}">,</c:if>
	{
	"no":${i.no}, 
	"user_id":"${i.user_id}",
	"title":"${i.title}",
	"detail":"${i.detail}",
	"date":"${i.event_date}"
	}
	  </c:forEach>
] --%>