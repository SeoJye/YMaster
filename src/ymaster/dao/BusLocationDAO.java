package ymaster.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ymaster.common.JDBCUtil;
import ymaster.vo.BusLocationVO;

public class BusLocationDAO {
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	
	public List<BusLocationVO> getBusLocationList() throws SQLException {
		List<BusLocationVO> bl = new ArrayList<BusLocationVO>();
		String sql = "select * from busLocation where location != 0";
		
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				BusLocationVO vo = new BusLocationVO();
				vo.setNumberPlate(rs.getString("numberPlate"));
				vo.setLocation(rs.getInt("location"));
				bl.add(vo);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, stmt, rs);
		}
		return bl;
	}
	
	public void insertBusLocation(BusLocationVO vo) throws SQLException {
		String sql = "insert into busLocation(numberPlate, location) values(?, ?)";
		
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1,  vo.getNumberPlate());
			stmt.setInt(2, vo.getLocation());
			stmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, stmt);
		}
	}
	
	public void updateBusLocation(BusLocationVO vo) throws SQLException {
		String sql = "update busLocation set location = ? where numberPlate = ?";
		
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1,  vo.getLocation());
			stmt.setString(2, vo.getNumberPlate());
			stmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, stmt);
		}
	}
}
