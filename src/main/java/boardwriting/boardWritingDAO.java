package boardwriting;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;
import javax.websocket.Session;

import common.JDBConnectWriting;
import fileupload.MyfileDTO;
import homework.board.BoardHomeDTO;

public class boardWritingDAO extends JDBConnectWriting {
	
	public boardWritingDAO(ServletContext application) {
		 
		super(application);
	}
	
public int selectCount(Map<String, Object> map) {
		
		int totalCount = 0; 
		
		String query = "SELECT COUNT(*) FROM writeboard WHERE b_flag='"+map.get("b_flag")+"' ";
		
		if(map.get("b_flag").equals("wm")) {
			query+= " and id='"+map.get("id")+"'";
		}
		if(map.get("searchWord") != null) {
			
			query += " AND "+ map.get("searchField") + ""
					+ " LIKE '%"+ map.get("searchWord")+ "%'";
		}
		
		try {
			
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			
			totalCount = rs.getInt(1);
		} 
		catch (Exception e) {
			System.out.println("게시물 수를 구하는 중 예외 발생");
			e.printStackTrace();
		}
		
		return totalCount;
	}
	
	public int selectCount2(Map<String, Object> map) {
		
		int totalCount = 0; 
		
		String query = "SELECT COUNT(*) FROM writeboard WHERE b_flag='si'";
		
		if(map.get("searchWord2") != null) {
			
			query += " AND "+ map.get("searchField2") + ""
					+ " LIKE '%"+ map.get("searchWord2")+ "%'";
		}
		
		try {
			
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			
			totalCount = rs.getInt(1);
		} 
		catch (Exception e) {
			System.out.println("게시물 수를 구하는 중 예외 발생");
			e.printStackTrace();
		}
		
		return totalCount;
	}
	
	public List<boardWritingDTO> selectList(Map<String, Object> map){
		
		List<boardWritingDTO> bbs = new Vector<boardWritingDTO>();
		
		String query = "SELECT * FROM writeboard";
		if(map.get("searchWord") != null) {
			query += " WHERE "+ map.get("searchField") + " LIKE '%"+ map.get("searchWord")+ "%'";
		}
		
		query += " ORDER BY num DESC ";
		
		try {
			
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			while (rs.next()) {
				
				boardWritingDTO dto = new boardWritingDTO();
				
				dto.setNum(rs.getString("num"));
				dto.setId(rs.getString("id"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setVisitcount(rs.getString("visitcount"));
				dto.setDowncount(rs.getInt("downcount"));
				dto.setOfile(rs.getString(8));
                dto.setSfile(rs.getString(9));
				bbs.add(dto);
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return bbs;
	}
	
	public int insertWrite(boardWritingDTO dto) {
		int result = 0;
		
		try {
			
			/*String query = "INSERT INTO board (num,title,content,id,visitcount) VALUES (seq_board_num.NEXTVAL, ?, ?, ?, 0)"; */
			
			String query = "INSERT INTO writeboard ( "
						 + " title,content,id,visitcount,b_flag, status, ofile, sfile) "
						 + " VALUES ( "
						 + " ?, ?, ?, 0, ?, 10, ?, ?)";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getId());
			psmt.setString(4, dto.getB_flag());
            psmt.setString(5, dto.getOfile());
            psmt.setString(6, dto.getSfile());
			
			result = psmt.executeUpdate();
		} 
		catch (Exception e) {
			System.out.println("게시물 입력중 예외 발생.");
			
			e.printStackTrace();
		}
		return result;
	}
	
	public void updateVisitCount(String num) {
		
		String query = "UPDATE writeboard SET "
					 + " visitcount=visitcount+1 "
					 + " WHERE num=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			rs= psmt.executeQuery();
		} catch (Exception e) {
			System.out.println("게시물 조회수 증가 중 예외 발생");
			e.printStackTrace();
		}
		
	}
	
	public int updateEdit(boardWritingDTO dto) {
		int result = 0;
		
		try {
			
			String query = "UPDATE writeboard SET "
						 + " title=?, content=?, "
						 + " modifydate=CURRENT_TIMESTAMP "
						 + " WHERE num=?";
			
			psmt = con.prepareStatement(query);
			
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getNum());
			
			result = psmt.executeUpdate();
			System.out.println(query);
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	
	public int deletePost (boardWritingDTO dto) {
		int result = 0;
		
		try {
			
			String query = "DELETE FROM writeboard WHERE num=?";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getNum());
			result = psmt.executeUpdate();
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	public List<boardWritingDTO> selectListPage(Map<String, Object> map){ 
		List<boardWritingDTO> bbs = new Vector<boardWritingDTO>();
		
		String query = "SELECT * FROM writeboard WHERE b_flag='"+map.get("b_flag")+"'";
		
		
		
		if(map.get("searchWord") != null) {
			query += " AND "+ map.get("searchField") + " "
					+ "LIKE '%"+ map.get("searchWord")+ "%'";
		}
		
		query += " ORDER BY num DESC LIMIT ?, ?";
		
		
		try {
			psmt = con.prepareStatement(query);
			
			psmt.setInt(1 , Integer.parseInt(map.get("start").toString()));
			psmt.setInt(2 , Integer.parseInt(map.get("end").toString()));
			rs = psmt.executeQuery();
			while (rs.next()) {
				boardWritingDTO dto = new boardWritingDTO();
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("visitcount"));
				dto.setB_flag(rs.getString("b_flag"));
				
				bbs.add(dto);
			}
		} 
		catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		
		return bbs;
	}
	
	
	public List<boardWritingDTO> selectListMyPage(Map<String, Object> map){ 
		List<boardWritingDTO> bbs = new Vector<boardWritingDTO>();
//		and id='"+map.get("id")+"'";
		
		String query = "SELECT * FROM writeboard WHERE b_flag='"+map.get("b_flag")+"' and id='"+map.get("id")+"'";
		
		if(map.get("searchWord") != null) {
			query += " AND "+ map.get("searchField") + " "
					+ "LIKE '%"+ map.get("searchWord")+ "%'";
		}
		
		query += " ORDER BY num DESC LIMIT ?, ?";
		
		
		try {
			psmt = con.prepareStatement(query);
			
			psmt.setInt(1 , Integer.parseInt(map.get("start").toString()));
			psmt.setInt(2 , Integer.parseInt(map.get("end").toString()));
			rs = psmt.executeQuery();
			while (rs.next()) {
				boardWritingDTO dto = new boardWritingDTO();
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("visitcount"));
				dto.setB_flag(rs.getString("b_flag"));
				
				bbs.add(dto);
			}
		} 
		catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		
		return bbs;
	}
	
	
	public boardWritingDTO selectView(String num) {
		
		boardWritingDTO dto = new boardWritingDTO();
		
		String query = "SELECT B.*, M.name "
					 + " FROM writemember M INNER JOIN writeboard B "
					 + " ON M.id=B.id "
					 + " WHERE num=?";
		
		try {
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			rs= psmt.executeQuery();
			
			if (rs.next()) {
				
				dto.setNum(rs.getString(1));
				dto.setTitle(rs.getString(2));
				
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setModifydate(rs.getDate("modifydate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("visitcount"));
				dto.setB_flag(rs.getString("b_flag"));//DTO에 b_flag추가
				dto.setSfile(rs.getString("sfile"));
				dto.setOfile(rs.getString("ofile"));
				
			}
		}
		catch (Exception e) {
			System.out.println("게시물 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		
		return dto;
		
	}
	
}


