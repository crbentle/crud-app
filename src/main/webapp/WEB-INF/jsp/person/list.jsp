<%-- 
    Document   : list
    Created on : Apr 22, 2011, 2:25:22 PM
    Author     : FMilens
--%>

<%@taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Person Listing</title>
    </head>
    <body>
    	<div class="container">
    		<jsp:include page="../header.jsp"></jsp:include>
			
			<!-- Bootstrap dataTables integration -->
			<script src="https://cdn.datatables.net/1.10.15/css/dataTables.bootstrap.min.css"></script>
        
        	<h1>Person Listing</h1>     
        
        	<p><a href="${pageContext.request.contextPath}/person/create">Create New Person</a></p>
        	<c:choose>
            	<c:when test="${fn:length(persons) gt 0}">
            		<div class="table-responsive">
		                <table id="person-table" class="table table-hover table-condensed">
		                    <thead>
		                        <tr>
		                            <th>First Name</th>
		                            <th>Last Name</th>
		                            <th>Email Address</th>
		                            <th>Client</th>
		                            <th>Actions</th>
		                        </tr>
		                    </thead>
		                    <tbody>
		                        <c:forEach items="${persons}" var="person">
		                            <tr>
		                                <td class="firstName">${person.firstName}</td>
		                                <td class="lastName">${person.lastName}</td>
		                                <td>${person.emailAddress}</td>
		                                <td>
		                                	<c:if test="${person.clientId ne null}">
		                                		${person.companyName}
		                                	</c:if>
		                                </td>
		                                
		                                <td class="text-center">
		                                    <a title="Edit" href="${pageContext.request.contextPath}/person/edit/${person.personId}">
		                                    	<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
		                                    </a>
		                                	<br />
		                                    <a class="text-danger delete" title="Delete" href="${pageContext.request.contextPath}/person/delete/${person.personId}">
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
			
			<!-- DataTables js -->
			<script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
			<script src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.9/js/bootstrap-dialog.min.js"></script>
			
			<!-- bootstrap-dialog -->
			<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.9/js/bootstrap-dialog.min.js"></script>
		</div>

		<script>
			$(function(){
		    	// initialize DataTable
		    	$('#person-table').DataTable( {
		            "paging":   false,
		            "ordering": true,
		            "info":     false,
		            "dom": '<"top"<"text-right"f>>rt<"clear">'
		        } );
		    	
				$(".delete").click( function(event) {
			    	event.preventDefault();
			    	var link = $(this);
			    	var personNameRows = link.parent().siblings(".firstName, .lastName");
			    	var personName = personNameRows.eq(0).text() + " " + personNameRows.eq(1).text();
			
			    	// Confirm the client delete
			    	BootstrapDialog.confirm({
			            title: 'WARNING',
			            message: 'You are about to delete ' + personName + '. Are you sure?',
			            type: BootstrapDialog.TYPE_WARNING,
			            closable: true,
			            btnOKLabel: 'Delete',
			            btnOKClass: 'btn-danger',
			            callback: function(result) {
			                // result will be true if button was click, while it will be false if users close the dialog directly.
			                if(result) {
			                	var href = link.attr('href');
			                	var personId = href.substring( href.lastIndexOf("/") + 1 );
			                	$.post( 
			                		"${pageContext.request.contextPath}/person/delete/",
			                		{	"personId": personId,
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
