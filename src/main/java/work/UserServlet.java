package work;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private UserDbUtil userDbUtil;

	@Override
	public void init() throws ServletException {
		super.init();

		try {
			userDbUtil = new UserDbUtil(new DBSource());

		} catch (Exception e) {
			throw new ServletException(e);
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {

			// read the "command" parameter
			String theCommand = request.getParameter("command");

			// if command is missing, then default to listing railway
			if (theCommand == null) {
				theCommand = "LIST";
			}

			// route to the appropriated method
			switch (theCommand) {

			case "LIST":
				listRailwayUser(request, response);
				break;

			case "LOAD_USER":
				loadRailwayUser(request, response);
				break;

			case "DECREASE":
				decreaseSeat(request, response);
				break;

			case "LOGOUT": {
				request.getSession().invalidate(); // invalidate(): удаляет из сессии все объекты
				response.sendRedirect(getServletContext().getContextPath() + "/login.jsp");
				return;
			}
			default:
				listRailwayUser(request, response);
			}

		} catch (Exception exc) {

			throw new ServletException(exc);
		}

		HttpSession session = request.getSession(false); // Fetch session object

//        /*if(session!=null) //If session is not null
//        {
//            session.invalidate(); //removes all session attributes bound to the session
//            request.setAttribute("errMessage", "You have logged out successfully");
//          *//*RequestDispatcher requestDispatcher = request.getRequestDispatcher("/login.jsp");
//            requestDispatcher.forward(request, response);
//            System.out.println("Logged out");*//*
//
//        }*/

	}

	private void decreaseSeat(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String theTrainId = request.getParameter("trainId");

		userDbUtil.decreaseSeat(theTrainId);

		response.sendRedirect(getServletContext().getContextPath() + "/UserServlet");

	}

	private void loadRailwayUser(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// read train id from form data
		String theRailwayId = request.getParameter("trainId");

		// get train from database (db util)
		Railway theRailway = userDbUtil.getRailways(theRailwayId);

		// place train in the request attribute
		request.setAttribute("SELECTED", theRailway);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/update-railway-form-user.jsp");
		dispatcher.forward(request, response);

	}

	private void listRailwayUser(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// get railways from db utill
		List<Railway> railway = userDbUtil.getRailway();

		// add the railways to the request
		request.setAttribute("railway_list", railway);

		// send to JSP page
		RequestDispatcher dispatcher = request.getRequestDispatcher("/list-railways-user.jsp");
		dispatcher.forward(request, response);

	}

}
