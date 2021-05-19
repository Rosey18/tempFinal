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

@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private AdminDbUtil adminDbUtil;

	@Override
	public void init() throws ServletException {
		super.init();

		try {
			adminDbUtil = new AdminDbUtil(new DBSource());
		} catch(Exception e) {
			throw new ServletException(e);
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
		try {
			
			//read the "command" parameter
			String theCommand = request.getParameter("command");
			
			//if command is missing, then default to listing railway
			if (theCommand == null) {
				theCommand = "LIST";
			} 
			
			//route to the appropriated method 
			switch (theCommand) {
			
				case "LIST":
					listRailway(request, response);
					break;
					
				case "ADD":
					addTicket(request, response);
					break;
					
				case "LOAD":
					loadRailway(request, response);
					break;
					
				case "UPDATE": 
					updateTrain(request, response);
					break;
					
				case "DELETE": 
					deleteTrain(request, response);
					break;
				case "LOGOUT":{
					request.getSession().invalidate();
					response.sendRedirect(getServletContext().getContextPath()+"/login.jsp");
					return;
				}
				default:
					listRailway(request, response);
				}
			
			} catch (Exception exc) {
				
				throw new ServletException(exc);
			}
		
		HttpSession session = request.getSession(false); //Fetch session object
		 
//        if(session!=null) //If session is not null
//        {
//            session.invalidate(); //removes all session attributes bound to the session
//            request.setAttribute("errMessage", "You have logged out successfully");
//          /*RequestDispatcher requestDispatcher = request.getRequestDispatcher("/login.jsp");
//            requestDispatcher.forward(request, response);
//            System.out.println("Logged out");*/
//
//        }
			
	}


	private void deleteTrain(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
			// read train info from form data
			String theTrainId = request.getParameter("trainId");
			
			// delete train from DB
			adminDbUtil.deleteRailway(theTrainId);
			
			// send them back to 'list trains' page
			listRailway(request, response);
			
		}
	
	
	private void updateTrain(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
			// read train info from form data
			int id = Integer.parseInt(request.getParameter("trainId")); 
			String trainNum = request.getParameter("trainNum");
			String departure = request.getParameter("departure");
			String arrival = request.getParameter("arrival");
			String carriage = request.getParameter("carriage");
			int seat = Integer.parseInt(request.getParameter("seat"));
			int price = Integer.parseInt(request.getParameter("price"));
			
			// create  a new railway object
			Railway theRailway = new Railway(id, trainNum, departure, arrival, carriage, seat, price);
			
			// perform update on DB
			adminDbUtil.updateRailway(theRailway);
			
			listRailway(request, response);
		
	}

	private void loadRailway(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
					// read train id from form data
					String theRailwayId = request.getParameter("trainId");
					
					// get train from database (db util)
					Railway theRailway = adminDbUtil.getRailways(theRailwayId);
					
					// place train in the request attribute
					request.setAttribute("THE_TRAIN", theRailway);
												
					RequestDispatcher dispatcher = 
							request.getRequestDispatcher("/update-railway-form.jsp");
					dispatcher.forward(request, response);		
		
	}
	
	
	private void addTicket(HttpServletRequest request, HttpServletResponse response) throws Exception {

		//read railway info form data
		String trainNum = request.getParameter("trainNum");
		String departure = request.getParameter("departure");
		String arrival = request.getParameter("arrival");
		String carriage = request.getParameter("carriage");
		int seat = Integer.parseInt(request.getParameter("seat"));
		int price = Integer.parseInt(request.getParameter("price"));
		
		//create a new railway object 
		Railway theRailway = new Railway(trainNum, departure, arrival, carriage, seat, price); 
		
		//add the railway to the database
		adminDbUtil.addTicket(theRailway);
		
		//send back to the main page (the railway list)
		listRailway(request, response);
		
	}

	private void listRailway(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
		//get railways from db utill
		List<Railway> railway = adminDbUtil.getRailway();
		
		//add the railways to the request
		request.setAttribute("railway_list", railway);
		
		//send to JSP page
		RequestDispatcher dispatcher = request.getRequestDispatcher("/list-railways.jsp");
		dispatcher.forward(request, response);
		
	} 
	
}
