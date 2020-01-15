package test.cafe.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.cafe.dto.CafeDto;
import test.util.DbcpBean;

public class CafeDao {
	private static CafeDao dao;
	private CafeDao() {}
	public static CafeDao getInstance() {
		if(dao==null) {
			dao=new CafeDao();
		}
		return dao;
	}
	
	// 글 전체의 갯수를 리턴하는 메소드
		public int getCount() {
			int rowCount=0;
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				conn = new DbcpBean().getConn();
				String sql = "SELECT MAX(ROWNUM) AS count"		// 로우넘 중 가장 큰 수 (=글의 전체 갯수)
						+ " FROM board_cafe";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					rowCount=rs.getInt("count");
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (rs != null)
						rs.close();
					if (pstmt != null)
						pstmt.close();
					//connection pool 에 반납하기 
					if (conn != null)
						conn.close();
				} catch (Exception e) {}
			}
			return rowCount;
		}
	
	// 새 글을 저장하는 메소드 (INSERT)
		public boolean insert(CafeDto dto) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			int flag = 0;
			try {
				conn = new DbcpBean().getConn();
				String sql = "INSERT INTO board_cafe"
					+ " (num, writer, title, content, viewCount, regdate)"
					+ " VALUES(board_cafe_seq.NEXTVAL, ?, ?, ?, 0, SYSDATE)";	// 조회수 디폴트값 0 (초기값)
			pstmt = conn.prepareStatement(sql);
			// ? 에 값 바인딩 하기
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			flag = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)pstmt.close();
				if (conn != null)conn.close();
			} catch (Exception e) {}
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	// 글 목록을 리턴하는 메소드 (list.jsp)
	// 일괄 import 하는 방법 : ctrl + shift + o (auto import)
		public List<CafeDto> getList(CafeDto dto){
			List<CafeDto> list=new ArrayList<CafeDto>();
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
			conn = new DbcpBean().getConn();
					/*
					 * SELECT *
						FROM 
						(SELECT result1.*, ROWNUM AS rnum
							FROM
							(SELECT num, writer, title, viewCount, regdate
							FROM board_cafe
							ORDER BY num DESC) result1)
						WHERE rnum BETWEEN ? AND ?
						(한줄씩 복붙해야 한다)
					 */
			String sql="SELECT *"
					+ " FROM"
					+ " (SELECT result1.*, ROWNUM AS rnum"
					+ " FROM"
					+ " (SELECT num, writer, title, viewCount, regdate"
					+ " FROM board_cafe"
					+ " ORDER BY num DESC) result1)"
					+ " WHERE rnum BETWEEN ? AND ?";
			pstmt = conn.prepareStatement(sql);
			// ?에 값 바인딩
			pstmt.setInt(1, dto.getStartRowNum());
			pstmt.setInt(2, dto.getEndRowNum());
			rs = pstmt.executeQuery();
			while (rs.next()) {		// 반복문 돌면서
				// select된 row의 정보를 CafeDto 객체에 담아서 
				// (위에 dto와 변수명이 같으므로 일단 tmp로 변수명을 바꾸어 충돌을 막아준다.)
				CafeDto tmp=new CafeDto();
				tmp.setNum(rs.getInt("num"));
				tmp.setWriter(rs.getString("writer"));
				tmp.setTitle(rs.getString("title"));
				tmp.setViewCount(rs.getInt("viewCount"));
				tmp.setRegdate(rs.getString("regdate"));
				// ArrayList객체에 누적시킨다
				list.add(tmp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				//connection pool 에 반납하기 
				if (conn != null)
					conn.close();
			} catch (Exception e) {}
		}
		return list;
	}
	
	// 글 하나의 정보를 리턴하는 메소드
	public CafeDto getData(int num) {
		CafeDto dto=null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			String sql = "SELECT writer, title, content, viewCount, regdate"
					+ " FROM board_cafe"
					+ " WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			// ? 에 값 바인딩 
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				dto=new CafeDto();
				dto.setNum(num);
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setViewCount(rs.getInt("viewCount"));
				dto.setRegdate(rs.getString("regdate"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)rs.close();
				if (pstmt != null)pstmt.close();
				//connection pool 에 반납하기 
				if (conn != null)
					conn.close();
			} catch (Exception e) {}
		}
		return dto;
	}
	
	// 글 조회수 1씩 증가시키는 메소드
	public boolean addViewCount(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "UPDATE board_cafe"
					+ " SET viewCount=viewCount+1"
					+ " WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			// ? 에 값 바인딩 하기
			pstmt.setInt(1, num);
			flag = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)pstmt.close();
				if (conn != null)conn.close();
			} catch (Exception e) {}
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	// 글 정보를 수정하는 메소드
	public boolean update(CafeDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "UPDATE board_cafe"
					+ " SET title=?, content=?"
					+ " WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			// ? 에 값 바인딩 하기
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, dto.getNum());
			flag = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)pstmt.close();
				if (conn != null)conn.close();
			} catch (Exception e) {}
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	
}
