package crawl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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

	private Connection getConnenction() throws SQLException {
		// TODO Auto-generated method stub
		return DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "schoolsignal", "schoolsignal");
	}

	public List<CrawlDTO> getCrawlList() {
		List<CrawlDTO> list = new ArrayList<>();

		StringBuffer sql = new StringBuffer();
		sql.append(" select arti_tit, arti_link, arti_text, arti_img, arti_date");
		sql.append(" from	school_crawl");

		try (Connection conn = getConnenction(); PreparedStatement pstmt = conn.prepareStatement(sql.toString())) {

			try (ResultSet rs = pstmt.executeQuery()) {

				while (rs.next()) {
					CrawlDTO crawlDTO = new CrawlDTO();
					crawlDTO.setArti_tit(rs.getString("arti_tit"));
					crawlDTO.setArti_link(rs.getString("arti_link"));
					crawlDTO.setArti_text(rs.getString("arti_text"));
					crawlDTO.setArti_img(rs.getString("arti_img"));
					crawlDTO.setArti_date(rs.getString("arti_date"));
					list.add(crawlDTO);
				}

			}
		} catch (Exception e) {
			e.printStackTrace();

		}

		return list;

	}



	public boolean deleteAll() {
		// TODO Auto-generated method stub
		boolean result = false;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" delete school_crawl"); 

		try (Connection conn = getConnenction(); PreparedStatement pstmt = conn.prepareStatement(sql.toString())) {

			if (pstmt.executeUpdate() > 0) { // 쿼리 실행
				result = true; // sql문이 정상 실행됐을 때 true
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public boolean insertCrawl(List<CrawlDTO> crawl_list) {
		// TODO Auto-generated method stub
		boolean result = false;

		
		
		StringBuffer sql2 = new StringBuffer();
		sql2.append(" insert into school_crawl(arti_tit, arti_link, arti_text, arti_img, arti_date)");
		sql2.append(" values(?, ?, ?, ?, ?)");

		try (Connection conn2 = getConnenction(); PreparedStatement pstmt = conn2.prepareStatement(sql2.toString())) {

			for (CrawlDTO crawlDTO : crawl_list) {
				pstmt.setString(1, crawlDTO.getArti_tit());
				pstmt.setString(2, crawlDTO.getArti_link());
				pstmt.setString(3, crawlDTO.getArti_text());
				pstmt.setString(4, crawlDTO.getArti_img());
				pstmt.setString(5, crawlDTO.getArti_date());
				pstmt.executeUpdate();
				
				
			}
			result = true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
		
	}

}