package Model;

import java.util.ArrayList;

public class PostDTO {
	private int num;
	private String writer;
	private String title;
	private String abs;
	private String content;
	private int category;
	private String tags;
	private ArrayList<PatentDTO> patents;
	private int views;
	private String post_time; 
	private boolean checked;
	private int likes;
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAbs() {
		return abs;
	}
	public void setAbs(String abs) {
		this.abs = abs;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public String getTag() {
		return tags;
	}
	public void setTag(String tags) {
		this.tags = tags;
	}
	public int getView() {
		return views;
	}
	public void setView(int views) {
		this.views = views;
	}
	public String getPost_time() {
		return post_time;
	}
	public void setPost_time(String post_time) {
		this.post_time = post_time;
	}
	public ArrayList<PatentDTO> getPatents() {
		return patents;
	}
	public void setPatents(ArrayList<PatentDTO> patents) {
		this.patents = patents;
	}
	public boolean isChecked() {
		return checked;
	}
	public void setChecked(boolean checked) {
		this.checked = checked;
	}
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
	
	public PostDTO(String title, String abs, String content, int category, String tags) {
		super();
		this.title = title;
		this.abs = abs;
		this.content = content;
		this.category = category;
		this.tags = tags;
	}
	
	public PostDTO(String title, String abs, String content, int category, String tags, int views) {
		super();
		this.title = title;
		this.abs = abs;
		this.content = content;
		this.category = category;
		this.tags = tags;
		this.views = views;
	}
	public PostDTO() {
		// TODO Auto-generated constructor stub
	}
	public PostDTO(String writer, String title, String abs, String content, int category) {
		super();
		this.writer = writer;
		this.title = title;
		this.abs = abs;
		this.content = content;
		this.category = category;
	}
	
	
	
	
	
}
