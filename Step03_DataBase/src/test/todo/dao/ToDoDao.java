package test.todo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import test.todo.dto.ToDoDto;
import test.util.DbcpBean;

/*
 * Application 전역에서 오직 한개의 객체만 생성되어서 사용되는 구조로 Dao 클래스 설계하기
 * 
 * 1. 외부에서 객체 생성할 수 없도록 생성자의 접근 지정자를 private로 지정
 * 2. 자신의 참조값을 담을 static 필드 선언
 * 3. 자신의 참조값을 리턴해주는 public static 메소드 제공
 */
public class ToDoDao {
	// 2. 자신의 참조값을 담을 static 필드 선언
	private static ToDoDao dao;
	// 1. 외부에서 객체 생성할 수 없도록 생성자의 접근 지정자를 private로 지정
	private ToDoDao() {}
	// 3. 자신의 참조값을 리턴해주는 public static 메소드 제공
	public static ToDoDao getInstance() {
		if(dao==null) {		// 최초 호출될 때에는 null이다.
			// null이면 객체를 생성해서 static 참조값을 필드에 저장한다.
			dao=new ToDoDao();
		}
		return dao;
	}
	
	// To Do List 전체 할 일 목록을 리턴하는 메소드
	public List<ToDoDto> getList(){
		List<ToDoDto> list=new ArrayList<>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn=new DbcpBean().getConn();
			String sql="SELECT * FROM todo ORDER BY num ASC";
			pstmt=conn.prepareStatement(sql);
			// 셀렉션 인자가 따로 없기 때문에 ?에 값을 바인딩 할 필요가 없다
			rs=pstmt.executeQuery();
			while(rs.next()) {
				ToDoDto dto=new ToDoDto();	// 반복문이 돌 때마다 new해야 하므로 while문 안에 dto 생성문을 위치시킨다.
				dto.setNum(rs.getInt("num"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				// connection pool에 반납하기
				if(conn!=null)conn.close();		
			}catch(Exception e) {}
		}
		return list;
	}
	
	// 할 일 목록(content) 한줄 추가 (INSERT)
	// - 할 일을 DB에 저장하기 (String으로 전달 - dto로 전달하는 것도 가능하나, 여기서는 한 줄만 저장하여 전달하므로 String을 쓴다)
	public boolean insert(String content) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		int flag=0;
		try {
			conn=new DbcpBean().getConn();
			String sql="INSERT INTO todo (num, content, regdate)"
					+ " VALUES(todo_seq.nextval, ?, sysdate)";
			pstmt=conn.prepareStatement(sql);
			// ?에 값 바인딩하기
			pstmt.setString(1, content);
			flag=pstmt.executeUpdate();		// 리턴되는 것 : execute했을 때, 위 sql문을 수행하고 영향을 받은 것이 리턴된다
		}catch(Exception se) {
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
	
	// 할 일 목록(content) 한줄 수정 (UPDATE)
	// (=인자로 전달되는 ToDoDto)
	public boolean update(ToDoDto dto) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		int flag=0;
		try {
			conn=new DbcpBean().getConn();
			String sql="UPDATE todo SET content=? WHERE num=?";
						// 날짜도 수정하고 싶으면 regdate=sysdate 추가하면 되지만 날짜 컬럼이 하나 더 필요하다
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getContent());
			pstmt.setInt(2, dto.getNum());
			flag=pstmt.executeUpdate();
		}catch(Exception se) {
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
	
	// 할 일 목록(content) 한줄 삭제 (DELETE)
	public boolean delete(int num) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		int flag=0;
		try {
			conn=new DbcpBean().getConn();
			String sql="DELETE FROM todo WHERE num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			flag=pstmt.executeUpdate();
		}catch(Exception se) {
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
		
	// 할 일 목록(content) 한줄 리턴
	// (=인자로 전달되는 번호에 해당하는 할 일을 리턴해주는 메소드)
	public ToDoDto getData(int num) {
		ToDoDto dto=null;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn=new DbcpBean().getConn();
			String sql="SELECT content, regdate FROM todo WHERE num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dto=new ToDoDto();
				dto.setNum(num);
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
			}
		}catch(Exception se) {
			se.printStackTrace();
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
	
	
	
	
