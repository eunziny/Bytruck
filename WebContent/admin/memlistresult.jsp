<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="memlist" value="${requestScope.result}" />
{"users":[<c:forEach var="i" items="${memlist}" varStatus="status">
	<c:if test="${status.index > 0}">,</c:if>
	{ 
	 "user_id":"${i.user_id}",
     "user_pwd":"${i.user_pwd}",
     "name":"${i.name}",
     "birthday":"${i.birthday}",
     "phone_number":"${i.phone_number}",
     "email":"${i.email}",
     "bussiness_number":"${i.bussiness_number}",
     "type":"${i.type}"
     }
</c:forEach>]}
