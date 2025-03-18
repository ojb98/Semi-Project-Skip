<%@page import="adminPageMapper.AdminCustomersMapper"%>
<%@page import="adminPageMapper.AdminApprovalRequestMapper"%>
<%@page import="mybatis.service.SqlSessionFactoryService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

    int uuid =Integer.parseInt(request.getParameter("uuid"));
    SqlSession sqlSession= SqlSessionFactoryService.getSqlSessionFactory().openSession();
	AdminCustomersMapper mapper = sqlSession.getMapper(AdminCustomersMapper.class);
    int deleteCount = mapper.deleteUsers(uuid);
    if(deleteCount > 0){
    	sqlSession.commit();
        out.print("success");
    } else {
        out.print("failed");
    }
    sqlSession.close();
%>