package test.image.dto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ImageDao {
	private static ImageDao dao;
	private ImageDao() {}
	private Connection conn=null;
	public static ImageDao getInstance() {
		if(dao==null) {
			dao=new ImageDao();
		}
		return dao;
	}

	// Record number
	public int getMaxNum() {
		int maxNum=0;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql;
		try {
			sql="SELECT nvl(max(num),0) FROM imagetest";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				maxNum=rs.getInt(1);
			}
			rs.close();
			pstmt.close();
		}catch(Exception e) {
			System.out.println(e.toString());
		}
		return maxNum;
	}
		
	// Insert a file data
	public void insertData(ImageDto dto) {
		PreparedStatement pstmt=null;
		String sql;
		try {
			sql="INSERT INTO imagetest"
				+ " num, subject, savefilename"
				+ " VALUES(?, ?, ?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getNum());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getSavefilename());
			pstmt.executeUpdate();
			pstmt.close();
		}catch(Exception e) {
			System.out.println(e.toString());
		}
	}
	
	// Show list of photos
	public List<ImageDto> getList(int start, int end){
		List<ImageDto> lists=new ArrayList<ImageDto>();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql;
		try {
			sql="SELECT * FROM imagetest (select rownum rnum, num, subject, savefilename";
			sql="FROM imagetest ORDER BY num DESC)";
			sql="WHERE rnum >= ? AND rnum <= ?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				ImageDto dto=new ImageDto();
				dto.setNum(rs.getInt("num"));
				dto.setSubject(rs.getString("subject"));
				dto.setSavefilename(rs.getString("savefilename"));
				lists.add(dto);
			}
			rs.close();
			pstmt.close();
		}catch(Exception e) {
			System.out.println(e.toString());
		}
		return lists;
	}
	
	// Show a particle data	
	public ImageDto getReadData(int num) {
		ImageDto dto=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql;
		try {
			sql="SELECT num, subject, savefilename FROM imagetest WHERE num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dto=new ImageDto();
				dto.setNum(rs.getInt("num"));
				dto.setSubject(rs.getString("subject"));
				dto.setSavefilename(rs.getString("savefilename"));
			}
			rs.close();
			pstmt.close();
		}catch(Exception e) {
		System.out.println(e.toString());
		}
		return dto;
	}
	
	// Delete a file data
	public void deleteData(int num) {
		PreparedStatement pstmt=null;
		String sql;
		try {
			sql="DELETE imagetest WHERE num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			pstmt.close();
		}catch(Exception e) {
		System.out.println(e.toString());
		}
	}
		
	// Count a file data
	public int getDataCount() {
		int totalDataCount=0;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql;
		try {
			sql="SELECT nvl(count(*),0) FROM imagetest";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				totalDataCount=rs.getInt(1);
				rs.close();
				pstmt.close();
			}
		}catch(Exception e) {
		System.out.println(e.toString());
		}
		return totalDataCount;
	}
		
}
