package work;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


/**
 * Servlet implementation class RailwayControllerServlet
 */
@WebServlet("/RailwayControllerServlet")
public class RailwayControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private RailwayDbUtil railwayDbUtil;
	

	@Override
	public void init() throws ServletException {
		super.init();
		
		//create our railway db util ... and pass in the conn pool / datasource
		try {
			railwayDbUtil = new RailwayDbUtil(new DBSource());
			
		} catch(Exception e) {
			throw new ServletException(e);
		}
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	    String userName = request.getParameter("user_name");
	    String password = request.getParameter("password");
	 
	    LoginBean loginBean = new LoginBean();
	 
	    loginBean.setUserName(userName);
	    loginBean.setPassword(password);
	 
	    try
	    {
	        String userValidate = railwayDbUtil.authenticateUser(loginBean);
	 
	        if(userValidate.equals("Admin_Role"))
	        {
	            System.out.println("Admin's Home");
	 
	            HttpSession session = request.getSession(); //Creating a session
	            session.setAttribute("Admin", userName); //setting session attribute
	            
	            response.sendRedirect(getServletContext().getContextPath() + "/AdminServlet");;
	            
	           
	        }
	        else if(userValidate.equals("User_Role"))
	        {
	            System.out.println("User's Home");
	 
	            HttpSession session = request.getSession();
	            session.setMaxInactiveInterval(10*60);
	            session.setAttribute("User", userName);
	            
	            response.sendRedirect(getServletContext().getContextPath() + "/UserServlet");
	         
	        }
	        else
	        {
	            System.out.println("Error message = " + userValidate);
	            request.setAttribute("errMessage", userValidate);
	 
	            request.getRequestDispatcher("/login.jsp").forward(request, response);
	        }
	    }
	    catch (IOException e1)
	    {
	        e1.printStackTrace();
	    }
	    catch (Exception e2)
	    {
	        e2.printStackTrace();
	    }
	} 
}
	
