package ymaster.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ymaster.common.JDBCUtil;
import ymaster.vo.CommentsVO;

public class CommentsDAO {
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	
	public CommentsVO getComment(String comSeq) throws SQLException {
		String sql = "select * from comments where comSeq = ?";
		
		CommentsVO vo = new CommentsVO();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, comSeq);
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				vo.setComSeq(rs.getString("comSeq"));
				vo.setBorSeq(rs.getString("borSeq"));
				vo.setWriter(rs.getString("writer"));
				vo.setRegdate(rs.getString("regdate"));
				vo.setContent(rs.getString("content"));
			} 
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, stmt, rs);
		}
		return vo;
	}
	
	public List<CommentsVO> getCommentList(String borSeq) throws SQLException {
		List<CommentsVO> cl = new ArrayList<CommentsVO>();
		String sql = "select * from comments where borSeq = ? order by comSeq asc";
		
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, borSeq);
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				CommentsVO vo = new CommentsVO();
				vo.setComSeq(rs.getString("comSeq"));
				vo.setBorSeq(rs.getString("borSeq"));
				vo.setWriter(rs.getString("writer"));
				vo.setRegdate(rs.getString("regdate"));
				vo.setContent(rs.getString("content"));
				cl.add(vo);
			} 
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, stmt, rs);
		}
		return cl;
	}
	
	public String getNext() {
		String sql = "select comSeq from comments order by comSeq desc";
		
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			if(rs.next()) {
				int rnum = Integer.parseInt(rs.getString(1).substring(1,6));
				String result = "C00000";
				if((rnum + 1) < 10) 
					result = rs.getString(1).substring(0,1) + "0000" + (Integer.parseInt(rs.getString(1).substring(1,6)) + 1);
				else if((rnum + 1) < 100)
					result = rs.getString(1).substring(0,1) + "000" + (Integer.parseInt(rs.getString(1).substring(1,6)) + 1);
				else if((rnum + 1) < 1000)
					result = rs.getString(1).substring(0,1) + "00" + (Integer.parseInt(rs.getString(1).substring(1,6)) + 1);
				else if((rnum + 1) < 10000)
					result = rs.getString(1).substring(0,1) + "0" + (Integer.parseInt(rs.getString(1).substring(1,6)) + 1);
				else if((rnum + 1) < 100000)
					result = rs.getString(1).substring(0,1) + (Integer.parseInt(rs.getString(1).substring(1,6)) + 1);
				
				return result;
			}
			return "C00001"; // 첫 번째 게시글인 경우
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, stmt);
		}
		return "C00000"; // 데이터베이스 오류
	}
	
	public void insertComment(CommentsVO vo) throws SQLException {
		String sql = "insert into Comments(comSeq, borSeq, writer, content) values(?, ?, ?, ?)";
		
		vo.setComSeq(getNext());
		
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, vo.getComSeq());
			stmt.setString(2, vo.getBorSeq());
			stmt.setString(3, vo.getWriter());
			stmt.setString(4, vo.getContent());
			stmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, stmt);
		}
	}
	
	public void deleteComment(String comSeq) throws SQLException {
		String sql = "delete from comments where comSeq = ?";

		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, comSeq);

			stmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, stmt);
		}
	}
	
	public void deleteResComment(String borSeq) throws SQLException {
		String sql = "delete from comments where borSeq = ?";

		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, borSeq);

			stmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, stmt);
		}
	}
}
