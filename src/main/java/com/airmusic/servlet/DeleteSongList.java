package com.airmusic.servlet;

import com.airmusic.entity.SongList;
import com.airmusic.service.impl.AirMusicServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/DeleteSongList")
public class DeleteSongList extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //调用get方法
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        SongList songList = new SongList();

        System.out.println("进入servlet");
        songList.setmId(Integer.parseInt(request.getParameter("mid")));
        AirMusicServiceImpl airMusicService = new AirMusicServiceImpl();
        int result =  airMusicService.deleteSongListService(songList);
        PrintWriter out = response.getWriter();
        out .print(result);
    }
}
