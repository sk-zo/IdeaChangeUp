package Model;

import java.util.ArrayList;

public class CompeteDTO {
	private int num;
	private String writer;
	private String title;
	private int price;
	private int category;
	private String deadline;
	private String post_time;
	
	public CompeteDTO() {}
	
	
	
	public CompeteDTO(String writer, String title, int price, int category, String deadline) {
		super();
		this.writer = writer;
		this.title = title;
		this.price = price;
		this.category = category;
		this.deadline = deadline;
	}



	public CompeteDTO(int num, String writer, String title, int price, int category, String deadline,
			String post_time) {
		super();
		this.num = num;
		this.writer = writer;
		this.title = title;
		this.price = price;
		this.category = category;
		this.deadline = deadline;
		this.post_time = post_time;
	}
	
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public String getDeadline() {
		return deadline;
	}
	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}
	public String getPost_time() {
		return post_time;
	}
	public void setPost_time(String post_time) {
		this.post_time = post_time;
	} 
	
	
	
}
