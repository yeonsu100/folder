package test.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import test.member.dto.MemberDto;
import test.util.DbcpBean;

public class MemberDao {
	// 1. 자신의 참조값을 담을 static 필드
	private static MemberDao dao;
	// 2. 외부에서 객체 생성할 수 없도록 생성자의 접근 지정자를 private로
	private MemberDao() {}
	// 3. 자신의 참조값을 리턴해주는 공개 (public) 메소드 정의
	public static MemberDao getInstance() {
		// 최초 호출될 때는 dao필드는 null이다
		if(dao==null) {
			dao=new MemberDao(); 	// 객체 생성해서 static 참조값을 필드에 저장
		}
		return dao;		// static 필드에 있는 참조값 리턴해주기
	}
	
	// 회원 전체 목록을 리턴하는 메소드
	public List<MemberDto> getList(){
		// 회원 목록을 담을 객체 생성
		List<MemberDto> list=new ArrayList<>();
		// 필요한 객체를 담을 지역변수 만들기
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			// Connection 객체 (connection pool로부터) 하나 가지고 오기
			conn=new DbcpBean().getConn();
			String sql="SELECT num, name, addr FROM member"
					+ " ORDER BY num ASC";
			pstmt=conn.prepareStatement(sql);
			// sql문 수행하고 결과셋 받아오기
			rs=pstmt.executeQuery();
			while(rs.next()) {
//				int num=rs.getInt("num");
//				String name=rs.getString("name");
//				String addr=rs.getString("addr");
				// 회원 한명의 정보를 MemberDto 객체에 담는다.
				//MemberDto dto=new MemberDto(num, name, addr);
				MemberDto dto=new MemberDto();
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
				// MemberDto 객체의 참조값을 ArrayList 에 저장
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				// connection pool에 반납하기
				// .close() 메소드를 호출하면 자동 반납된다.
				if(conn!=null)conn.close();		
			}catch(Exception e) {}
		}
		return list;
	}
	
	// 회원 한 명의 정보 추가
	public boolean insert(MemberDto dto) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		int flag=0;
		try {
			conn=new DbcpBean().getConn();			// DbcpBean을 통해서 컨넥션을 얻어와서
			String sql="INSERT INTO member (num,name,addr)"
					+ " VALUES(MEMBER_SEQ.NEXTVAL, ?, ?)";
			pstmt=conn.prepareStatement(sql);
			// ?에 값 바인딩하기
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getAddr());
			flag=pstmt.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
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
	
	// 회원 한 명의 정보 수정
	public boolean update(MemberDto dto) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		int flag=0;
		try {
			// Connection Pool 에서 Connection 객체 가지고 오고 
			conn=new DbcpBean().getConn();
			String sql="UPDATE member SET name=?,addr=?"
					+ " WHERE num=?";
			pstmt=conn.prepareStatement(sql);
			// ?에 값 바인딩하기
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getAddr());
			pstmt.setInt(3, dto.getNum());
			flag=pstmt.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				// conn.close() 하면 Connection 이 자동 반납된다.
				if(conn!=null)conn.close();
			}catch(Exception e) {}
		}
		if(flag>0) {
			return true;
		}else {
			return false;
		}
	}
	
	// 회원 한 명의 정보 삭제
	public boolean delete(int num) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		int flag=0;
		try {
			conn=new DbcpBean().getConn();
			String sql="DELETE FROM member WHERE num=?";
			pstmt=conn.prepareStatement(sql);
			// ?에 값 바인딩하기
			pstmt.setInt(1, num);
			flag=pstmt.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
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
	// 회원 한 명의 정보 리턴
	public MemberDto getData(int num) {
		// 리턴해줄 data 선언
		MemberDto dto=null;
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;			// 결과를 저장할 result set 추가하기
		
		try {
			conn=new DbcpBean().getConn();
			String sql="SELECT * FROM member WHERE num=?";
			pstmt=conn.prepareStatement(sql);
			// ?에 값 바인딩하기
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				// MemberDto 객체를 생성하여 
				dto=new MemberDto();
				// 회원 정보를 담는다.
				dto.setNum(num);
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
			}
		}catch(SQLException se) {
			se.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				//connection pool 에 반납하기
				if(conn!=null)conn.close();
			}catch(Exception e) {}
		}
		// MemberDto 객체 리턴해주기
		return dto;
		}
}	
