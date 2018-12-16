package ymaster.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ymaster.common.JDBCUtil;
import ymaster.vo.BusScheduleVO;

public class BusScheduleDAO {
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	
	public List<BusScheduleVO> getBusScheduleList(String side, String week, String destination) throws SQLException {
		List<BusScheduleVO> bs = new ArrayList<BusScheduleVO>();
		String sql = "select * from busSchedule where side = ? and week = ? and destination = ? order by destination asc, time asc";

		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1,  side);
			stmt.setString(2,  week);
			stmt.setString(3,  destination);
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				BusScheduleVO vo = new BusScheduleVO();
				vo.setSide(rs.getString("side"));
				vo.setWeek(rs.getString("week"));
				vo.setDestination(rs.getString("destination"));
				vo.setContent(rs.getString("content"));
				vo.setTime(rs.getString("time"));
				bs.add(vo);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, stmt, rs);
		}
		return bs;
	}
	
	public void insertBusSchedule(BusScheduleVO vo) throws SQLException {
		String sql = "insert into busSchedule(side, week, destination, content, time) values(?, ?, ?, ?, ?)";
		
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1,  vo.getSide());
			stmt.setString(2, vo.getWeek());
			stmt.setString(3, vo.getDestination());
			stmt.setString(4, vo.getContent());
			stmt.setString(5, vo.getTime());
			stmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, stmt);
		}
	}
	
	public void updateBusSchedule(BusScheduleVO vo, BusScheduleVO voOld) throws SQLException {
		String sql = "update busSchedule set side = ?, week = ?, destination = ?, content = ?, time = ? where side = ? and week = ? and destination = ? and content = ? and time = ?";
		
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1,  vo.getSide());
			stmt.setString(2, vo.getWeek());
			stmt.setString(3, vo.getDestination());
			stmt.setString(4, vo.getContent());
			stmt.setString(5, vo.getTime());
			stmt.setString(6,  voOld.getSide());
			stmt.setString(7, voOld.getWeek());
			stmt.setString(8, voOld.getDestination());
			stmt.setString(9, voOld.getContent());
			stmt.setString(10, voOld.getTime());
			stmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, stmt);
		}
	}

	public void deleteBusSchedule(BusScheduleVO vo) throws SQLException {
		String sql = "delete from busSchedule where side = ? and week = ? and destination = ? and content = ? and time = ?";
		
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1,  vo.getSide());
			stmt.setString(2, vo.getWeek());
			stmt.setString(3, vo.getDestination());
			stmt.setString(4, vo.getContent());
			stmt.setString(5, vo.getTime());
			stmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, stmt);
		}
	}
}
