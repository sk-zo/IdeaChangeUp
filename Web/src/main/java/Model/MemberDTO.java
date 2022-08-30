package Model;

public class MemberDTO {
	//회원 정보를 관리할 수 있는 DTO
	
	private String id;
	private String pw;
	private String phone;
	private int point;
	private int grade;
	
	// 생성자 메소드-회원가입
		public MemberDTO(String id, String pw, String phone, int point, int grade) {
			this.id = id;
			this.pw = pw;
			this.phone = phone;
			this.point = point;
			this.grade = grade;
		}
	// 생성자 메소드-로그인
	public MemberDTO(String id, String pw) {
		this.id = id;
		this.pw = pw;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}
	
}
