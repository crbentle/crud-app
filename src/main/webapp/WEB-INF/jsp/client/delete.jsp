<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Delete Client</title>
    </head>
    <body>
		<div class="container">
			<jsp:include page="../header.jsp"></jsp:include>
        	
        	<h1 class="text-center">Delete Client</h1>
        	<p>You are about to delete the client ${client.companyName}:  Are you sure?</p>
        	<form action="${pageContext.request.contextPath}/client/delete" method="post">
            	<input type="hidden" name="clientId" value="${client.clientId}"/>
            	<input type="submit" name="command" value="Cancel"/>
            	<input type="submit" name="command" value="Delete"/>
        	</form>
			
			<jsp:include page="../footer.jsp"></jsp:include>
		</div>
    </body>
</html>
