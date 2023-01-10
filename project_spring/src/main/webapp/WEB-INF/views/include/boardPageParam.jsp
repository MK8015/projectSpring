<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form method="get" id="frmPaging">
	<input type="hidden" name="page" value="${BoardPagingDto.page}"/>
	<input type="hidden" name="perPage" value="8"/>
</form>