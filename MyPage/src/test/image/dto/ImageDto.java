package test.image.dto;

public class ImageDto {
	private int num;
	private String subject;
	private String savefilename;
	public ImageDto() {}
	public ImageDto(int num, String subject, String savefilename) {
		super();
		this.num = num;
		this.subject = subject;
		this.savefilename = savefilename;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getSavefilename() {
		return savefilename;
	}
	public void setSavefilename(String savefilename) {
		this.savefilename = savefilename;
	}
	
}
