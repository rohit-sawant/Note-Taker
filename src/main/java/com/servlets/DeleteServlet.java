package com.servlets;

import java.io.IOException;
import java.nio.channels.ClosedByInterruptException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;

import javassist.bytecode.analysis.ControlFlow.Node;

/**
 * Servlet implementation class DeleteServlet
 */
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id =  Integer.parseInt(request.getParameter("id").trim());
		Session session = FactoryProvider.getSessionFactory().openSession();
		Transaction txTransaction = session.beginTransaction();
		Note del = session.get(Note.class, id);
		session.delete(del);
		txTransaction.commit();
		session.close();
		response.sendRedirect("all_notes.jsp");
	}


}
