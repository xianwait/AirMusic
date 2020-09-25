<%--
  Created by IntelliJ IDEA.
  User: 弦
  Date: 2020/9/8
  Time: 15:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <title>云音乐</title>
    <link rel="icon" type="image/ico" href="images/format.ico"/>
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/index.css"/>
    <script type="text/javascript" src="libs/jquery-3.1.1.min.js"></script>
</head>

<body onselectstart="return false">
<!-- page_list 页面左侧歌单 -->
<div class="page_list">
    <div class="list_container" id="listContainer">
        <div class="list list_recommend">
            <p class="title">推荐</p>
            <div class="btngroups">
                <p class="btn find"><i class="fa fa-music" aria-hidden="true"></i>&nbsp;&nbsp;发现音乐</p>
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
            <div class="btngroups">
                <p class="btn list_create_like active" id="list_create_like"><i class="fa fa-heart-o"
                                                                                aria-hidden="true"></i>&nbsp;&nbsp;我喜欢的音乐
                </p>
                <p class="btn list_create_001"><i class="fa fa-music" aria-hidden="true"></i>&nbsp;&nbsp;我的歌单02</p>
            </div>
        </div>
        <div class="list list_collect">
            <p class="title">收藏的歌单
                <span class="title_btngroups">
          <a href="javascript:void(0);" class="btn unfoldlist"><i class="fa fa-angle-down" aria-hidden="true"></i></a>
        </span>
            </p>
            <div class="btngroups">
                <p class="btn list_collect_id001"><i class="fa fa-music" aria-hidden="true"></i>&nbsp;&nbsp;当年烂大街的舞曲</p>
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
    <div class="menu_logo"><img src="images/netease-logo.png" alt=""></div>
    <div class="menu_btngroups">
        <a href="javascript:void(0);" class="btn backward"><i class="fa fa-angle-left" aria-hidden="true"></i></a>
        <!--
        --><a href="javascript:void(0);" class="btn forward"><i class="fa fa-angle-right" aria-hidden="true"></i></a>
    </div>
    <div class="menu_search">
        <input type="text" placeholder="探索音乐、歌手、歌词、用户" autofocus="" id="inpSearch" class="search_inp"/>
        <span class="search_btn" id="top_searchBtn"><i class="fa fa-search" aria-hidden="true"></i></span>
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
<!-- page_main 歌单：我喜欢的音乐 -->
<div class="page_main R_page" id="pageMain">
    <div class="main_container">
        <div class="listcontainer">
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
                        <span class="btn playall"><i class="fa fa-folder"
                                                     aria-hidden="true"></i>&nbsp;&nbsp;收藏(0)</span>
                        <span class="btn playall"><i class="fa fa-share-square-o" aria-hidden="true"></i>&nbsp;&nbsp;分享(0)</span>
                        <span class="btn playall"><i class="fa fa-download"
                                                     aria-hidden="true"></i>&nbsp;&nbsp;下载全部</span>
                    </div>
                </div>
            </div>
            <div class="listtab">
                <div class="tabbtns clearfix">
                    <label class="label_btn active" for="music" class="active">歌单列表</label>
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
                        </tfoot>
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
    <div class="g_blurbg" id="bgBlur" style="background-image:url('/images/al8.png');"></div>
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
						<span class="album">专辑：<span class="albumname">--ALBUMNAME--</span>
						</span>
                    <span class="singer">歌手：<span class="singersname">--ALBUMNAME--</span>
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
<!-- scripts -->
<script type="text/javascript" src="js/index.js"></script>
<script type="text/javascript" src="js/lyricScroll.js"></script>
<script type="text/javascript" src="js/request.js"></script>
<script type="text/javascript" src="js/player.js"></script>
</body>
</html>
