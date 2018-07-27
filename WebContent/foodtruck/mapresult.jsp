<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="vo.Foodtruck_Location"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

{"location":[<c:forEach var="i" items="${requestScope.location}" varStatus="status">
<c:if test="${status.index > 0}">,</c:if>
   {
     "ylocation":"${i.latitude}",
     "xlocation":"${i.longtitude}"  
   }
</c:forEach>]}