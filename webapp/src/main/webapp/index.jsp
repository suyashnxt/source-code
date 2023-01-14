<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.Locale"%>
<%@ page import="java.util.ResourceBundle"%>
<%@ page trimDirectiveWhitespaces="true"%>
<portlet:defineObjects />

<div class="mdblogPortlet">
    <h1 class="mdblogTitle">${blog.title }</h1>
    <h3 class="mdblogLastUpdated">
    	<fmt:formatDate value="${blog.lastUpdatedDate }" dateStyle="FULL" />
	</h3>
	<div class="mdblogActions">
    	<ul>
    		<c:if test="${permissions.canEdit && not empty blog }">
	    		<portlet:renderURL var="editUrl" portletMode="EDIT"/>
		    	<li><a href="${editUrl }">Edit</a></li>
	    	</c:if>
	    	<c:if test="${permissions.canEdit && empty blog }">
	    		<portlet:renderURL var="editUrl" portletMode="EDIT"/>
		    	<li><a href="${editUrl }">Create New Content</a></li>
	    	</c:if>
	    	
	    	<c:if test="${permissions.canCreate && not empty blog }">
	    		<li><a href="#" class="mdblogAddSubpageLink" data="<portlet:namespace/>_mdblogAddContainer">New Blog</a></li>
	    	</c:if>
	    	
	    	<c:if test="${permissions.canDelete }">
	    		<portlet:actionURL var="deleteUrl" name="delete"/>
		    	<li><a href="${deleteUrl }"><span>Delete</span></a></li>
	    	</c:if>
    	</ul>
    </div>
    <div class="clear"> </div>
    <div class="mdblogContent">
        ${blog.content}
    </div>
    <div class="mdblogTags">
    	<ul>
	    	<c:forEach items="${blog.tags }" var="tag">
	    		<li>${tag }</li>
	    	</c:forEach>
    	</ul>
    </div>
    
    <div class="mdblogPages">
    	<ul class="mdblogMenu">
	    	<c:forEach items="${nodes }" var="node">
	    		<li><a href="${node.uri }"><span>${node.label }</span></a></li>
	    	</c:forEach>
    	</ul>
    </div>
    
    <div class="clear"> </div>
    
    
	<div id="<portlet:namespace/>_mdblogAddContainer" class="mdblogAddContainer" style="display: none;">
		<portlet:actionURL var="actionUrl" name="add"/>
		<form id="<portlet:namespace/>_add_subpage_form"action="${actionUrl }" class="mdblogForm" method="POST">
			<fieldset>
			    <label for="name">Name</label>
			    <input type="text" name="name" class="text ui-widget-content ui-corner-all" />
			    <label for="email">Title</label>
			    <input type="text" name="title" value="" class="text ui-widget-content ui-corner-all" />
			</fieldset>
		</form>
	</div>
</div>
