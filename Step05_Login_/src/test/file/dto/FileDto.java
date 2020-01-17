package test.file.dto;

public class FileDto {
	// 필드
	private int num;
	private String writer;
	private String title;
	private String orgFileName;
	private String saveFileName;
	private long fileSize;			// 파일은 바이트로 기록하기 때문에 숫자의 길이(크기)가 크므로 데이터 타입을 int 대신 long을 쓴다.
	private int downCount;
	private String regdate;
	
	// 디폴트 생성자
	public FileDto() {}
}
