<%@page import="adminPageMapper.RootAdminMapper"%>
<%@page import="mybatis.service.SqlSessionFactoryService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

    int uuid =Integer.parseInt(request.getParameter("uuid"));
    SqlSession sqlSession= SqlSessionFactoryService.getSqlSessionFactory().openSession();
	RootAdminMapper mapper = sqlSession.getMapper(RootAdminMapper.class);
    int deleteCount = mapper.deleteUsers(uuid);
    if(deleteCount > 0){
    	sqlSession.commit();
        out.print("success");
    } else {
        out.print("failed");
    }
    sqlSession.close();
%>