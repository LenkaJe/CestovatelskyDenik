package cz.czechitas.denik.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import cz.czechitas.denik.controller.ListController;

/**
 * Servlet implementation class DenikServlet
 */
@WebServlet("/DenikServlet")
public class DenikServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ListController listController = new ListController();
	private ListController insertController = new ListController();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DenikServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String action = request.getParameter("action");
		switch (action) {
			case "list" : 
				listController.handle(request, response);
				getServletConfig().getServletContext().getRequestDispatcher("/recordList.jsp").forward(request, response); 
				break;
			case "insert" : 
				insertController.handle(request,response);
				getServletConfig().getServletContext().getRequestDispatcher("/intro.jsp").forward(request, response);
				break; 
			default :
	            System.out.println("Akce nebyla rozpoznána.");
		}
		}

	// response.getWriter().append("Served at: ").append(request.getContextPath());

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
