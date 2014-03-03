package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import app.App;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("LoginServlet: Recieved GET request");
		
		// Retrieve username & password from the request
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		// Get app
		App app = (App)request.getSession().getAttribute("app");
		if(app == null){
			System.out.println("LoginServlet: App not found!");
			return;
		}
		
		// Begin auth procedures
		if(username != null && !username.isEmpty() && password != null && !password.isEmpty()){
			System.out.println("LoginServlet: Trying to login user: " + username);

			if (app.signIn(username, password)){				
				System.out.println("LoginServlet: Login success for user: " + username);
				
				// Login successful, Store username as a session variable
				request.getSession().setAttribute("username", username);
				request.getSession().setAttribute("loginStatus", "Success");
			} else {
				
				// Login unsuccessful
				request.getSession().setAttribute("loginStatus", "Failed to login");
			}
		} else {
			request.getSession().setAttribute("loginStatus", "Invalid username/password");
		}
		
		RequestDispatcher dispatch = request.getRequestDispatcher("home.jsp");
		dispatch.forward(request, response);	
	}

}
