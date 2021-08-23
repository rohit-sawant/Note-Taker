package com.servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class UpdateNoteServlet
 */
public class UpdateNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateNoteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id ;
		Session session = FactoryProvider.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		try{
			 id = Integer.parseInt(request.getParameter("id").trim());
		
		String titleString = request.getParameter("title");
		String content = request.getParameter("content");
		
		Note note = session.get(Note.class, id);
		note.setContent(content);
		note.setTitle(titleString);
		note.setAddedDate(new Date());
		transaction.commit();
		
		response.sendRedirect("all_notes.jsp");
		}
		catch(Exception e) {
			System.out.println(request.getParameter("id"));
		}
		
	}

}
