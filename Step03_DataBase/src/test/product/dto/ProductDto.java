package test.product.dto;

public class ProductDto {
	private int code;
	private String pdt;
	private String regdate;
	
	public ProductDto() {}

	public ProductDto(int code, String pdt, String regdate) {
		super();
		this.code = code;
		this.pdt = pdt;
		this.regdate = regdate;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getPdt() {
		return pdt;
	}

	public void setPdt(String pdt) {
		this.pdt = pdt;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
}
