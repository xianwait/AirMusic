package com.airmusic.dao;

import com.airmusic.entity.SongList;

public interface AirMusicDao {
    /**新增歌单的方法*/
    public int addSongList(SongList songList);

    /**删除歌单的方法*/
    public int deleteSongList(SongList songList);
}
