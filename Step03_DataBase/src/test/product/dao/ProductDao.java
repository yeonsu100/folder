package test.product.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.product.dto.ProductDto;
import test.todo.dto.ToDoDto;
import test.util.DbcpBean;

public class ProductDao {
	private static ProductDao dao;
	private ProductDao() {}
	public static ProductDao getInstance() {
		if(dao==null) {
			dao=new ProductDao();
		}
		return dao;
	}

	// 전체 상품 목록 출력
	public List<ProductDto> getList() {
		List<ProductDto> list=new ArrayList<>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn=new DbcpBean().getConn();
			String sql="SELECT * FROM product ORDER BY pdt ASC";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				ProductDto dto=new ProductDto();
				dto.setCode(rs.getInt("code"));
				dto.setPdt(rs.getString("pdt"));
				dto.setRegdate(rs.getString("regdate"));
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e) {}
		}
		return list;
	}

	// 상품 추가 (INSERT)
	public boolean insert(ProductDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag=0;
		try {
			conn=new DbcpBean().getConn();
			String sql="INSERT INTO product (code, pdt, regdate)"
					+ " VALUES(?, ?, sysdate)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getCode());
			pstmt.setString(2, dto.getPdt());
			flag=pstmt.executeUpdate();	
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e) {}
		}
		if(flag>0) {
			return true;
		}else {
			return false;
			}
		}
	
	// 업데이트 (UPDATE)
	public boolean update(ProductDto dto) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		int flag=0;
		try {
			conn=new DbcpBean().getConn();
			String sql="UPDATE product SET pdt=? WHERE code=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPdt());
			pstmt.setInt(2, dto.getCode());
			flag=pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e) {}
		}
		if(flag>0) {
			return true;
		}else {
			return false;
		}
	}
	
	// 삭제 (DELETE)
	public boolean delete(int code) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		int flag=0;
		try {
			conn=new DbcpBean().getConn();
			String sql="DELETE FROM product WHERE code=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, code);
			flag=pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e) {}
		}
		if(flag>0) {
			return true;
		}else {
			return false;
		}
	}
	
	// 상품 한 줄 리턴 (GET DATA)
	public ProductDto getData(int code) {
		ProductDto dto=null;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn=new DbcpBean().getConn();
			String sql="SELECT pdt, regdate FROM product WHERE code=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, code);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dto=new ProductDto();
				dto.setCode(code);
				dto.setPdt(rs.getString("pdt"));
				dto.setRegdate(rs.getString("regdate"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e) {}
		}
		return dto;
		}
	
}
	
	
	
	


