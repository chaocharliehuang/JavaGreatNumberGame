package com.codingdojo.greatnumbergame.controllers;

import java.io.IOException;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/")
public class GreatNumberGame extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		if (session.getAttribute("randomNumber") == null) {
			Random rand = new Random();
			int randomNumber = rand.nextInt(10) + 1;
			session.setAttribute("randomNumber", randomNumber);
			request.setAttribute("randomNumber", randomNumber);
		}
		
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/game.jsp");
		view.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (request.getParameter("guess") != null) {
			int guess = Integer.parseInt(request.getParameter("guess"));
			session.setAttribute("guess", guess);
		} else {
			session.setAttribute("guess", null);
			session.setAttribute("randomNumber", null);
		}
		response.sendRedirect("/GreatNumberGame");
	}

}
