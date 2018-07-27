<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="chat" value="${requestScope.result}" />
{"chatting":[<c:forEach var="i" items="${chat}" varStatus="status">
	<c:if test="${status.index > 0}">,</c:if>
   {
     "user_id":"${i.user_id}",
     "posted":"${i.posted}",
     "message":"${i.message}"
   }
</c:forEach>]}
