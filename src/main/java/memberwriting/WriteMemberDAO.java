package memberwriting;

import java.sql.SQLException;

import javax.servlet.ServletContext;

import common.JDBConnect;
import common.JDBConnectWriting;
import homework.board.BoardHomeDTO;
/*
DAO(Data Access Object)
: 실제 데이터베이스에 접근하여 여러가지 GRUD작업을 하기위한 객체
 */
public class WriteMemberDAO extends JDBConnectWriting {
	
	//생성자 메서드
	//매개변수가 4개인 부모의 생성자를 호출하여 DB에 연결한다.
	public WriteMemberDAO(String drv, String url, String id, String pw) {
		super(drv, url, id, pw);
	}
	//application 내장 객체만 매개변수로 전달한 후 DB에 연결한다.
	public WriteMemberDAO(ServletContext application) {
		super(application);
	}
	
	/*
	사용자가 입력한 아이디, 패스워드를 통해 회원테이블을 select한 후
	존재하는 정보인 경우 DTO객체에 그 정보를 담아 반환한다.
	 */
	public WriteMemberDTO getWriteMemberDTO(String uid, String upass) {
		
		/*로그인을 위한 쿼리문을 실행한 후 회원정보를 저장하기 위해
		생성*/
		WriteMemberDTO dto = new WriteMemberDTO();
		//로그인 위해 인파라미터가 있는 동적 쿼리문 작성
		String query = "SELECT * FROM writemember WHERE id=? AND pass=?";
		
		try {
			//쿼리문 실행을 위한 prepared객체 생성 및 인파라미터 설정
			psmt = con.prepareStatement(query);
			psmt.setString(1, uid);
			psmt.setString(2, upass);
			//select 쿼리문을 실행한 후 ResultSet으로 반환받는다.
			rs = psmt.executeQuery();
			
			//반환된 ResultSet객체를 통해 회원정보가 있는지 확인한다.
			if (rs.next()) {
				//정보가 있다면 DTO객체에 회원정보를 저장한다.
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				//"3"이렇게 쓰면 인덱스의 번호가 아니라 인덱스안에 3이 있는지 찾는거
				dto.setName(rs.getString(3));
				dto.setRegidate(rs.getString(4));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		//호출한 지점으로 DTO객체를 반환한다.
		return dto;
	}
	
	public int insertRegister(WriteMemberDTO dto) {
		int result = 0;
		
		try {
			
			String query = "INSERT INTO writemember (id, pass, name, email, email2, pnum) VALUES (?, ?, ?, ?, ?, ?)";
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPass());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getEmail());
			psmt.setString(5, dto.getEmail2());
			psmt.setString(6, dto.getPnum());
			
			result = psmt.executeUpdate();
		} 
		catch (Exception e) {
			System.out.println("게시물 입력중 예외 발생.");
			
			e.printStackTrace();
		}
		return result;
	}
	public boolean  dupChkID(String id) {
		
		String query =" select id from writemember where id = ?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			rs= psmt.executeQuery();
			
			if (rs.next()) {
				System.out.println("중복아이디 있음 : " +  rs.getString("id"));
				return false;
				
			}
			
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		
		System.out.println("중복아이디없음");
		return true;
	}
	public WriteMemberDTO selectMember(String id) {
			System.out.println(id);
		WriteMemberDTO dto = new WriteMemberDTO();
			
			String query = "SELECT id, pass, name, email, email2, pnum FROM writemember where id=? ";
			
			try {
				
				psmt = con.prepareStatement(query);
				psmt.setString(1, id);
				rs= psmt.executeQuery();
				
				if (rs.next()) {
					
					dto.setId(rs.getString("id"));
					dto.setPass(rs.getString("pass"));
					dto.setName(rs.getString("name"));
					dto.setEmail(rs.getString("email"));
					dto.setEmail2(rs.getString("email2"));
					dto.setPnum(rs.getString("pnum"));
					
				}
				System.out.println(dto);
			}
			catch (Exception e) {
				System.out.println("게시물 상세보기 중 예외 발생");
				e.printStackTrace();
			}
			
			return dto;
			
	}
	public int updateModify(WriteMemberDTO dto) {
		int result = 0;
		
		try {
			
			String query = "UPDATE writemember SET "
					+ " pass=?,  name=?, email=?, email2=?, pnum=?"
					+ " WHERE id=? ";
			
			psmt = con.prepareStatement(query);
			
			psmt.setString(1, dto.getPass());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getEmail());
			psmt.setString(4, dto.getEmail2());
			psmt.setString(5, dto.getPnum());
			psmt.setString(6, dto.getId());
			
			result = psmt.executeUpdate();
			
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
		
	public WriteMemberDTO searchId(String name, String pnum) {
		WriteMemberDTO dto = new WriteMemberDTO();
		String query = "SELECT count(*), id FROM writemember WHERE name=? AND pnum=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, name);
			psmt.setString(2, pnum);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setName(rs.getString(1));
				dto.setId(rs.getString(2));				
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public WriteMemberDTO searchPw(String id, String pnum) {
		WriteMemberDTO dto = new WriteMemberDTO();
		String query = "SELECT * FROM writemember WHERE id=? AND pnum=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			psmt.setString(2, pnum);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setPass(rs.getString(2));
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
}
