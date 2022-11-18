package com.example.bean;

import java.util.Date;

public class WordVO {
	private int id;
	private int level;
	private String name;
	private String definitionK;
	private String definitionE;
	private String writer;
	private String sentence;
	private String type;
	private Date regdate;
	private String photo;

	public int getId() { return id; }
	public void setId(int id) { this.id = id; }

	public int getLevel() { return level; }
	public void setLevel(int level) { this.level = level; }

	public String getName() { return name; }
	public void setName(String name) { this.name = name; }

	public String getDefinitionK() { return definitionK; }
	public void setDefinitionK(String definitionK) { this.definitionK = definitionK; }

	public String getDefinitionE() { return definitionE; }
	public void setDefinitionE(String definitionE) { this.definitionE = definitionE; }

	public String getWriter() { return writer; }
	public void setWriter(String writer) { this.writer = writer; }

	public String getSentence() { return sentence; }
	public void setSentence(String sentence) { this.sentence = sentence; }

	public String getType() { return type; }
	public void setType(String type) { this.type = type; }

	public Date getRegdate() { return regdate; }
	public void setRegdate(Date regdate) { this.regdate = regdate; }

	public String getPhoto() { return photo; }
	public void setPhoto(String photo) { this.photo = photo; }
}
