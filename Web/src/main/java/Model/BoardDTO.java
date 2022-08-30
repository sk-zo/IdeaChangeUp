package Model;
import java.util.ArrayList;

public class BoardDTO {
	
	private int page;
	private int category;
	private int sort;
	private ArrayList<PostDTO> posts;
	private ArrayList<LikeDTO> likes;
	

	public BoardDTO(int page, int category, int sort, ArrayList<PostDTO> posts) {
		this.page = page;
		this.category = category;
		this.sort = sort;
		this.posts = posts;
	}
	
	public BoardDTO() {
		this.page = 1;
		this.category = -1;
		this.sort = 0;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public int getSort() {
		return sort;
	}
	public void setSort(int sort) {
		this.sort = sort;
	}
	public ArrayList<PostDTO> getPosts() {
		return posts;
	}
	public void setPosts(ArrayList<PostDTO> posts) {
		this.posts = posts;
	}

	public ArrayList<LikeDTO> getLikes() {
		return likes;
	}

	public void setLikes(ArrayList<LikeDTO> likes) {
		this.likes = likes;
	}
	
	
	
}