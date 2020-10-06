package com.airmusic.dao;

import com.airmusic.entity.SongList;
import com.airmusic.entity.Picture;

import java.util.List;

public interface UserMapper {
    /**批量插入图片路径的方法*/
    public int importPicturePath(List<Picture> prictures);

    /**新增歌单的方法*/
    public int addSongListger(SongList songList);

    /**删除歌单的方法*/
    public int deleteSongList(SongList songList);
}
