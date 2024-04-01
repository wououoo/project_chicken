<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>

</head>
<body>
  <c:forEach items="${recipeVOList}" var="recipe">
    <tr>
        <td><a class='recipe_list'><c:out value="${recipe.recipe_Id}" /></a></td>
        <td><c:out value="${recipe.recipe_Name}" /></td>
        <td><c:out value="${recipe.product_Id}" /></td>
        <td><fmt:formatDate pattern="yyyy-MM-dd" value="${recipe.registration_Date}" /></td>
        <td><fmt:formatDate pattern="yyyy-MM-dd" value="${recipe.modify_Date}" /></td>
    </tr>
  </c:forEach>
</body>
</html>
