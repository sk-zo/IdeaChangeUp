package Model;

public class MyInfoDTO {
	private int mypost;
	private int mycomment;
	private int likepost;
	private int mycompete;
	
	public MyInfoDTO() {
		super();
	}

	public MyInfoDTO(int mypost, int mycomment, int likepost, int mycompete) {
		super();
		this.mypost = mypost;
		this.mycomment = mycomment;
		this.likepost = likepost;
		this.mycompete = mycompete;
	}


	public int getMypost() {
		return mypost;
	}

	public void setMypost(int mypost) {
		this.mypost = mypost;
	}

	public int getMycomment() {
		return mycomment;
	}

	public void setMycomment(int mycomment) {
		this.mycomment = mycomment;
	}

	public int getLikepost() {
		return likepost;
	}

	public void setLikepost(int likepost) {
		this.likepost = likepost;
	}
	public int getMycompete() {
		return mycompete;
	}
	public void setMycompete(int mycompete) {
		this.mycompete = mycompete;
	}
	
	
}
