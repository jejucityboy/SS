package school.controllers;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import school.models.SchoolDAO;
import school.models.SchoolDTO;

@WebServlet("/schoolSignal")
public class SchoolController extends HttpServlet {

	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SchoolDAO deptDAO = SchoolDAO.getInstance();
		List<SchoolDTO> list = deptDAO.getDeptList();

		request.setAttribute("list", list);
		request.setAttribute("title", "학교위치");
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/schoolSignal/kakaoAPI.jsp");
		dispatcher.forward(request, response);
	}

}
