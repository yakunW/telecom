package cn.edu.bupt.anm.po;

public class News {
	private int id;//id主键，自增，无需手动添加
	private String title;//新闻标题
	private String context;//新闻正文
	private String date;//上传日期

	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getTitle() {
		return title;
	}

	public void setContext(String context) {
		this.context = context;
	}

	public String getContext() {
		return context;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getDate() {
		return date;
	}
	

}
