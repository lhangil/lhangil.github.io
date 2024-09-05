package VO;

public class emailVO {

	private int no;
	
	private String sender;
	private String receiver;
	private String title;
	
	private String content;
	
	private String regDate;
	
	public emailVO() {
	}
    
	public emailVO(int no, String title, String regDate) {
		super();
		this.no = no;
		this.title = title;
		
		this.regDate = regDate;
	}

	public emailVO(int no, String sender, String receiver, String title, String content, String regDate) {
		super();
		this.no = no;
		
		this.sender = sender;
		this.receiver = receiver;
		this.title = title;
		
		this.content = content;
	
		this.regDate = regDate;
	}

	

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}


	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "emailVO [no=" + no + ", sender=" + sender + ", receiver=" + receiver + ", title=" + title + 
				 ", content=" + content + ", regDate=" + regDate + "]";
	}

	
	
}
