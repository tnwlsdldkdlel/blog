package com.ITlog.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class QANDAReplyPageNation {
	
	private int relyCount;
	private List<QANDAReplyVO> list;
	
	

}
