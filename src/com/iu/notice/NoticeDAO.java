package com.iu.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.iu.util.DBConnector;

public class NoticeDAO {
	//getTotalCount
	public int getToalCount() throws Exception {
		Connection con = DBConnector.getConnect();
		String sql =  "select nvl(count(num), 0) from notice";	//count가0이면 null이 나올수 가 있다
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		rs.next();
		int totalCount = rs.getInt(1);
		DBConnector.disConnect(rs, st, con);
		return totalCount;
	}
	
	//hitUpdate
	public int hitUpdate(int num) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "update notice set hit=hit+1 where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		int result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
	}
	
	//list
	public ArrayList<NoticeDTO> selectList(int startRow, int lastRow,String kind, String search) throws Exception {
		ArrayList<NoticeDTO> ar = new ArrayList<>();
		Connection con = DBConnector.getConnect();
		String sql =  "select * from\r\n" + 
				"(select rownum  R, N.*from\r\n" + 
				"(select * from notice where "+kind+" like ? order by num desc) N)\r\n" + //컬럼명이나 테이블명은 ?처리안됨	//?에는 문자열이여도''를 안했었다
				"where R between ? and ?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, "%"+search+"%");
		st.setInt(2, startRow);
		st.setInt(3, lastRow);
		ResultSet rs = st.executeQuery();
		while(rs.next()) {
			NoticeDTO noticeDTO = new NoticeDTO();
			noticeDTO.setNum(rs.getInt("num"));
			noticeDTO.setTitle(rs.getString("title"));
			noticeDTO.setWriter(rs.getString("writer"));
			noticeDTO.setContents(rs.getString("contents"));
			noticeDTO.setReg_date(rs.getDate("reg_date"));
			noticeDTO.setHit(rs.getInt("hit"));
			ar.add(noticeDTO);
		}
		DBConnector.disConnect(rs, st, con);
		return ar;
	}
	
	//selectOne
	public NoticeDTO selectOne(int num) throws Exception {
		Connection con = DBConnector.getConnect();
		NoticeDTO noticeDTO = null;	//최종결과가 없을 수도 있음으로
		String sql = "select * from notice where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		ResultSet rs = st.executeQuery();
		if(rs.next()) {
			noticeDTO = new NoticeDTO();
			noticeDTO.setNum(rs.getInt("num"));
			noticeDTO.setTitle(rs.getString("title"));
			noticeDTO.setWriter(rs.getString("writer"));
			noticeDTO.setContents(rs.getString("contents"));
			noticeDTO.setReg_date(rs.getDate("reg_date"));
			noticeDTO.setHit(rs.getInt("hit"));
		}
		DBConnector.disConnect(rs, st, con);
		return noticeDTO;
	}
	
	//insert
	public int insert(NoticeDTO noticeDTO) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql ="insert into notice values(board_seq.nextval,?,?,?,sysdate,0)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, noticeDTO.getTitle());
		st.setString(2, noticeDTO.getWriter());
		st.setString(3, noticeDTO.getContents());
		int result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
	}
	
	//delete
	public int delete(int num) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "delete notice where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		int result=st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
	}
	
	//update
	public int update(NoticeDTO noticeDTO) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "update notice set title=?,contents=? where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, noticeDTO.getTitle());
		st.setString(2, noticeDTO.getContents());
		st.setInt(3, noticeDTO.getNum());
		int result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
	}
/*	
	public static void main(String[] args) {
		NoticeDAO noticeDAO = new NoticeDAO();
		
		for(int i=0;i<50;i++) {
			NoticeDTO noticeDTO = new NoticeDTO();
			noticeDTO.setWriter("choa");
			noticeDTO.setTitle("choa_title_"+i);
			noticeDTO.setContents("choa_contents_"+i);
			try {
				noticeDAO.insert(noticeDTO);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		System.out.println("Done!!!!");
	}
	*/
}
