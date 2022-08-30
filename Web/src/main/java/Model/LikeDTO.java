package Model;

public class LikeDTO {
	private int post_num;
	private String id;
	private boolean checked;
	
	public LikeDTO() {}
	
	
	
	public LikeDTO(int post_num, String id) {
		super();
		this.post_num = post_num;
		this.id = id;
	}



	public LikeDTO(int post_num, String id, boolean checked) {
		super();
		this.post_num = post_num;
		this.id = id;
		this.checked = checked;
	}
	
	public int getPost_num() {
		return post_num;
	}
	public void setPost_num(int post_num) {
		this.post_num = post_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public boolean isChecked() {
		return checked;
	}
	public void setChecked(boolean checked) {
		this.checked = checked;
	}
	
	
}
