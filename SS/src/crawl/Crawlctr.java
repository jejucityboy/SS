package crawl;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/news_crawl")
public class Crawlctr extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		CrawlDAO crawlDAO = CrawlDAO.getInstance();
		List<CrawlDTO> list = crawlDAO.getCrawlList();

		request.setAttribute("list", list);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/views/from.jsp");
		dispatcher.forward(request, response);
	}

}