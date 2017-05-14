<%@taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Client Listing</title>
    </head>
    <body>
    	<div class="container">
    		<jsp:include page="../header.jsp"></jsp:include>
        
        	<h1>Client Listing</h1>     
        
        	<p><a href="${pageContext.request.contextPath}/client/create">Create New Client</a></p>
        	<c:choose>
            	<c:when test="${fn:length(clients) gt 0}">
            		<div class="table-responsive">
                		<table class="table table-hover table-condensed">
                    		<thead>
		                        <tr>
		                            <th nowrap>Company Name</th>
		                            <th>Website</th>
		                            <th nowrap>Phone number</th>
		                            <th>Address</th>
		                            <th>Contacts</th>
		                            <th>Actions</th>
		                        </tr>
		                    </thead>
		                    <tbody>
		                        <c:forEach items="${clients}" var="client">
			                        <tr>
										<td class="companyName">${client.companyName}</td>
										<td><a href="${client.website}">${client.website}</a></td>
										<td>${client.phone}</td>
										<td nowrap>${client.streetAddress}<br />${client.city}, ${client.state}&nbsp;&nbsp;${client.zipCode}</td>
										<td nowrap>
											<c:forEach items="${client.contacts}" var="contact" varStatus="status">
												${contact.firstName} ${contact.lastName}${!status.last ? '<br />' : ''}
											</c:forEach>
										</td>
										<td class="text-center">
											<a title="Edit" href="${pageContext.request.contextPath}/client/edit/${client.clientId}">
												<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
											</a>
											<br />
											<a class="text-danger delete" title="Delete" href="${pageContext.request.contextPath}/client/delete/${client.clientId}">
												<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
											</a>
										</td>
									</tr>
		                        </c:forEach>
		                    </tbody>
		                </table>
					</div>
            	</c:when>
            	<c:otherwise>
                	<p>No results found.</p>
            	</c:otherwise>
        	</c:choose>
        
			<jsp:include page="../footer.jsp"></jsp:include>
			<!-- bootstrap-dialog -->
			<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.9/js/bootstrap-dialog.min.js"></script>

		</div>

		<script>
			$(function(){
				$(".delete").click( function(event) {
			    	event.preventDefault();
			    	var link = $(this);
			    	var companyName = link.parent().siblings(".companyName").text();
			
			    	// Confirm the client delete
			    	BootstrapDialog.confirm({
			            title: 'WARNING',
			            message: 'You are about to delete ' + companyName + '. Are you sure?',
			            type: BootstrapDialog.TYPE_WARNING,
			            closable: true,
			            btnOKLabel: 'Delete',
			            btnOKClass: 'btn-danger',
			            callback: function(result) {
			                // result will be true if button was click, while it will be false if users close the dialog directly.
			                if(result) {
			                	var href = link.attr('href');
			                	var clientId = href.substring( href.lastIndexOf("/") + 1 );
			                	$.post( 
			                		"${pageContext.request.contextPath}/client/delete/",
			                		{	"clientId": clientId,
			        					command: "Delete"
			        				}
			                	).done( function() {
									location.reload();
								}).fail( function() {
									alert( "Error deleting client.");
								});
			                }else {
			                    // Do nothing
			                }
			            }
			        });
				});
			});
		</script>
    </body>
</html>
