package online;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class OnlineDAO {
	private static OnlineDAO onlineDAO = null;

	public static OnlineDAO getInstance() {
		if (onlineDAO == null) {
			onlineDAO = new OnlineDAO();
		}
		return onlineDAO;
	}

	private OnlineDAO() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

	}

	public List<OnlineDTO> getDeptList() {

		List<OnlineDTO> list = new ArrayList<>();
		StringBuffer sql = new StringBuffer();

		sql.append(" select sh_name, sh_location1, sh_location2, sh_state, sh_address2");
		sql.append(" from onlineClass");
		sql.append(" order by sh_name asc");

		try (Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "schoolsignal",
				"schoolsignal");
				PreparedStatement ps = conn.prepareStatement(sql.toString());
				ResultSet rs = ps.executeQuery()) {

			while (rs.next()) {
				OnlineDTO onlineDTO = new OnlineDTO();
				onlineDTO.setSh_name(rs.getString("sh_name"));          
				onlineDTO.setSh_location1(rs.getDouble("sh_location1"));
				onlineDTO.setSh_location2(rs.getDouble("sh_location2"));
				onlineDTO.setSh_state(rs.getString("sh_state"));        
				onlineDTO.setSh_address2(rs.getString("sh_address2"));  
				list.add(onlineDTO);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
}