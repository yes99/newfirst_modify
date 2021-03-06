package com.example.newfirst.board.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.example.newfirst.board.domain.BoardVO;
import com.example.newfirst.board.mapper.BoardMapper;

@Service("com.example.newfirst.board.service.BoardService") // 서비스 클래스 입니다
public class BoardService {



    @Resource(name="com.example.newfirst.board.mapper.BoardMapper")
    BoardMapper mBoardMapper;

    /*public int count(Criteria cri) throws Exception{
        return mBoardMapper.count(cri);
    }*/

    public int boardCount() throws Exception{

        return mBoardMapper.boardCount();
    }

    public List<BoardVO> getlist () throws Exception{


        return mBoardMapper.getlist();
    }


    public List<BoardVO> boardListService(Criteria cri) throws Exception{


        return mBoardMapper.boardList(cri);
    }

    public List<BoardVO> getListService() throws Exception{

        return mBoardMapper.getlist();
    }
    public BoardVO boardDetailService(int id) throws Exception{

        return mBoardMapper.boardDetail(id);
    }

    public int boardInsertService(BoardVO board) throws Exception{

        return mBoardMapper.boardInsert(board);
    }

    public int boardUpdateService(BoardVO board) throws Exception{

        return mBoardMapper.boardUpdate(board);
    }

    public int boardDeleteService(int id) throws Exception{

        return mBoardMapper.boardDelete(id);
    }
}
