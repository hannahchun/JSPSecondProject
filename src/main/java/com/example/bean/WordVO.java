package com.example.bean;

import java.util.Date;

public class BoardVO {
	private int seq;
	private int cnt;
	private String category;


	private int level;
	private String name;
	private String defK;
	private String defE;
	private String writer;
	private String sentence;
	private String pron;
	private Date regdate;

	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getCategory() { return category; }
	public void setCategory(String category) { this.category = category; }


	public int getLevel() { return level; }
	public void setLevel(int level) { this.level = level; }

	public String getName() { return name; }
	public void setName(String name) { this.name = name; }

	public String getDefK() { return defK; }
	public void setDefK(String defK) { this.defK = defK; }

	public String getDefE() { return defE; }
	public void setDefE(String defE) { this.defE = defE; }

	public String getWriter() { return writer; }
	public void setWriter(String writer) { this.writer = writer; }

	public String getSentence() { return sentence; }
	public void setSentence(String sentence) { this.sentence = sentence; }

	public String getPron() { return pron; }
	public void setPron(String pron) { this.pron = pron; }

	public Date getRegdate() { return regdate; }
	public void setRegdate(Date regdate) { this.regdate = regdate; }

}
