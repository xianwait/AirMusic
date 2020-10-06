package com.airmusic.entity;

public class Picture {
    private int pid;//照片编号
    private String pictureTitle;//图片标题
    private String picturePath;//图片路径

    public Picture(String pictureTitle, String picturePath) {
        this.pictureTitle=pictureTitle;
        this.picturePath=picturePath;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getPictureTitle() {
        return pictureTitle;
    }

    public void setPictureTitle(String pictureTitle) {
        this.pictureTitle = pictureTitle;
    }

    public String getPicturePath() {
        return picturePath;
    }

    public void setPicturePath(String picturePath) {
        this.picturePath = picturePath;
    }
}
