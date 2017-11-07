package com.iu.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.iu.util.DBConnector;
import com.sun.org.apache.regexp.internal.recompile;
import com.sun.xml.internal.bind.v2.runtime.unmarshaller.Discarder;

public class MemberDAO {
	public int getTotalCount(String kind,String search) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "select nvl(count(id),0) from member where "+kind+" like ? ";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, search);
		ResultSet rs = st.executeQuery();
		rs.next();
		int result = rs.getInt(1);
		DBConnector.disConnect(rs, st, con);
		return result;
	}
	
	public ArrayList<MemberDTO> selectList(int startRow, int lastRow, String kind, String search) throws Exception {
		ArrayList<MemberDTO> ar = new ArrayList<>();
		Connection con = DBConnector.getConnect();
		String sql = "select * from (select rownum R, N.*from (select * from member where "+kind+" like ?) N) where r between ? and ?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, "%"+search+"%");
		st.setInt(2, startRow);
		st.setInt(3, lastRow);
		ResultSet rs = st.executeQuery();
		while(rs.next()) {
			MemberDTO memberDTO =  new MemberDTO();
			memberDTO.setId(rs.getString("id"));
			memberDTO.setPw(rs.getString("pw"));
			memberDTO.setName(rs.getString("name"));
			memberDTO.setEmail(rs.getString("email"));
			memberDTO.setPhone(rs.getString("phone"));
			memberDTO.setAge(rs.getInt("age"));
			memberDTO.setJob(rs.getString("job"));
			ar.add(memberDTO);
		}
		DBConnector.disConnect(rs, st, con);
		return ar;
	}
	
	public MemberDTO selectOne(String id) throws Exception {
		Connection con = DBConnector.getConnect();
		MemberDTO memberDTO = new MemberDTO();
		String sql =  "select * from member where id=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, id);
		ResultSet rs = st.executeQuery();
		if(rs.next()) {
			memberDTO.setId(rs.getString("id"));
			memberDTO.setPw(rs.getString("pw"));
			memberDTO.setName(rs.getString("name"));
			memberDTO.setEmail(rs.getString("email"));
			memberDTO.setPhone(rs.getString("phone"));
			memberDTO.setAge(rs.getInt("age"));
			memberDTO.setJob(rs.getString("job"));
		}
		DBConnector.disConnect(rs, st, con);
		return memberDTO;
	}
	
	public int insert(MemberDTO memberDTO) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "insert into member values(?,?,?,?,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, memberDTO.getId());
		st.setString(2, memberDTO.getPw());
		st.setString(3, memberDTO.getName());
		st.setString(4, memberDTO.getEmail());
		st.setString(5, memberDTO.getPhone());
		st.setInt(6, memberDTO.getAge());
		st.setString(7, memberDTO.getJob());
		int result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
	}
	
	public int update(MemberDTO memberDTO) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql =  "update member set pw=?,email=?,phone=?,job=? where id = ?";
		PreparedStatement st =con.prepareStatement(sql);
		st.setString(1, memberDTO.getPw());
		st.setString(2, memberDTO.getEmail());
		st.setString(3, memberDTO.getPhone());
		st.setString(4, memberDTO.getJob());
		st.setString(5, memberDTO.getId());
		int result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
	}
	
	public int delete(String id) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "delete member where id=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, id);
		int result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
	}

}
