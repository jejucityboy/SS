package school.controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import school.models.SchoolDAO;
import school.models.SchoolDTO;

@WebServlet("/schoolSignal")
public class SchoolController extends HttpServlet {

	@Override
	public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException {
		SchoolDAO deptDAO = SchoolDAO.getInstance();
		List<SchoolDTO> list = deptDAO.getDeptList();

		request.setAttribute("list", list);
		request.setAttribute("title", "학교위치");
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/views/SchoolLocation.jsp");
		dispatcher.forward(request, response);
		
	}

}
