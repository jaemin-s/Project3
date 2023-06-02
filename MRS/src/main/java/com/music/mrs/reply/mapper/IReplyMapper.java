package com.music.mrs.reply.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.music.mrs.command.ReplyVO;
import com.music.mrs.command.UserVO;

public interface IReplyMapper {
	
	// 댓글 등록
    void replyRegist(@Param("vo") ReplyVO vo,@Param("uservo") String uservo);
    
    // 목록 요청
    List<ReplyVO> getList(Map<String, Object> data);
    
    // 댓글 수정
    void update(ReplyVO vo);
    
    // 댓글 삭제
    void delete(int rno);
}
