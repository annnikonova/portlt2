<%@ include file="init.jsp" %>
<%@ page import="javax.portlet.WindowState" %>
<%@ page import="com.liferay.portal.kernel.portlet.LiferayWindowState" %>
<%@ page import="com.liferay.portal.kernel.util.ParamUtil" %>
<%@ page import="javax.portlet.PortletURL" %>
<%@ page import="com.aimprosoft.task5.service.DepartmentService" %>
<%@ page import="com.aimprosoft.task5.service.impl.DepartmentServiceImpl" %>
<%@ page import="com.aimprosoft.task5.model.Department" %>
<%@ page import="com.liferay.portal.kernel.util.ListUtil" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
<%
   // DepartmentService departmentService = new DepartmentServiceImpl();
    Department d1 = new Department();
    d1.setId(1);
    d1.setName("D1");
    d1.setInfo("Info1");
    Department d2 = new Department();
    d2.setId(2);
    d2.setName("D2");
    List<Department> departments = Arrays.asList(d1,d2);
    // List<Department> departments = (List<Department>)departmentService.listDepartments();

%>
<h1>Our departments:</h1>
<liferay-ui:search-container delta="2" emptyResultsMessage="No departments found">
        <liferay-ui:search-container-results  results="<%= departments %>" />
        <liferay-ui:search-container-row className="com.aimprosoft.task5.model.Department" keyProperty="id" modelVar="department">
            <liferay-ui:search-container-column-text name="id" value="${department.id}" />
            <liferay-ui:search-container-column-text name="name" value="${department.name}" />
            <liferay-ui:search-container-column-text name="info" value="${department.info}" />
            <liferay-ui:search-container-column-jsp path="employeeList.jsp" align="right" />
        <liferay-ui:search-iterator />
    </liferay-ui:search-container>