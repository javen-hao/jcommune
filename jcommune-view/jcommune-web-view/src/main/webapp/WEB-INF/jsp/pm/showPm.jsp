<%--

    Copyright (C) 2011  JTalks.org Team
    This library is free software; you can redistribute it and/or
    modify it under the terms of the GNU Lesser General Public
    License as published by the Free Software Foundation; either
    version 2.1 of the License, or (at your option) any later version.
    This library is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    Lesser General Public License for more details.
    You should have received a copy of the GNU Lesser General Public
    License along with this library; if not, write to the Free Software
    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="jtalks" uri="http://www.jtalks.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<head>
    <script language="javascript"
            src="${pageContext.request.contextPath}/resources/javascript/custom/privateMessages.js"></script>
    <title><spring:message code="label.pm_title"/></title>
</head>
<body>

<div class="container">
    <h2><spring:message code="label.pm_title"/></h2>
    <hr/>
    <div class="row">
        <div class="span2">
            <sec:authentication property="principal.id" var="userId"/>
            <a href="${pageContext.request.contextPath}/pm/new?userId=${userId}"
               class="btn btn-primary btn-small pm_buttons">
                <spring:message code="label.new_pm"/></a>
            <jsp:include page="../../template/pmFolders.jsp"/>
        </div>
        <!-- /span2 -->
        <div class="span9">
            <div class="pm_buttons">
                <c:if test="${pm.replyAllowed && (pm.userTo eq user)}">
                    <a class="btn btn-primary"
                       href="${pageContext.request.contextPath}/reply/${pm.id}?userId=${userId}">
                        <i class="icon-share-alt icon-white"></i>
                        <spring:message code="label.reply"/>
                    </a>

                    <a class="btn"
                       href="${pageContext.request.contextPath}/quote/${pm.id}?userId=${userId}">   <%--todo--%>
                        <i class="icon-quote"></i>
                        <spring:message code="label.quote"/>
                    </a>
                </c:if>
                <span class="del">
                    <a id="deleteOnePM"
                       class="btn btn-danger delete"
                       href="${pageContext.request.contextPath}/pm"
                       rel="<spring:message code="label.deletePMConfirmation"/>">

                        <i class="icon-trash icon-white"></i>
                        <spring:message code="label.delete"/>
                    </a>
                    <input id="PMId" type="hidden" value="${pm.id}"/>
                    <form:form id="deleteForm" method="DELETE"/>
                </span>
                <!-- del -->

            </div>
            <!-- pm_buttons -->

            <div class="well pm_message_view">
                <div class="row pm_message_detail">
                    <div class="pull-left thumbnail pm_message_avatar">
                        <img src="${pageContext.request.contextPath}/users/${pm.userFrom.id}/avatar" alt=""/>
                    </div>
                    <div class="pm_message_userTo_link">
                        <a href="${pageContext.request.contextPath}/users/${pm.userTo.id}">
                            <i class="icon-user"></i><c:out value="${pm.userFrom.username}"/>
                        </a>
                        <br/>
                        <span><i class="icon-calendar"></i><jtalks:format value="${pm.creationDate}"/></span>
                    </div>
                </div>
                <div class="pm-text-box">
                    <jtalks:bb2html bbCode="${pm.body}"/>
                    ${pm.userFrom.renderedSignature}
                </div>
            </div>

        </div>

    </div>
    <!-- /row -->

</div>
<!-- /container -->

<div class="footer_buffer"></div>
</body>
