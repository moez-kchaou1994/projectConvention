package ipsas.Controller;
/**
* @Author -- Moez Kchaou
*/
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ipsas.dao.ParticipantDaoHib;
import ipsas.model.Participant;

/**
 * Servlet implementation class ParticipantController
 */
@WebServlet("/ParticipantController")
public class ParticipantController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public ParticipantController() {
		super();
		// TODO Auto-generated constructor stub
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setAttribute("listparticipants", ParticipantDaoHib.findAllparticipant());
		request.getServletContext()
				.getRequestDispatcher("/IPSAS/participant.jsp")
				.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		Participant participant = new Participant();
		participant.setParticipant(request.getParameter("participant"));

		ParticipantDaoHib.save(participant);
		//response.sendRedirect("IPSAS/convention.jsp");
		//session.setAttribute("listparticipants", ParticipantDaoHib.findAllparticipant());
		doGet(request, response);
	}

}
