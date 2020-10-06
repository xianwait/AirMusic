package com.airmusic.service;

import com.airmusic.entity.SongList;

public interface AirMusicService {
    /**新增歌单的业务逻辑处理*/
    public int addSongListService(SongList songList);

    /**删除歌单的业务逻辑处理*/
    public int deleteSongListService(SongList songList);
}
