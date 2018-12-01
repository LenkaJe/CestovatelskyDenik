package cz.czechitas.denik.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cz.czechitas.denik.controller.DetailController;
import cz.czechitas.denik.controller.InsertController;
import cz.czechitas.denik.controller.ListController;

/**
 * Servlet implementation class DenikServlet
 */
@WebServlet("/DenikServlet")
public class DenikServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ListController listController = new ListController();
	private InsertController insertController = new InsertController();
	private DetailController detailController = new DetailController();

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
				System.out.println("debug_Ver�a list za�atek ");
				listController.handle(request, response);
				getServletConfig().getServletContext().getRequestDispatcher("/recordList.jsp").forward(request, response);
				System.out.println("debug_Ver�a list");
				break;
			case "insert" : 
				insertController.handle(request,response);
				getServletConfig().getServletContext().getRequestDispatcher("/intro.jsp").forward(request, response);
				System.out.println("debug_Ver�a insert");
				break; 
				
			case "detail" :
				detailController.handle(request,response);
				getServletConfig().getServletContext().getRequestDispatcher("/record.jsp").forward(request, response);
				System.out.println("debug_Ver�a detail");
				break; 
			default :
	            System.out.println("Akce nebyla rozpozn�na.");
	            System.out.println("debug_Ver�a 1");
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
