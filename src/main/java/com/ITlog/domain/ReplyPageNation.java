package com.ITlog.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ReplyPageNation {
	
	private int relyCount;
	private List<ReplyVO> list;
	
	

}
