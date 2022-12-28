package memberwriting;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import common.JDBConnect;

public class DatglDAO extends JDBConnect {
	
	public DatglDAO(ServletContext application) {
		super(application);
	}
	
	/* 낫또
	 * public int selectCount(Map<String, Object> map) { int totalCount = 0;
	 * 
	 * String query = "SELECT COUNT(*) FROM dot";
	 * 
	 * try { stmt = con.createStatement(); rs = stmt.executeQuery(query); rs.next();
	 * totalCount = rs.getInt(1); } catch(Exception e) {
	 * System.out.println("게시물 수를 구하는 중 예외 발생"); e.printStackTrace(); } return
	 * totalCount; }
	 */	
	public List<DatglDTO> selectListPage(Map<String, Object> map){
		List<DatglDTO> bbs = new ArrayList<DatglDTO>();
		
		String query = "SELECT * FROM dot ORDER BY postdate DESC";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			while(rs.next()) {
				DatglDTO dto = new DatglDTO();
				dto.setNumm(rs.getString(1));
				dto.setIdm(rs.getString(2));
				dto.setContentm(rs.getString(3));
				dto.setPostdatem(rs.getDate(4));
				
				bbs.add(dto);
			}
		}
		catch(Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		return bbs;
	}
	
	public int insertWrite(DatglDTO dto) {
		int result = 0;
		
		try {
			String query = "INSERT INTO dot ( "
					+ " num, id, content) "
					+ " Values (?, ?, ?)";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getNumm());
			psmt.setString(2, dto.getIdm());
			psmt.setString(3, dto.getContentm());
			System.out.println("겟넘:"+dto.getNumm());
			System.out.println("겟아:"+dto.getIdm());
			System.out.println("겟컨:"+dto.getContentm());
			
			result = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
}
