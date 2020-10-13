<%--
  Created by IntelliJ IDEA.
  User: 弦
  Date: 2020/9/8
  Time: 15:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <title>网易云音乐</title>
    <link rel="stylesheet" type="text/css" href="css/registrationPage.css">
    <link rel="icon" type="image/ico" href="images/format.ico"/>
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/index.css"/>
    <script type="text/javascript" src="libs/jquery-3.1.1.min.js"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/ykindex.css"/>
    <link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
</head>

<body onselectstart="return false">
<!-- page_list 页面左侧歌单 -->
<div class="page_list">
    <div class="list_container" id="listContainer">
        <div class="list list_recommend">
            <p class="title">推荐</p>
            <div class="btngroups">
                <p class="btn find" id="discovrMusic"><i class="fa fa-music" aria-hidden="true"></i>&nbsp;&nbsp;发现音乐</p>
                <p class="btn fm"><i class="fa fa-bullseye" aria-hidden="true"></i>&nbsp;&nbsp;私人FM</p>
                <p class="btn mv"><i class="fa fa-youtube-play" aria-hidden="true"></i>&nbsp;&nbsp;MV</p>
                <p class="btn friends"><i class="fa fa-user-plus" aria-hidden="true"></i>&nbsp;&nbsp;我的朋友</p>
            </div>
        </div>
        <div class="list list_me">
            <p class="title">我的音乐</p>
            <div class="btngroups">
                <p class="btn local"><i class="fa fa-music" aria-hidden="true"></i>&nbsp;&nbsp;本地音乐</p>
                <p class="btn download"><i class="fa fa-download" aria-hidden="true"></i>&nbsp;&nbsp;下载管理</p>
                <p class="btn cloud"><i class="fa fa-cloud" aria-hidden="true"></i>&nbsp;&nbsp;我的音乐云盘</p>
                <p class="btn singers"><i class="fa fa-user-plus" aria-hidden="true"></i>&nbsp;&nbsp;我的歌手</p>
                <p class="btn me_mv"><i class="fa fa-youtube-play" aria-hidden="true"></i>&nbsp;&nbsp;我的MV</p>
                <p class="btn me_fm"><i class="fa fa-bullseye" aria-hidden="true"></i>&nbsp;&nbsp;我的电台</p>
            </div>
        </div>
        <div class="list list_create">
            <p class="title">创建的歌单
                <span class="title_btngroups">
						<a href="javascript:void(0);" class="btn addlist" id="addList"><i class="fa fa-plus-circle"
                                                                                          aria-hidden="true"></i></a>
						<a href="javascript:void(0);" class="btn unfoldlist"><i class="fa fa-angle-down"
                                                                                aria-hidden="true"></i></a>
					</span>
            </p>
            <div class="btngroups" id="myPlayList">
                <p class="btn list_create_like active" id="list_create_like"><i class="fa fa-heart-o"
                                                                                aria-hidden="true"></i>&nbsp;&nbsp;我喜欢的音乐
                </p>
            </div>
        </div>
        <div class="list list_collect">
            <p class="title">收藏的歌单
                <span class="title_btngroups">
						<a href="javascript:void(0);" class="btn unfoldlist"><i class="fa fa-angle-down"
                                                                                aria-hidden="true"></i></a>
					</span>
            </p>
            <div class="btngroups" id="collPlaylists">
            </div>
        </div>
    </div>
    <!-- 全屏小窗 -->
    <div class="playlist_smallwindow clearfix">
        <div class="poster" id="btnExpandPlayBox">
            <img src="images/temp_pic001.jpg" alt="" id="smallwindow_albumPic"/>
            <div class="poster_hoverback"><i class="fa fa-expand" aria-hidden="true"></i></div>
        </div>
        <div class="info">
            <p class="songname" id="smallwindow_songName">-SONGNAME-</p>
            <p class="singername" id="smallwindow_singerName">-SINGER-</p>
        </div>
        <div class="btngroups">
            <div class="btn collect"><i class="fa fa-heart-o" aria-hidden="true"></i></div>
            <div class="btn share"><i class="fa fa-share-square-o" aria-hidden="true"></i></div>
        </div>
    </div>
</div>
<!-- page_menu 页面顶部菜单 -->
<div class="page_menu clearfix">
    <div class="menu_logo"><img src="images/未标题-1.png" width="330px" alt="网易云"></div>
    <div class="menu_btngroups">
        <a href="javascript:void(0);" class="btn backward"><i class="fa fa-angle-left" aria-hidden="true"></i></a>
        <!--
        --><a href="javascript:void(0);" class="btn forward"><i class="fa fa-angle-right" aria-hidden="true"></i></a>
    </div>
    <div class="menu_search">
        <input type="text" placeholder="探索音乐、歌手、歌词、用户" autofocus="" id="inpSearch" class="search_inp"/>
        <span class="search_btn" id="top_searchBtn"><i class="fa fa-search" aria-hidden="true"></i></span>
    </div>
    <div id="userMsg">
        <img id="user_avatar" src="images/用户.png" width="32" height="32" style="border-radius: 50%" alt="用户头像">
        <label class="menu_set" id="nickname"
               data_uID="">未登录 <%--<i class="fa fa-caret-down"  style="color: white"></i>--%></label>
    </div>
</div>
<!-- page_playerbar 页面底部播放控制条 -->
<div class="page_playerbar clearfix">
    <!-- 播放控制按钮组 -->
    <div class="playerbar_playbtngroup" id="playBtnGroup">
        <div class="btn prev"><i class="fa fa-step-backward" aria-hidden="true"></i></div>
        <div class="btn play"><i class="fa fa-play" aria-hidden="true"></i></div>
        <div class="btn next"><i class="fa fa-step-forward" aria-hidden="true"></i></div>
    </div>
    <!-- 进度条 -->
    <div class="playerbar_timeprogress">
        <div class="progress" id="progress_box">
            <div class="progress_cache" id="progress_cache">
                <!-- 缓冲条 -->
            </div>
            <div class="progress_curbar" id="progress_bar">
                <div class="curbar_arc" id="progress_arc"></div>
            </div>
            <div class="time start" id="audio_currentTime">00:00</div>
            <div class="time end" id="audio_duration">00:00</div>
        </div>
    </div>
    <!-- 其他控制按钮组 -->
    <div class="playerbar_others">
        <div class="volume">
            <div class="mutebtn" id="muteBtn" title="静音"><i class="fa fa-volume-up" aria-hidden="true"></i></div>
            <div class="progress" id="vol_progress_box">
                <div class="progress_curbar" id="vol_progress_bar">
                    <div class="curbar_arc" id="vol_progress_arc"></div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 发现音乐 -->
<div id="FoundThatMusic" class="R_page">
    <!-- 导航栏 -->
    <div class="container " id="homepag">
        <!-- Nav tabs -->
        <ul id="navigation" class="nav nav-tabs" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" data-toggle="tab" href="#home">个性推荐</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#menu1">歌单</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#menu2">主播电台</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#menu3">排行榜</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#menu4">歌手</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#menu5">最新音乐</a>
            </li>
        </ul>

        <!-- Tab panes -->
        <div class="tab-content">
            <div id="home" class="container tab-pane active"><br>

                <div id="demo" class="carousel slide" data-ride="carousel">

                    <!-- 指示符 -->
                    <ul class="carousel-indicators">
                        <li data-target="#demo" data-slide-to="0" class="active"></li>
                        <li data-target="#demo" data-slide-to="1"></li>
                        <li data-target="#demo" data-slide-to="2"></li>
                        <li data-target="#demo" data-slide-to="3"></li>
                        <li data-target="#demo" data-slide-to="4"></li>
                        <li data-target="#demo" data-slide-to="5"></li>
                        <li data-target="#demo" data-slide-to="6"></li>
                        <li data-target="#demo" data-slide-to="7"></li>
                        <li data-target="#demo" data-slide-to="8"></li>
                        <li data-target="#demo" data-slide-to="9"></li>
                    </ul>

                    <!-- 轮播图片 -->
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="images/l1.jpg" alt="">
                        </div>
                        <div class="carousel-item">
                            <img src="images/l2.jpg" alt="">
                        </div>
                        <div class="carousel-item">
                            <img src="images/l3.jpg">
                        </div>
                        <div class="carousel-item">
                            <img src="images/l4.jpg">
                        </div>
                        <div class="carousel-item">
                            <img src="images/l5.jpg">
                        </div>
                        <div class="carousel-item">
                            <img src="images/l6.jpg">
                        </div>
                        <div class="carousel-item">
                            <img src="images/l7.jpg">
                        </div>
                        <div class="carousel-item">
                            <img src="images/l8.jpg">
                        </div>
                        <div class="carousel-item">
                            <img src="images/l9.jpg">
                        </div>
                        <div class="carousel-item">
                            <img src="images/l10.jpg">
                        </div>
                    </div>

                    <!-- 左右切换按钮 -->
                    <a class="carousel-control-prev" href="#demo" data-slide="prev">
                        <span class="carousel-control-prev-icon"></span>
                    </a>
                    <a class="carousel-control-next" href="#demo" data-slide="next">
                        <span class="carousel-control-next-icon"></span>
                    </a>

                </div>

                <!-- 推荐歌单 -->
                <div id="reSongList">
                    <div id="recommend">
                        <h3>推荐歌单</h3>
                    </div>
                    <div id="more"><a href="javascript:void(0);">更多></a></div>
                    <hr/>
                </div>

                <!--网易云源码首页推荐歌单-->
                <ul class="m-cvrlst f-cb" id="rdPlayList">
                    <li>
                        <div class="u-cover u-cover-1">
                            <img src="http://p2.music.126.net/R0s2tQ2Qp0_f5Bc4AH_Scw==/109951165379701010.jpg?param=140y140">
                            <a title="[一周新歌推荐] 马頔温柔改编告五人《披星戴月的想你》" href="#" class="msk"
                               data-res-id="2409342460"
                               data-res-type="13" data-res-action="log"
                               data-res-data="recommendclick|0|featured|user-playlist"></a>
                            <div class="bottom">
                                <a class="icon-play f-fr" title="播放" href="javascript:" data-res-type="13"
                                   data-res-id="2409342460"
                                   data-res-action="play"></a>
                                <span class="icon-headset"></span>
                                <span class="nb">39119万</span>
                            </div>
                        </div>
                        <p class="dec">
                            <a title="[一周新歌推荐] 马頔温柔改编告五人《披星戴月的想你》" class="tit s-fc0"
                               href="#" data-res-id="2409342460"
                               data-res-type="13" data-res-action="log"
                               data-res-data="recommendclick|0|featured|user-playlist">
                                [一周新歌推荐] 马頔温柔改编告五人《披星戴月的想你》
                            </a>
                        </p>
                    </li>
                    <li class="twoLi">
                        <div class="u-cover u-cover-1">
                            <img src="http://p2.music.126.net/-VszhGyk14B2YtjSeFqOqQ==/109951165344782960.jpg?param=140y140">
                            <a title="心事博物馆 | 来寄存那些隐藏心底的秘密" href="#" class="msk"
                               data-res-id="5254739915"
                               data-res-type="13" data-res-action="log"
                               data-res-data="recommendclick|1|featured|user-playlist"></a>
                            <div class="bottom">
                                <a class="icon-play f-fr" title="播放" href="javascript:" data-res-type="13"
                                   data-res-id="5254739915"
                                   data-res-action="play"></a>
                                <span class="icon-headset"></span>
                                <span class="nb">41万</span>
                            </div>
                        </div>
                        <p class="dec">
                            <a title="心事博物馆 | 来寄存那些隐藏心底的秘密" class="tit s-fc0" href="#"
                               data-res-id="5254739915"
                               data-res-type="13" data-res-action="log"
                               data-res-data="recommendclick|1|featured|user-playlist">
                                心事博物馆 | 来寄存那些隐藏心底的秘密
                            </a>
                        </p>
                    </li>
                    <li class="theThird">
                        <div class="u-cover u-cover-1">
                            <img src="http://p2.music.126.net/Y-N9UFCEZplBlqfNBPvd_g==/109951165175224475.jpg?param=140y140">
                            <a title="抓不住的青春，就让它定格在彼岸" href="#" class="msk"
                               data-res-id="361941329" data-res-type="13"
                               data-res-action="log"
                               data-res-data="recommendclick|2|itembased2|user-playlist"></a>
                            <div class="bottom">
                                <a class="icon-play f-fr" title="播放" href="javascript:;" data-res-type="13"
                                   data-res-id="361941329"
                                   data-res-action="play"></a>
                                <span class="icon-headset"></span>
                                <span class="nb">558万</span>
                            </div>
                        </div>
                        <p class="dec">
                            <a title="抓不住的青春，就让它定格在彼岸" class="tit s-fc0" href="#"
                               data-res-id="361941329"
                               data-res-type="13" data-res-action="log"
                               data-res-data="recommendclick|2|itembased2|user-playlist">
                                抓不住的青春，就让它定格在彼岸
                            </a>
                        </p>
                    </li>
                    <li class="theSecond">
                        <div class="u-cover u-cover-1">
                            <img src="http://p2.music.126.net/MCYMeegzryUR9p_q1NZ_5g==/109951165376257301.jpg?param=140y140">
                            <a title="“我刚刚决定不喜欢你了”" href="#" class="msk"
                               data-res-id="2069644795" data-res-type="13"
                               data-res-action="log"
                               data-res-data="recommendclick|3|featured|user-playlist"></a>
                            <div class="bottom">
                                <a class="icon-play f-fr" title="播放" href="javascript:" data-res-type="17"
                                   data-res-id="2069644795"
                                   data-res-action="play"></a>
                                <span class="icon-headset"></span>
                                <span class="nb">3921万</span>
                            </div>
                        </div>
                        <p class="dec">
                            <a title="“我刚刚决定不喜欢你了”" class="tit s-fc0" href="#"
                               data-res-id="2069644795" data-res-type="17"
                               data-res-action="log" data-res-data="recommendclick|3|featured|user-playlist">
                                <i class="u-icn u-icn-53"></i>
                                “我刚刚决定不喜欢你了”
                            </a>
                        </p>
                    </li>
                    <li>
                        <div class="u-cover u-cover-1">
                            <img src="http://p2.music.126.net/BeIc-sv62xZPpVBS4DjE-g==/109951164607988464.jpg?param=140y140">
                            <a title="私人雷达 | 根据听歌记录为你打造" href="#" class="msk"
                               data-res-id="3136952023" data-res-type="13"
                               data-res-action="log"
                               data-res-data="recommendclick|4|official_image_album_sub|user-playlist"></a>
                            <div class="bottom">
                                <a class="icon-play f-fr" title="播放" href="javascript:;" data-res-type="13"
                                   data-res-id="3136952023"
                                   data-res-action="play"></a>
                                <span class="icon-headset"></span>
                                <span class="nb">281756万</span>
                            </div>
                        </div>
                        <p class="dec">
                            <a title="私人雷达 | 根据听歌记录为你打造" class="tit s-fc0" href="#"
                               data-res-id="3136952023"
                               data-res-type="13" data-res-action="log"
                               data-res-data="recommendclick|4|official_image_album_sub|user-playlist">
                                私人雷达 | 根据听歌记录为你打造
                            </a>
                        </p>
                    </li>
                    <li class="twoLi">
                        <div class="u-cover u-cover-1">
                            <img src="http://p2.music.126.net/I_pwyNtKM-bDIYHuyci3eA==/109951165372772871.jpg?param=140y140">
                            <a title="29.ST 我在低谷中找到了“自己”这个宝藏" href="#" class="msk"
                               data-res-id="2069633659" data-res-type="13"
                               data-res-action="log"
                               data-res-data="recommendclick|5|featured|user-playlist"></a>
                            <div class="bottom">
                                <a class="icon-play f-fr" title="播放" href="javascript:;" data-res-type="17"
                                   data-res-id="2069633659"
                                   data-res-action="play"></a>
                                <span class="icon-headset"></span>
                                <span class="nb">1955万</span>
                            </div>
                        </div>
                        <p class="dec">
                            <a title="29.ST 我在低谷中找到了“自己”这个宝藏" class="tit s-fc0" href="#"
                               data-res-id="2069633659"
                               data-res-type="17" data-res-action="log"
                               data-res-data="recommendclick|5|featured|user-playlist">
                                <i class="u-icn u-icn-53"></i>
                                29.ST 我在低谷中找到了“自己”这个宝藏
                            </a>
                        </p>
                    </li>
                    <li class="theThird">
                        <div class="u-cover u-cover-1">
                            <img src="http://p2.music.126.net/xyM7WWIi6MH2IMH1gxwUZw==/19089720882044508.jpg?param=140y140">
                            <a title="「古风」钢琴前奏，还你一个清凉静谧的夏天" href="#" class="msk"
                               data-res-id="2221827668"
                               data-res-type="13" data-res-action="log"
                               data-res-data="recommendclick|6|itembased|user-playlist"></a>
                            <div class="bottom">
                                <a class="icon-play f-fr" title="播放" href="javascript:;" data-res-type="13"
                                   data-res-id="2221827668"
                                   data-res-action="play"></a>
                                <span class="icon-headset"></span>
                                <span class="nb">511万</span>
                            </div>
                        </div>
                        <p class="dec">
                            <a title="「古风」钢琴前奏，还你一个清凉静谧的夏天" class="tit s-fc0" href="#"
                               data-res-id="2221827668"
                               data-res-type="13" data-res-action="log"
                               data-res-data="recommendclick|6|itembased|user-playlist">
                                「古风」钢琴前奏，还你一个清凉静谧的夏天
                            </a>
                        </p>
                    </li>
                    <li class="theSecond">
                        <div class="u-cover u-cover-1">
                            <img src="http://p2.music.126.net/2JVng-jUfhY1AV6bgVuKXg==/109951164997240538.jpg?param=140y140">
                            <a title="Downtown baby" href="#" class="msk"
                               data-res-id="2069353911" data-res-type="13"
                               data-res-action="log"
                               data-res-data="recommendclick|7|hot_server|user-playlist"></a>
                            <div class="bottom">
                                <a class="icon-play f-fr" title="播放" href="javascript:;" data-res-type="17"
                                   data-res-id="2069353911"
                                   data-res-action="play"></a>
                                <span class="icon-headset"></span>
                                <span class="nb">201万</span>
                            </div>
                        </div>
                        <p class="dec">
                            <a title="Downtown baby" class="tit s-fc0" href="#"
                               data-res-id="2069353911" data-res-type="17"
                               data-res-action="log" data-res-data="recommendclick|7|hot_server|user-playlist">
                                <i class="u-icn u-icn-53"></i>
                                Downtown baby
                            </a>
                        </p>
                    </li>
                </ul>


            </div>
            <div id="menu1" class="container tab-pane fade"><br>
                <h3></h3>
                <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
                    commodo consequat.</p>
            </div>
            <div id="menu2" class="container tab-pane fade"><br>
                <h3></h3>
                <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque
                    laudantium, totam rem
                    aperiam.</p>
            </div>
            <div id="menu3" class="container tab-pane fade"><br>
                <h3></h3>
                <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque
                    laudantium, totam rem
                    aperiam.</p>
            </div>
            <div id="menu4" class="container tab-pane fade"><br>
                <h3></h3>
                <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque
                    laudantium, totam rem
                    aperiam.</p>
            </div>
            <div id="menu5" class="container tab-pane fade"><br>
                <h3></h3>
                <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque
                    laudantium, totam rem
                    aperiam.</p>
            </div>
        </div>
    </div>
</div>
<!-- page_main 歌单：我喜欢的音乐 -->
<div class="page_main R_page" id="pageMain">
    <div class="main_container">
        <div id="likeSongList" class="listcontainer">

            <div class="listinfo clearfix">
                <div class="info_listpic">
                    <img src="images/temp_pic001.jpg" alt="" id="playlist_listPic"/>
                </div>
                <div class="info_detailtext">
                    <div class="playinfo">
                        <span><i class="fa fa-music" aria-hidden="true"></i>&nbsp;&nbsp;<span
                                id="playlist_trackCount">0</span></span>
                        <span><i class="fa fa-play-circle-o" aria-hidden="true"></i>&nbsp;&nbsp;<span
                                id="playlist_playCount">0</span></span>
                    </div>
                    <div class="detail_name">
                        <span class="listtag">歌单</span>
                        <span class="listname" id="playlist_listName">歌单名称</span>
                    </div>
                    <div class="detail_time">
                        <span class="userpic"><a href="javascript:void(0);"><img src="images/user_face.png" alt=""
                                                                                 id="playlist_userFace"/></a></span>
                        <span class="username"><a href="javascript:void(0);" id="playlist_userName">user008</a></span>
                        <span class="createtime" id="playlist_createTime">1970-01-01</span>
                        <span>创建</span>
                    </div>
                    <div class="detail_btns">
                        <span class="btn playall"><i class="fa fa-play-circle-o" aria-hidden="true"
                                                     style="color:#c52f30;"></i>&nbsp;&nbsp;播放全部</span>
                        <!--
                        --><span class="btn plus"><i class="fa fa-plus" aria-hidden="true"></i></span>
                        <span class="btn playall" id="ckPlaylist"><i class="fa fa-folder"
                                                     aria-hidden="true"></i>&nbsp;&nbsp;<span id="scCount">收藏(0)</span></span>
                        <span class="btn playall"><i class="fa fa-share-square-o" aria-hidden="true"></i>&nbsp;&nbsp;<span id="fxCount">分享(0)</span></span>
                        <span class="btn playall"><i class="fa fa-download"
                                                     aria-hidden="true"></i>&nbsp;&nbsp;下载全部</span>
                    </div>
                </div>
            </div>
            <div class="listtab">
                <div class="tabbtns clearfix">
                    <label class="label_btn active" for="music">歌单列表</label>
                    <label class="label_btn" for="comment">评论(0)</label>
                    <label class="label_btn" for="follower">收藏者</label>
                    <span class="menu_search">
							<input type="text" placeholder="搜索歌单音乐" class="search_inp"/>
							<span class="search_btn"><i class="fa fa-search" aria-hidden="true"></i></span>
						</span>
                </div>
                <!-- musiclist -->
                <input type="radio" id="music" name="tablist" checked=""/>
                <div class="tabitem musiclist">
                    <table>
                        <thead>
                        <tr>
                            <th>&nbsp;&nbsp;</th>
                            <th>操作</th>
                            <th>音乐标题</th>
                            <th>歌手</th>
                            <th>专辑</th>
                            <th>时长</th>
                        </tr>
                        </thead>
                        <tbody class="infolist" id="infoList_playlist">
                        <tr>
                            <td class="index">01</td>
                            <td><i class="fa fa-heart-o" aria-hidden="true"></i>&nbsp;
                                <i class="fa fa-download" aria-hidden="true"></i>
                            </td>
                            <td>-SONGNAME-</td>
                            <td>-SINGER-</td>
                            <td>-ALBUM-</td>
                            <td>00:00</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <!-- comments -->
                <input type="radio" id="comment" name="tablist"/>
                <div class="tabitem commentlist">
                    <div class="commentbox clearfix">
                        <textarea name="" id="" cols="30" rows="10" maxlength="140"></textarea>
                        <span class="wordslen">140</span>
                        <a href="javascript:void(0);" class="btn emoji"><i class="fa fa-smile-o" aria-hidden="true"></i></a>
                        <a href="javascript:void(0);" class="btn at"><i class="fa fa-at" aria-hidden="true"></i></a>
                        <a href="javascript:void(0);" class="btn comment">评论</a>
                    </div>
                    <div class="commenttable">
                        <div class="comment new">
                            <div class="title">最新评论(0)</div>
                            <div class="content">
                                <p><span class="username"><a href="javascript:void(0);">用户008</a></span>：<span
                                        class="usersay">Lorem ipsum
											dolor sit amet, consectetur adipisicing elit. Laborum, earum cupiditate facere suscipit tenetur quia ab
											quasi ea eligendi, neque esse quidem. Eius, quasi! Odit veniam repellat amet, accusamus voluptatem.</span>
                                </p>
                                <div class="btngroups clearfix">
                                    <span class="time">2016年12月31日 10:35:06</span>
                                    <span class="btn">
											<a href="javascript:void(0);" class="btn_report">举报</a>&nbsp;&nbsp;|&nbsp;&nbsp;
											<a href="javascript:void(0);" class="btn_support"><i
                                                    class="fa fa-thumbs-o-up" aria-hidden="true"></i>(0)</a>&nbsp;&nbsp;|&nbsp;&nbsp;
											<a href="javascript:void(0);" class="btn_share">分享</a>&nbsp;&nbsp;|&nbsp;&nbsp;
											<a href="javascript:void(0);" class="btn_reply">回复</a>
										</span>
                                </div>
                                <div class="userface"><a href="javascript:void(0);"><img src="images/user_face.png"
                                                                                         alt=""/></a></div>
                            </div>
                            <div class="content">
                                <p><span class="username"><a href="javascript:void(0);">用户008</a></span>：<span
                                        class="usersay">Lorem ipsum
											dolor sit amet, consectetur adipisicing elit.</span></p>
                                <div class="btngroups clearfix">
                                    <span class="time">2016年12月31日 10:35:06</span>
                                    <span class="btn">
											<a href="javascript:void(0);" class="btn_report">举报</a>&nbsp;&nbsp;|&nbsp;&nbsp;
											<a href="javascript:void(0);" class="btn_support"><i
                                                    class="fa fa-thumbs-o-up" aria-hidden="true"></i>(0)</a>&nbsp;&nbsp;|&nbsp;&nbsp;
											<a href="javascript:void(0);" class="btn_share">分享</a>&nbsp;&nbsp;|&nbsp;&nbsp;
											<a href="javascript:void(0);" class="btn_reply">回复</a>
										</span>
                                </div>
                                <div class="userface"><a href="javascript:void(0);"><img src="images/user_face.png"
                                                                                         alt=""/></a></div>
                            </div>
                        </div>
                        <div class="comment prefect">
                            <div class="title">精彩评论(0)</div>
                            <div class="content">
                                <p style="color:#ccc;">-- 暂无评论 --</p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- followers -->
                <input type="radio" id="follower" name="tablist"/>
                <div class="tabitem followerlist">
                    <figure>
                        <a href="javascript:void(0);"><img src="images/user_face.png" alt=""/></a>
                        <figcaption><a href="javascript:void(0);">-USERNAME-</a></figcaption>
                    </figure>
                    <figure>
                        <a href="javascript:void(0);"><img src="images/user_face.png" alt=""/></a>
                        <figcaption><a href="javascript:void(0);">-USERNAME-</a></figcaption>
                    </figure>
                    <figure>
                        <a href="javascript:void(0);"><img src="images/user_face.png" alt=""/></a>
                        <figcaption><a href="javascript:void(0);">-USERNAME-</a></figcaption>
                    </figure>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 登录页 -->
<div class="back" style="display: none">
    <div>
        <a href="#" class="fanghui" id="esc">返回登录</a>
        <a href="#"><i class="fa fa-close log_close" style="font-size: 20px"></i></a>
    </div>
    <img src="images/网易云音乐-01.PNG" width="300" height="50">
    <div>
        <p class="information">
        <table>
            <tr>
                <td><input type="text" class="user" required placeholder="请输入你的手机号" value="15669135292"></td>
            </tr>
            <tr>
                <td><input type="password" class="password" required placeholder="请输入你的密码" value="wqxwait9214"></td>
            </tr>
        </table>
        <input id="loginUser" class="denlu" type="button" value="登录">
        <br>
        <a href="#" class="zhuche">注册</a>
        <p><input type="button" class="register" value="注册"></p>
        </p>
    </div>
    <br/><br/>
    <p class="chk">
        <input type="checkbox" class="checkbox">同意<a href="https://st.music.163.com/official-terms/service">《服务条款》</a>
    </p>
</div>
<!-- page_search 搜索页 -->
<div class="page_search R_page" id="pageSearch" style="display:none;">
    <div class="main_container">
        <div class="listcontainer">
            <p style="margin:20px 40px;color:#bbb;" id="search_count">搜索 "<span class="input" style="color:#0b75c3;">STRING</span>"，共搜到
                <span class="count">0</span> 条结果，本页最多显示 100 条结果</p>
            <div class="listtab">
                <div class="tabbtns clearfix">
                    <label class="label_btn active" for="song">单曲</label>
                    <label class="label_btn" for="singer">歌手</label>
                    <label class="label_btn" for="album">专辑</label>
                    <label class="label_btn" for="musicvideo">MV</label>
                    <label class="label_btn" for="playlist">歌单</label>
                    <label class="label_btn" for="songlrc">歌词</label>
                    <label class="label_btn" for="fm">主播电台</label>
                    <label class="label_btn" for="user">用户</label>
                </div>
                <!-- song -->
                <input type="radio" id="song" name="tablist_s" checked=""/>
                <div class="tabitem musiclist">
                    <table>
                        <thead>
                        <tr>
                            <th>&nbsp;&nbsp;</th>
                            <th>操作</th>
                            <th>音乐标题</th>
                            <th>歌手</th>
                            <th>专辑</th>
                            <th>时长</th>
                        </tr>
                        </thead>
                        <tbody class="infolist" id="infoList_search">
                        <tr>
                            <td class="index">01</td>
                            <td><i class="fa fa-heart-o" aria-hidden="true"></i>&nbsp;
                                <i class="fa fa-download" aria-hidden="true"></i>
                            </td>
                            <td>-SONGNAME-</td>
                            <td>-SINGER-</td>
                            <td>-ALBUM-</td>
                            <td>00:00</td>
                        </tr>
                        </tbody>
                        </tfoot>
                    </table>
                </div>
                <!-- singer -->
                <input type="radio" id="singer" name="tablist_s"/>
                <div class="tabitem singerlist">
                    <p style="margin:100px 0;text-align:center;color:#bbb;font-size:1rem;">--分类功能暂未上线--</p>
                </div>
                <!-- album -->
                <input type="radio" id="album" name="tablist_s"/>
                <div class="tabitem albumlist">
                    <p style="margin:100px 0;text-align:center;color:#bbb;font-size:1rem;">--分类功能暂未上线--</p>
                </div>
                <!-- musicvideo -->
                <input type="radio" id="musicvideo" name="tablist_s"/>
                <div class="tabitem musicvideolist">
                    <p style="margin:100px 0;text-align:center;color:#bbb;font-size:1rem;">--分类功能暂未上线--</p>
                </div>
                <!-- playlist -->
                <input type="radio" id="playlist" name="tablist_s"/>
                <div class="tabitem playlist">
                    <p style="margin:100px 0;text-align:center;color:#bbb;font-size:1rem;">--分类功能暂未上线--</p>
                </div>
                <!-- songlrc -->
                <input type="radio" id="songlrc" name="tablist_s"/>
                <div class="tabitem songlrclist">
                    <p style="margin:100px 0;text-align:center;color:#bbb;font-size:1rem;">--分类功能暂未上线--</p>
                </div>
                <!-- fm -->
                <input type="radio" id="fm" name="tablist_s"/>
                <div class="tabitem fmlist">
                    <p style="margin:100px 0;text-align:center;color:#bbb;font-size:1rem;">--分类功能暂未上线--</p>
                </div>
                <!-- user -->
                <input type="radio" id="user" name="tablist_s"/>
                <div class="tabitem userlist">
                    <p style="margin:100px 0;text-align:center;color:#bbb;font-size:1rem;">--分类功能暂未上线--</p>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- page_lyric 歌曲详情页 -->
<div class="page_songdetail" id="pageSongDetail">
    <!-- 模糊背景 -->
    <div class="g_blurbg" id="bgBlur" style="background-image:url('images/al8.png');"></div>
    <div class="maincontainer clearfix">
        <div class="compressbtn" id="btnCompressPlayBox" title="收起音乐详情页">
            <i class="fa fa-compress" aria-hidden="true"></i>
        </div>
        <div class="discsection">
            <div class="disc_needle" id="discNeedle"><img src="images/needle.png" alt=""></div>
            <div class="disc_arc" id="bgDisc" style="background-image:url('images/al8.png');">
                <div class="poster"><img src="images/disc-o.png" alt=""></div>
            </div>
            <div class="disc_btns">
                <span class="btn playall"><i class="fa fa-heart-o" aria-hidden="true"></i>&nbsp;&nbsp;喜欢</span>
                <span class="btn playall"><i class="fa fa-folder" aria-hidden="true"></i>&nbsp;&nbsp;收藏</span>
                <span class="btn playall"><i class="fa fa-download" aria-hidden="true"></i>&nbsp;&nbsp;下载</span>
                <span class="btn playall"><i class="fa fa-share-square-o" aria-hidden="true"></i>&nbsp;&nbsp;分享</span>
            </div>
        </div>
        <div class="lyricsection">
            <div class="lrcinfo" id="songDetail">
                <p class="info_song"><span class="songname">--SONGNAME--</span><span class="label mv">MV</span><span
                        class="label quality">320k</span></p>
                <p class="info_album">
						<span class="album">歌手：<span class="albumname">--ALBUMNAME--</span>
						</span>
                    <span class="singer">专辑：<span class="singersname">--ALBUMNAME--</span>
						</span>
                    <span class="origin">来源：<span class="originname">--ORIGIN--</span>
						</span>
                </p>
            </div>
            <div class="lrccontainer" id="lrcContainer">
                <div class="lrcbox" id="lrcBox">
                    <!-- <p>暂无歌词</p> -->
                </div>
            </div>
        </div>
    </div>
</div>
<!-- audio -->
<audio id="audio">您的该版本浏览器不支持AUDIO标签！！！</audio>
<!-- backscreen -->
<div class="g_backscreen" id="backScreen"></div>
<!-- tips box -->
<div class="g_tipsbox" id="tipsBox">
    <p class="tip tip_error show"><i class="fa fa-times-circle" aria-hidden="true"></i>&nbsp;&nbsp;<span
            class="tiptext">ERROR
				STRING</span></p>
    <p class="tip tip_info"><i class="fa fa-info-circle" aria-hidden="true"></i>&nbsp;&nbsp;<span class="tiptext">INFO
				STRING</span></p>
    <p class="tip tip_ok"><i class="fa fa-check-circle" aria-hidden="true"></i>&nbsp;&nbsp;<span class="tiptext">OK
				STRING</span></p>
</div>
<!-- loading -->
<div class="g_loadingbox" id="loadingBox">
    <i class="fa fa-spinner fa-spin fa-fw"></i>
    <span class="loading_text">
			<!-- Loading... --></span>
</div>
<p><i class="fa fa-trash"></i></p>
<div class="addList">
    <table border="0">
        <div>
            <tr id="titleSongtr">
                <th colspan="2" style="font-size: 20px;"><span id="titleSong">新建歌单</span></th>
            </tr>
        </div>
        <div>
            <tr id="songListValue">
                <td colspan="2"><input type="text" class="form-control" id="usr" placeholder="请输入新歌单标题"/></td>
            </tr>
        </div>
        <div>
            <tr id="songListBtn">
                <td>
                    <button type="button" class="btn btn-info">创建歌单</button>
                </td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-light">取消</button>
                </td>
            </tr>
        </div>
    </table>
</div>


<a href="javascript:void(0);" class="btn addlist"><i class="fa fa-plus-circle" aria-hidden="true"></i></a>


<span class="oper hshow" style="display: block;"><a data-action="edit-playlist" hidefocus="true" title="编辑"
                                                    href="javascript:void(0)" class="u-icn u-icn-10"></a><a
        data-action="delete" hidefocus="true" title="删除" href="javascript:void(0);" class="u-icn u-icn-11"></a></span>

</body>
<!-- scripts -->
<script type="text/javascript" src="js/api.js"></script>
<script type="text/javascript" src="js/index.js"></script>
<script type="text/javascript" src="js/lyricScroll.js"></script>
<script type="text/javascript" src="js/request.js"></script>
<script type="text/javascript" src="js/player.js"></script>
<script type="text/javascript" src="js/register.js"></script>
<script type="text/javascript" src="js/ykindex.js"></script>
</html>
