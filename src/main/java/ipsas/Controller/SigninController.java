package ipsas.Controller;
/**
* @Author -- Moez Kchaou
*/
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ipsas.dao.ContactDaoHib;
import ipsas.dao.ConventionDaoHib;
import ipsas.dao.ParticipantDaoHib;
import ipsas.dao.UserDaoHib;
import ipsas.model.User;

/**
 * Servlet implementation class SigninController
 */
@WebServlet("/SigninController")
public class SigninController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SigninController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getServletContext().getRequestDispatcher("/IPSAS/signin.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		HttpSession session = request.getSession();

		if (UserDaoHib.findByEmailAndPwd(email, pwd)) {
			User user = UserDaoHib.sendEmail(email, pwd);
			//response.sendRedirect(request.getContextPath() + "/IndexServlet");
			//request.setAttribute("user", user);
			session.setAttribute("allconvention", ConventionDaoHib.findAll());
			session.setAttribute("listcontact", ContactDaoHib.findAll());
			session.setAttribute("listparticipants", ParticipantDaoHib.findAllparticipant());
			session.setAttribute("user", user);
			request.getServletContext().getRequestDispatcher("/IPSAS/index.jsp").forward(request, response);
		} else {
			request.setAttribute("error", "you must to correct your information !!");
			doGet(request, response);

		}

	}

}
