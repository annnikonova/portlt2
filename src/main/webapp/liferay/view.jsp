<%@ taglib prefix="liferay-util" uri="http://liferay.com/tld/util" %>
<%@ include file="init.jsp" %>


<p>View mode</p>
<portlet:actionURL var="deparmentUrl" name="departments"/>

<form action="${departmentUrl}" method="get">
    <portlet:param name="action" value="list"/>
    <input type="submit" value="Show departments">
</form>

<div class="contacts-container">
    <liferay-util:include page="departmentList.jsp" servletContext="<%= application %>" />
</div>