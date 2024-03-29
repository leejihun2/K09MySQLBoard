package memberwriting;
/*
DTO(Data Transfer Object)
: JSP와 Java파일간에 데이터를 전달하기 위한 객체로 자바빈(Java Bean)
규약에 의해 제작한다.
자바빈 규약은 교제 114페이지를 참조한다.
 */
public class WriteMemberDTO {
	
	//멤버변수 : member테이블의 컬럼과 동일하게 설정한다.
	private String id;
	private String pass;
	private String name;
	private String regidate;
	private String email;
	private String email2;
	private String pnum;
	
	/*
	생성자의 경우 꼭 필요한 경우가 아니라면 생성하지 않아도된다.
	생성자를 생성하지 않는 경우 컴파일러에 의해 디폴트생성자
	(기본생성자)가 자동으로 추가되기 때문이다.
	 */
	
	/* 정보은닉된 멤버변수에 접근을 위해 public으로 정의된
	getter setter를 정의한다. */
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRegidate() {
		return regidate;
	}
	public void setRegidate(String regidate) {
		this.regidate = regidate;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	public String getPnum() {
		return pnum;
	}
	public void setPnum(String pnum) {
		this.pnum = pnum;
	}
	
	
	
}

