package online;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/onlineClass")
public class Onlinectr extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		OnlineDAO onlineDAO = OnlineDAO.getInstance();
		List<OnlineDTO> list = onlineDAO.getDeptList();

		request.setAttribute("list", list);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/views/onlineList.jsp");
		dispatcher.forward(request, response);
	}

}