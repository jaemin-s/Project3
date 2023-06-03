package com.music.mrs.reply.mapper;

import java.util.List;
import java.util.Map;

import com.music.mrs.command.ReplyVO;

public interface IReplyMapper {

	// 댓글 등록
    void replyRegist(ReplyVO vo);
    
    // 목록 요청
    List<ReplyVO> replyList(Map<String, Object> data);
    
    // 댓글 수정
    void update(ReplyVO vo);
    
    // 댓글 삭제
    void delete(int rno);
	
}
