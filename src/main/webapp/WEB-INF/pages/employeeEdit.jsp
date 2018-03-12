<%--
  Created by IntelliJ IDEA.
  User: anikonova
  Date: 22.02.18
  Time: 10:21
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Add | Edit employee</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!--Bootstrap js -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>


</head>
<body>
<div class="container">
    Enter employee info:
    <form:form method="post" modelAttribute="dto" class="form-vertical">
        <fieldset class="col-sm-12 form-group">
            <label class="col-sm-12 form-group">Email</label>
            <form:input path="email" class="col-sm-12 form-group"/>
            <br/>
        </fieldset>
        <fieldset class="col-sm-12 form-group">
            <label class="col-sm-12 form-group">Name</label>
            <form:input path="name" class="col-sm-12 form-group"/>
            <br/>
        </fieldset>
        <fieldset class="col-sm-12 form-group">
            <label class="col-sm-12 form-group">Birthday</label>
            <form:input path="birthday" class="col-sm-12 form-group"/>
            <br/>
        </fieldset>

        <fieldset class="col-sm-12 form-group">
            <label class="col-sm-12 form-group">Room</label>
            <form:input path="room" class="col-sm-12 form-group"/>
        </fieldset>

        <fieldset class="col-sm-12 form-group">
            <label class="col-sm-12 form-group">Department</label>
            <form:input path="departmentName" class="col-sm-12 form-group"/>


        </fieldset>

        <form:hidden path="id"/>
        <br/>
        <input type="submit" class="btn btn-success" value="submit"/>
        <a class="btn btn-primary" href="/task4/employees/list/${department}">Back to ${department}</a>

    </form:form>


    <p style="color: brown">${warning}</p>
    <c:forEach items="${violations}" var="entry">
            <p style="color:red;"><strong>${entry.errorCode}</strong> : ${entry.messageTemplate} </p>
    </c:forEach>

</div>

</body>
</html>

