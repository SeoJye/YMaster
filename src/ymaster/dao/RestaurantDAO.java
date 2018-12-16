package ymaster.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ymaster.common.JDBCUtil;
import ymaster.vo.RestaurantVO;

public class RestaurantDAO {
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	
	public RestaurantVO getRestaurant(String seq) throws SQLException {
		String sql = "select * from restaurant where seq = ?";
		
		RestaurantVO vo = new RestaurantVO();
		
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, seq);
			rs = stmt.executeQuery();
			
			if(rs.next()) {
				vo.setAddress(rs.getString("address"));
				vo.setContent(rs.getString("content"));
				vo.setLocate(rs.getString("locate"));
				vo.setName(rs.getString("name"));
				vo.setPrice(rs.getString("price"));
				vo.setRate(rs.getInt("rate"));
				vo.setRegdate(rs.getString("regdate"));
				vo.setSeq(rs.getString("seq"));
				vo.setType(rs.getString("type"));
				vo.setWriter(rs.getString("writer"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, stmt, rs);
		}
		return vo;
	}
	
	public List<RestaurantVO> getRestaurantList() throws SQLException {
		List<RestaurantVO> rl = new ArrayList<RestaurantVO>();
		String sql = "select * from restaurant order by seq asc";
		
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				RestaurantVO vo = new RestaurantVO();
				vo.setAddress(rs.getString("address"));
				vo.setContent(rs.getString("content"));
				vo.setLocate(rs.getString("locate"));
				vo.setName(rs.getString("name"));
				vo.setPrice(rs.getString("price"));
				vo.setRate(rs.getInt("rate"));
				vo.setRegdate(rs.getString("regdate"));
				vo.setSeq(rs.getString("seq"));
				vo.setType(rs.getString("type"));
				vo.setWriter(rs.getString("writer"));
				rl.add(vo);
			} 
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, stmt, rs);
		}
		return rl;
	}
	
	public List<RestaurantVO> getRestaurantListSearchLocate(String location) throws SQLException {
		List<RestaurantVO> rl = new ArrayList<RestaurantVO>();
		String sql = "select * from restaurant where locate = ? order by seq asc";
		
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, location);
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				RestaurantVO vo = new RestaurantVO();
				vo.setAddress(rs.getString("address"));
				vo.setContent(rs.getString("content"));
				vo.setLocate(rs.getString("locate"));
				vo.setName(rs.getString("name"));
				vo.setPrice(rs.getString("price"));
				vo.setRate(rs.getInt("rate"));
				vo.setRegdate(rs.getString("regdate"));
				vo.setSeq(rs.getString("seq"));
				vo.setType(rs.getString("type"));
				vo.setWriter(rs.getString("writer"));
				rl.add(vo);
			} 
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, stmt, rs);
		}
		return rl;
	}
	
	public List<RestaurantVO> getRestaurantListSearchType(String type) throws SQLException {
		List<RestaurantVO> rl = new ArrayList<RestaurantVO>();
		String sql = "select * from restaurant where type = ? order by seq asc";
		
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, type);
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				RestaurantVO vo = new RestaurantVO();
				vo.setAddress(rs.getString("address"));
				vo.setContent(rs.getString("content"));
				vo.setLocate(rs.getString("locate"));
				vo.setName(rs.getString("name"));
				vo.setPrice(rs.getString("price"));
				vo.setRate(rs.getInt("rate"));
				vo.setRegdate(rs.getString("regdate"));
				vo.setSeq(rs.getString("seq"));
				vo.setType(rs.getString("type"));
				vo.setWriter(rs.getString("writer"));
				rl.add(vo);
			} 
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, stmt, rs);
		}
		return rl;
	}
	
	public List<RestaurantVO> getRestaurantListSearch2(String location, String type) throws SQLException {
		List<RestaurantVO> rl = new ArrayList<RestaurantVO>();
		String sql = "select * from restaurant where locate = ? and type = ? order by seq asc";
		
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, location);
			stmt.setString(2, type);
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				RestaurantVO vo = new RestaurantVO();
				vo.setAddress(rs.getString("address"));
				vo.setContent(rs.getString("content"));
				vo.setLocate(rs.getString("locate"));
				vo.setName(rs.getString("name"));
				vo.setPrice(rs.getString("price"));
				vo.setRate(rs.getInt("rate"));
				vo.setRegdate(rs.getString("regdate"));
				vo.setSeq(rs.getString("seq"));
				vo.setType(rs.getString("type"));
				vo.setWriter(rs.getString("writer"));
				rl.add(vo);
			} 
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, stmt, rs);
		}
		return rl;
	}

	public String getNext() {
		String sql = "select seq from restaurant order by seq desc";
		
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			if(rs.next()) {
				int rnum = Integer.parseInt(rs.getString(1).substring(1,6));
				String result = "R00000";
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
			return "R00001"; // 첫 번째 게시글인 경우
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, stmt);
		}
		return "R00000"; // 데이터베이스 오류
	}
	
	public void insertRestaurant(RestaurantVO vo) throws SQLException {
		String sql = "insert into restaurant(seq, writer, type, locate, name, content, address, price, rate) values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		vo.setSeq(getNext());
		
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);

			stmt.setString(1, vo.getSeq());
			stmt.setString(2, vo.getWriter());
			stmt.setString(3, vo.getType());
			stmt.setString(4, vo.getLocate());
			stmt.setString(5, vo.getName());
			stmt.setString(6, vo.getContent());
			stmt.setString(7, vo.getAddress());
			stmt.setString(8, vo.getPrice());
			stmt.setInt(9, vo.getRate());

			stmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, stmt);
		}
	}
	
	public void updateRestaurant(RestaurantVO vo) {
		String sql = "update restaurant set type = ?, locate = ?, name = ?, content = ?, address = ?, price = ?, rate = ? where seq = ?";
		
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, vo.getType());
			stmt.setString(2, vo.getLocate());
			stmt.setString(3, vo.getName());
			stmt.setString(4, vo.getContent());
			stmt.setString(5, vo.getAddress());
			stmt.setString(6, vo.getPrice());
			stmt.setInt(7, vo.getRate());
			stmt.setString(8, vo.getSeq());
			stmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, stmt);
		}
	}
	
	public void deleteRestaurant(String seq) {
		String sql = "delete from restaurant where seq = ?";
		
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, seq);
			stmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, stmt);
		}
	}
}
