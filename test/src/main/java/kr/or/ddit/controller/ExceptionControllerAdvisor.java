package kr.or.ddit.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class ExceptionControllerAdvisor {

	//slf4j
	private static final Logger logger = LoggerFactory.getLogger(ExceptionControllerAdvisor.class);

	@ExceptionHandler(SQLException.class)
	public void sqlExceptionPage(Exception e,Model model,HttpSession session)
	{
//		String url="error/sqlException";
		logger.error(e.toString());
	}
	
	@ExceptionHandler(Exception.class)
	public void exceptionPage(Exception e)
	{
//		String url="error/exception";
		e.printStackTrace();
	}
}
