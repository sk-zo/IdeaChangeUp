package Model;

public class CommentDTO {
	private int comment_num;
	private int post_num;
	private String writer;
	private String content;
	private String comment_time;
	
	
	
	public CommentDTO() {
		super();
	}
	public CommentDTO(int post_num, String writer, String content) {
		super();
		this.post_num = post_num;
		this.writer = writer;
		this.content = content;
	}
	public int getComment_num() {
		return comment_num;
	}
	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}
	public int getPost_num() {
		return post_num;
	}
	public void setPost_num(int post_num) {
		this.post_num = post_num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getComment_time() {
		return comment_time;
	}
	public void setComment_time(String comment_time) {
		this.comment_time = comment_time;
	}
	
	
}
