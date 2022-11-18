package com.example.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.example.bean.WordVO;
import com.example.util.JDBCUtil;

public class WordDAO {
	
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;

	private final String WORD_INSERT = "insert into WordList (level, name, definitionK, definitionE, sentence, writer, type, photo) values (?,?,?,?,?,?,?,?)";
	private final String WORD_UPDATE = "update WordList set level=?, name=?, definitionK=?, definitionE=?, sentence=?, writer=?, type=?, photo=? where wordID=?";
	private final String WORD_DELETE = "delete from WordList  where wordID=?";
	private final String WORD_GET = "select * from WordList  where wordID=?";
	private final String WORD_LIST = "select * from WordList order by wordID desc";

	public int insertWord(WordVO vo) {
		System.out.println("===> JDBC로 insertWord() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(WORD_INSERT);
			stmt.setInt(1, vo.getLevel());
			stmt.setString(2, vo.getName());
			stmt.setString(3, vo.getDefinitionK());
			stmt.setString(4, vo.getDefinitionE());
			stmt.setString(5, vo.getSentence());
			stmt.setString(6, vo.getWriter());
			stmt.setString(7, vo.getType());
			stmt.setString(8,vo.getPhoto());
			stmt.executeUpdate();
			System.out.println(vo.getLevel() + "-" + vo.getName() + "-" + vo.getDefinitionK() + "-" + vo.getDefinitionE() + "-" + vo.getSentence() + "-" + vo.getWriter() + "-" + vo.getType() + "-" + vo.getPhoto());
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	// 글 삭제
	public void deleteWord(WordVO vo) {
		System.out.println("===> JDBC로 deleteWord() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(WORD_DELETE);
			stmt.setInt(1, vo.getId());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int updateWord(WordVO vo) {
		System.out.println("===> JDBC로 updateWord() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(WORD_UPDATE);
			stmt.setInt(1, vo.getLevel());
			stmt.setString(2, vo.getName());
			stmt.setString(3, vo.getDefinitionK());
			stmt.setString(4, vo.getDefinitionE());
			stmt.setString(5, vo.getSentence());
			stmt.setString(6, vo.getWriter());
			stmt.setString(7, vo.getType());
			stmt.setString(8, vo.getPhoto());
			stmt.setInt(9,vo.getId());
			System.out.println(vo.getLevel() + "-" + vo.getName() + "-" + vo.getDefinitionK() + "-" + vo.getDefinitionE() + "-" + vo.getSentence() + "-" + vo.getWriter() + "-" + vo.getType() + "-" + vo.getPhoto() + "-" + vo.getId());
			stmt.executeUpdate();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}	
	
	public WordVO getWord(int id) {
		WordVO one = new WordVO();
		System.out.println("===> JDBC로 getWord() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(WORD_GET);
			stmt.setInt(1, id);
			rs = stmt.executeQuery();
			if(rs.next()) {
				one.setId(rs.getInt("wordID"));
				one.setLevel(rs.getInt("level"));
				one.setName(rs.getString("name"));
				one.setDefinitionK(rs.getString("definitionK"));
				one.setDefinitionE(rs.getString("definitionE"));
				one.setSentence(rs.getString("sentence"));
				one.setWriter(rs.getString("writer"));
				one.setType(rs.getString("type"));
				one.setPhoto(rs.getString("photo"));
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return one;
	}
	
	public List<WordVO> getWordList(){
		List<WordVO> list = new ArrayList<WordVO>();
		System.out.println("===> JDBC로 getWordList() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(WORD_LIST);
			rs = stmt.executeQuery();
			while(rs.next()) {
				WordVO one = new WordVO();
				one.setId(rs.getInt("wordID"));
				one.setLevel(rs.getInt("level"));
				one.setName(rs.getString("name"));
				one.setDefinitionK(rs.getString("definitionK"));
				one.setDefinitionE(rs.getString("definitionE"));
				one.setSentence(rs.getString("sentence"));
				one.setWriter(rs.getString("writer"));
				one.setType(rs.getString("type"));
				one.setRegdate(rs.getDate("regDate"));
				one.setPhoto(rs.getString("photo"));
				list.add(one);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return list;
	}

	public String getPhotoFilename(int sid) {
		String filename = null;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(WORD_GET);
			stmt.setInt(1, sid);
			rs = stmt.executeQuery();
			if(rs.next()) {
				filename = rs.getString("photo");
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("===>JDBC로 getPhotoFilename() 기능 처리");
		return filename;
	}
}
