package crawl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CrawlDAO {
	private static CrawlDAO crawlDAO = null;

	public static CrawlDAO getInstance() {
		if (crawlDAO == null) {
			crawlDAO = new CrawlDAO();
		}
		return crawlDAO;
	}

	private CrawlDAO() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

	}

	public List<CrawlDTO> getDeptList() {

		List<CrawlDTO> list = new ArrayList<>();
		StringBuffer sql = new StringBuffer();

		sql.append(" select arti_tit, arti_link, arti_text, arti_img, arti_date");
		sql.append(" from school_crawl");

		try (Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "schoolsignal",
				"schoolsignal");
				PreparedStatement ps = conn.prepareStatement(sql.toString());
				ResultSet rs = ps.executeQuery()) {

			while (rs.next()) {
				CrawlDTO crawlDTO = new CrawlDTO();
				crawlDTO.setArti_tit(rs.getString("arti_tit"));
				crawlDTO.setArti_link(rs.getString("arti_link"));
				crawlDTO.setArti_text(rs.getString("arti_text"));
				crawlDTO.setArti_img(rs.getString("arti_img"));
				crawlDTO.setArti_date(rs.getString("arti_date"));
				list.add(crawlDTO);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
}