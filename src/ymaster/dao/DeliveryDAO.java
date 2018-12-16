package ymaster.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ymaster.common.JDBCUtil;
import ymaster.vo.DeliveryVO;

public class DeliveryDAO {
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	
	public DeliveryVO getDelivery(String seq) throws SQLException {
		String sql = "select * from delivery where seq = ?";
		
		DeliveryVO vo = new DeliveryVO();
		
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, seq);
			rs = stmt.executeQuery();
			
			if(rs.next()) {
				vo.setCall(rs.getString("call"));
				vo.setContent(rs.getString("content"));
				vo.setLocate(rs.getString("locate"));
				vo.setName(rs.getString("name"));
				vo.setPrice(rs.getString("price"));
				vo.setRate(rs.getInt("rate"));
				vo.setRegdate(rs.getString("regdate"));
				vo.setSeq(rs.getString("seq"));
				vo.setKind(rs.getString("kind"));
				vo.setWriter(rs.getString("writer"));
				vo.setDeliveryPay(rs.getInt("deliveryPay"));
				vo.setDeliveryTime(rs.getString("deliveryTime"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, stmt, rs);
		}
		return vo;
	}
	
	public List<DeliveryVO> getDeliveryList() throws SQLException {
		List<DeliveryVO> dl = new ArrayList<DeliveryVO>();
		String sql = "select * from delivery order by seq asc";
		
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				DeliveryVO vo = new DeliveryVO();
				vo.setCall(rs.getString("call"));
				vo.setContent(rs.getString("content"));
				vo.setLocate(rs.getString("locate"));
				vo.setName(rs.getString("name"));
				vo.setPrice(rs.getString("price"));
				vo.setRate(rs.getInt("rate"));
				vo.setRegdate(rs.getString("regdate"));
				vo.setSeq(rs.getString("seq"));
				vo.setKind(rs.getString("kind"));
				vo.setWriter(rs.getString("writer"));
				vo.setDeliveryPay(rs.getInt("deliveryPay"));
				vo.setDeliveryTime(rs.getString("deliveryTime"));
				dl.add(vo);
			} 
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, stmt, rs);
		}
		return dl;
	}
	
	public List<DeliveryVO> getDeliveryListSearchKind(String kind) throws SQLException {
		List<DeliveryVO> dl = new ArrayList<DeliveryVO>();
		String sql = "select * from delivery where kind = ? order by seq asc";
		
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, kind);
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				DeliveryVO vo = new DeliveryVO();
				vo.setCall(rs.getString("call"));
				vo.setContent(rs.getString("content"));
				vo.setLocate(rs.getString("locate"));
				vo.setName(rs.getString("name"));
				vo.setPrice(rs.getString("price"));
				vo.setRate(rs.getInt("rate"));
				vo.setRegdate(rs.getString("regdate"));
				vo.setSeq(rs.getString("seq"));
				vo.setKind(rs.getString("kind"));
				vo.setWriter(rs.getString("writer"));
				vo.setDeliveryPay(rs.getInt("deliveryPay"));
				vo.setDeliveryTime(rs.getString("deliveryTime"));
				dl.add(vo);
			} 
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, stmt, rs);
		}
		return dl;
	}
	
	public String getNext() {
		String sql = "select seq from delivery order by seq desc";
		
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			if(rs.next()) {
				int rnum = Integer.parseInt(rs.getString(1).substring(1,6));
				String result = "D00000";
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
			return "D00001"; // 첫 번째 게시글인 경우
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, stmt);
		}
		return "D00000"; // 데이터베이스 오류
	}
	
	public void insertDelivery(DeliveryVO vo) throws SQLException {
		String sql = "insert into delivery(seq, writer, kind, locate, name, content, call, price, rate, deliveryPay, deliveryTime) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		vo.setSeq(getNext());
		
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);

			stmt.setString(1, vo.getSeq());
			stmt.setString(2, vo.getWriter());
			stmt.setString(3, vo.getKind());
			stmt.setString(4, vo.getLocate());
			stmt.setString(5, vo.getName());
			stmt.setString(6, vo.getContent());
			stmt.setString(7, vo.getCall());
			stmt.setString(8, vo.getPrice());
			stmt.setInt(9, vo.getRate());
			stmt.setInt(10, vo.getDeliveryPay());
			stmt.setString(11, vo.getDeliveryTime());

			stmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, stmt);
		}
	}
	
	public void updateDelivery(DeliveryVO vo) {
		String sql = "update delivery set kind = ?, locate = ?, name = ?, content = ?, call = ?, price = ?, rate = ?, deliveryPay = ?, deliveryTime = ? where seq = ?";
		
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, vo.getKind());
			stmt.setString(2, vo.getLocate());
			stmt.setString(3, vo.getName());
			stmt.setString(4, vo.getContent());
			stmt.setString(5, vo.getCall());
			stmt.setString(6, vo.getPrice());
			stmt.setInt(7, vo.getRate());
			stmt.setInt(8, vo.getDeliveryPay());
			stmt.setString(9, vo.getDeliveryTime());
			stmt.setString(10, vo.getSeq());
			stmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, stmt);
		}
	}
	
	public void deleteDelivery(String seq) {
		String sql = "delete from delivery where seq = ?";
		
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
