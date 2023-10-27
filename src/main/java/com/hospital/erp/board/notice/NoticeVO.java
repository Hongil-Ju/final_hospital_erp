package com.hospital.erp.board.notice;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class NoticeVO {
	
	// 공지사항 PK
	private int notCd;
	
	// 공지사항 제목
	private String notTitle;
	
	// 공지사항 내용
	private String notContents;
	
	// 공지사항 조회수
	private Long notHit;
	
	// 공지사항 중요여부
	private int notImportant;
	
	// 공지사항 생성날짜
	private Date notRdate;

	// 멤버 테이블PK를 참조(FK)
	private String memCd;
}
