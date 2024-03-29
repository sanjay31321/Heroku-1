<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>

<tiles:insertDefinition name="adminTemplate">
	<tiles:putAttribute name="body">
		<c:set var="role" value="${role}"/>
		<c:if test="${role!='authenticated'}">
			<script type="text/javascript">	window.location.href="login.html"; </script>
		</c:if>

		<div class="margin-left-right">
			<ul class="breadcrumb">
				<li>
					<i class="glyphicon glyphicon-home"></i> 
					<a href="${loggedInUserHOMELINK}"><spring:message code="${loggedInUserHOME}" /></a> 
					<span class="divider">�</span></li>
				<li>
					<a href="subjectmanager.html"><spring:message code="app.panel.title.subjectmanager" /></a>
				</li>
			</ul>
		</div>
	<div class="col-sm-1"></div>
	<div class="col-sm-10">
		<div class="panel panel-default">
 		<div class="panel-heading"><spring:message code="app.panel.title.subjectmanager" /></div>
 			<div class="panel-body">
				<div class="row">
					<div class="col-sm-8">
						<div class="alert alert-error"> ${Msg} ${errorMsg} </div>
							<form:form commandName="subject">
								<div class="input-group">
									<form:input path="name" class="form-control" required="true"/>
									<form:errors path="name" cssClass="errorblock" /> 
										<span class="input-group-btn">
											<button type="submit" class="btn btn-default" type="button">
											<spring:message code="app.btn.addsubject" />
										</button>
									</span>
								</div>
							</form:form>
						</div>
    			</div>
    			<hr/>
				<div class="table-responsive">
						<table class="table table-striped">
							<thead>
								<tr>
									<th>#</th>
									<th><spring:message code="app.panel.subject" /></th>
									<th><spring:message code="app.panel.action" /></th>

								</tr>
							</thead>
							<tbody>
								<c:forEach items="${subjectList}" var="subject">
									<c:set var="counter" value="${counter + 1}"/>
									<tr>
										<td>${counter}</td>
										<td>${subject.name}</td>
										<td>
											<a href="editsubject.html?id=${subject.id}" class="btn btn-sm btn-primary">EDIT</a>
											<a href="deletesubject.html?id=${subject.id}" class="btn btn-sm btn-danger">DELETE</a>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
          		</div>
          	</div>
          </div>
	</tiles:putAttribute>
</tiles:insertDefinition>
