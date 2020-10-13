/**
 * Theme: music player data request
 * Dependence: jQuery
 *
 */

function getMusicUrl(id) {
    if (!id) return;
    return `http://music.163.com/song/media/outer/url?id=${id}`;
}

// 切换歌单与搜索页
function listSearch() {
    $("#pageSearch").slideUp(500);
    $("#FoundThatMusic").slideUp(500);
    $("#pageMain").slideDown(500);
}

function showFoundThatMusic() {
    $("#pageSearch").slideUp(500);
    $("#pageMain").slideUp(500);
    $("#FoundThatMusic").slideDown(500);
}

function showPlayList() {
    $("#pageSearch").slideUp(500);
    $("#FoundThatMusic").slideUp(500);
    $("#pageMain").slideDown(500);
}

// create jsonp
function createJsonp(reqdata) {
    $.ajax({
        url: reqdata.url,
        data: reqdata.data,
        dataType: "jsonp",
        jsonp: "callback",
        success: function (res) {
            reqdata.callback(res);
        },
        error: function (err) {
            console.warn(err.status);
        }
    });
}

//  请求API (PHP) GET
function requestAPI(req) {
    $.ajax({
        url: req.url,
        type: req.method || "get",
        data: req.data,
        dataType: "json",
        success: function (res) {
            req.callback(res);
        },
        error: function (err) {
            console.warn(err.status);
        }
    });
}

let url = 'http://localhost:3000';

// 搜索请求数据
function searchRequest(str) {
    // 搜索内容非空判断
    if (!str) {
        showTipBox("error", "不能为空哟！");
    } else if (str === sessionStorage.getItem("searchString")) {
        // 避免重复请求
        showTipBox("error", "重复请求了！");
    } else {
        console.log("res-200 " + str);
        showLoadingBox(true);
        // jsonp
        $.ajax({
            "url": url + "/cloudsearch?keywords=" + str + "",
            "dataType": "json",
            "type": "post",
            "success": function (data) {
                showLoadingBox(false);
                if (!data.result) {
                    showTipBox("error", "查无此曲！"); // 查无此歌
                } else {
                    console.log(data);
                    // render DOM
                    var songs = data.result.songs;
                    var listLen = songs.length;
                    var listHtml = '';
                    for (var i = 0; i < listLen; i++) {
                        listHtml += `
							<tr data-index="` + i + `"  data-id="` + songs[i]['id'] + `" data-song-name="` + songs[i]['name'] + `" data-duration="` + songs[i]['duration'] + `" data-audio="` + getMusicUrl(songs[i]['id']) + `" data-album-name="` + songs[i]['al']['name'] + `" data-album-pic="` + songs[i]['al']['picUrl'] + `" data-singer-name="` + songs[i]['ar'][0]['name'] + `">
								<td class="index" data-num="` + ((+i + 1) < 10 ? "0" + (+i + 1) : (+i + 1)) + `">` + ((+i + 1) < 10 ? "0" + (+i + 1) : (+i + 1)) + `</td>
								<td><i class="fa fa-heart-o" aria-hidden="true"></i>&nbsp;
<i class="fa fa-download" aria-hidden="true"></i></td>
								<td>` + songs[i]['name'] + `</td>
								<td>` + songs[i]['ar'][0]['name'] + `</td>
								<td>` + songs[i]['al']['name'] + `</td>
								<td>` + '--:--' + `</td>
							</tr>
						`;
                    }
                    // refreshDOM
                    $("#infoList_search").html(listHtml);
                    // render search count
                    $("#search_count").find(".input").html(str);
                    $("#search_count").find(".count").html(data.result.songCount);
                }
            }
        });
    }
    sessionStorage.setItem("searchString", str);
}

// 刷新DOM tbody
function refreshDOM(songLen) {
    var tr = $("#infoList_playlist").find("tr").get(0), // 歌单列表第一行
        media = $("#audio").get(0), // 音频audio对象
        $songDetail = $("#songDetail"); // 歌曲详情页信息
    // 更新数据 歌曲数量
    sessionStorage.setItem("songLen", songLen);
    // 初始化播放资源
  // $(media).attr("src", tr.dataset.audio);
    // 暂停播放
   // media.pause();
    // 初始化播放时长
    $("#audio_duration").html(tr.dataset.durationFormat);
    // 高亮第一行
    $(tr).eq(0).find("td.index").html('<i class="fa fa-volume-up" aria-hidden="true"></i>').addClass("active");
    // 刷新小窗歌曲信息
  //  $("#smallwindow_albumPic").attr("src", tr.dataset.albumPic);
    // 刷新小窗专辑封面
   // $("#smallwindow_songName").html(tr.dataset.songName);
  //  $("#smallwindow_singerName").html(tr.dataset.singerName);
    // 储存当前歌曲必要信息
    sessionStorage.setItem("curPlayInfo_songID", tr.dataset.id);
    sessionStorage.setItem("curPlayInfo_songName", tr.dataset.songName);
    sessionStorage.setItem("curPlayInfo_singersName", tr.dataset.singerName);
    sessionStorage.setItem("curPlayInfo_albumName", tr.dataset.albumName);
    sessionStorage.setItem("curPlayInfo_albumPic", tr.dataset.albumPic);
    sessionStorage.setItem("curPlayInfo_audioSrc", tr.dataset.audio);

    // 刷新歌曲详情页bg和poster
    $("#bgBlur").css({
        "backgroundImage": 'url("' + sessionStorage.getItem('curPlayInfo_albumPic') + '")'
    });
    $("#bgDisc").css({
        "backgroundImage": 'url("' + sessionStorage.getItem('curPlayInfo_albumPic') + '")'
    });

    // 刷新歌曲基本信息
    $songDetail.find(".songname").html(sessionStorage.getItem('curPlayInfo_songName'));
    $songDetail.find(".albumname").html(sessionStorage.getItem('curPlayInfo_singersName'));
    $songDetail.find(".singersname").html(sessionStorage.getItem('curPlayInfo_albumName'));

    // 生成歌词
    createScrollLrc();

}

// 生产滚动歌词
function createScrollLrc() {
    // 获取歌词
    var songID = sessionStorage.getItem("curPlayInfo_songID");
    // 避免重复请求
    if (!sessionStorage.getItem("lyric-" + songID)) {
        // 请求歌词信息
        requestAPI({
            url: "http://localhost:3000/lyric",
            data: {
                'id': songID,
                'cookie': cookie
            },
            callback: function (data) {
                console.log(data.nolyric);
                // 判断是否有歌词
                if (!data.nolyric) {
                    // 储存歌词
                    sessionStorage.setItem("lyric-" + songID, data.lrc.lyric);
                    // 生成滚动歌词
                    mainLrcScroll({
                        "jQ_lrcContainer": $("#lrcContainer"),
                        "jQ_lrcBox": $("#lrcBox"),
                        "jQ_audio": $("#audio"),
                        "str": data.lrc.lyric,
                    });
                    console.log("网络歌词");
                } else {
                    $("#lrcBox").html("<p>暂无歌词</p>");
                    console.log("暂无歌词");
                }
            }
        });
    } else {
        mainLrcScroll({
            "jQ_lrcContainer": $("#lrcContainer"),
            "jQ_lrcBox": $("#lrcBox"),
            "jQ_audio": $("#audio"),
            "str": sessionStorage.getItem("lyric-" + songID),
        });
        console.log("本地歌词");
    }
}

// 初始化歌单数据
function initPlaylist(data) {
    var docFrag = document.createDocumentFragment(),
        playlist = data['playlist'],
        tracks = playlist['tracks'],
        songLen = tracks.length,
        tr = null,
        td = null,
        timeObj = {},
        createTime = "",
        singerArr = [],
        allSinger = "",
        subscribedCount = 0;
    // 清空
    $("#infoList_playlist").html(' ');
    // 生产歌单列表
    for (var i = 0; i < songLen; i++) {
        // ms->s /1000  格式化时间 00:00
        timeObj = formatTime(tracks[i]['dt'] / 1000);
        // 多个歌手名字组合
        for (var j = 0; j < tracks[i]['ar'].length; j++) {
            singerArr.push(tracks[i]['ar'][j]['name']);
        }
        allSinger = singerArr.join(" / ");
        // 清除
        singerArr = [];
        // 创建tr 设置tr
        tr = document.createElement("tr");
        tr.dataset.index = i;
        tr.dataset.id = tracks[i]['id'];
        tr.dataset.songName = tracks[i]['name'];
        tr.dataset.duration = tracks[i]['dt'];
        tr.dataset.durationFormat = timeObj.I + ":" + timeObj.S;
        tr.dataset.audio = tracks[i]['mp3Url'] || getMusicUrl(tracks[i]['id']);
        tr.dataset.singerName = allSinger;
        tr.dataset.albumName = tracks[i]['al']['name'];
        tr.dataset.albumPic = tracks[i]['al']['picUrl'];
        tr.innerHTML = `
			<td class="index" data-num="` + ((+i + 1) < 10 ? "0" + (+i + 1) : (+i + 1)) + `">` + ((+i + 1) < 10 ? "0" + (+i + 1) : (+i + 1)) + `</td>
			<td><i class="fa fa-heart-o" aria-hidden="true"></i>&nbsp;
<i class="fa fa-download" aria-hidden="true"></i></td>
			<td>` + tracks[i]['name'] + `</td>
			<td>` + allSinger + `</td>
			<td>` + tracks[i]['al']['name'] + `</td>
			<td>` + timeObj.I + `:` + timeObj.S + `</td>
		`;
        docFrag.appendChild(tr);
    }
    debugger
    // 重新渲染DOM
    $("#infoList_playlist").append(docFrag);
    // 生成歌单的基本信息
    createTime = formatDate(playlist.createTime);
    $("#playlist_listPic").attr("src", playlist.coverImgUrl);
    $("#playlist_listName").html(playlist.name);
    $("#playlist_userFace").attr("src", playlist.creator.avatarUrl);
    $("#playlist_userName").html(playlist.creator.nickname);
    $("#playlist_createTime").html(createTime.Y + "-" + createTime.M + "-" + createTime.D);
    $("#playlist_trackCount").html(playlist.trackCount);
    $("#playlist_playCount").html(playlist.playCount);
    debugger
    if (playlist['subscribed']){
        $('#scCount').html("已收藏("+ playlist['subscribedCount'] +")").attr("data-type",2);

    }else{
        $('#scCount').html("收藏("+ playlist['subscribedCount'] +")").attr("data-type",1);
    }
    $('#fxCount').html("分享("+ playlist['shareCount'] +")");
    /* ==================== REFRESH DOM =============================== */
   // refreshDOM(songLen);
}

// init
$(function () {
    // 搜索歌曲功能函数
    var funcSearch = function () {
        var strSearch = $("#inpSearch").val().trim();
        // 显示搜索页 隐藏列表页
        $("#pageMain").slideUp(300);
        $('#FoundThatMusic').slideUp(300);
        $("#pageSearch").slideDown(300);
        // 缩放歌曲详情页
        $("#pageSongDetail").css({
            "top": "100%",
            "right": "100%",
            "opacity": 0
        });
        // 请求数据
        searchRequest(strSearch);
    };

    // ===============初始化========================

    // 初始化歌单 我喜欢的音乐
    // showLoadingBox(false);

    // ===============搜索功能========================

    // 顶部菜单input回车搜索
    $("#inpSearch").on("keydown", function (ev) {
        var ev = ev || window.event;
        if (ev.keyCode === 13) {
            funcSearch();
        }
    });
    // 顶部菜单query图标点击搜索
    $("#top_searchBtn").on("click", function () {
        funcSearch();
    });

    // ===============歌单功能========================

    // ===============歌曲详情页========================

    // 展开与缩放歌曲详情页
    $("#btnExpandPlayBox").on("click", function () {
        // style: 展开歌曲详情页
        $("#pageSongDetail").css({
            "top": "60px",
            "right": 0,
            "opacity": 1
        });
    });
    $("#btnCompressPlayBox").on("click", function () {
        // style: 缩放歌曲详情页
        $("#pageSongDetail").css({
            "top": "100%",
            "right": "100%",
            "opacity": 0
        });
    });

});

function inilikePlaylist(id) {
    showLoadingBox(true);
    requestAPI({
        url: "http://localhost:3000/playlist/detail?",
        data: {
            "id": id,
            "limit": 100,
            cookie: cookie
        },
        callback: function (data) {
            initPlaylist(data);
            showLoadingBox(false);
        }
    });
}

function userPlaylist() {
    requestAPI({
        url: url + "/user/playlist?",
        data: {
            "uid": $('#nickname').attr("data_uid"),
            "limit": 100,
            "cookie": cookie,
        },
        xhrFields: {withCredentials: true},
        callback: function (data) {
            var playlist = data['playlist'],
                playlistLen = playlist.length,
                plName = '',
                plID = '',
                p = null,
                classText = '',
                $mylike = $('#list_create_like'),
                $mylist = $('#myPlayList'),
                $collPlaylists = $('#collPlaylists');
            //清空自己和订阅的歌单
            $collPlaylists.html('');
            $mylist.html('');

            //加载新请求的歌单
            $mylist.append("<p class=\"btn list_create_like active\" id=\"list_create_like\" data_pID='" + playlist[0]['id'] + "'>" +
                "<i class=\"fa fa-heart-o\" aria-hidden=\"true\">" +
                "</i> &nbsp;" + playlist[0]["name"] + "</p>");
            for (let i = 1; i < playlistLen; i++) {
                if (playlist[i]['userId'] != $('#nickname').attr("data_uid")) {
                    classText = 'list_collect_id001';
                } else {
                    classText = 'list_create_001';
                }
                p = "<p class=\"btn " + classText + "\" data_pid='" + playlist[i]['id'] + "'>" +
                    "<i class=\"fa fa-music\" aria-hidden=\"true\">" +
                    "</i>&nbsp;&nbsp;" + playlist[i]['name'] + "" +
                    "</p>";
                if (classText === "list_create_001") {
                    $mylist.append(p);
                } else if (classText === "list_collect_id001") {
                    $collPlaylists.append(p);
                }
            }

            $("#myPlayList>p,#collPlaylists>p,#rdPlayList>li").on("click", function () {
                console.log($(this));
                var id = $(this).attr("data_pid");
                listSearch();
                inilikePlaylist(id);
            });
            showLoadingBox(false);
        }

    });
}

function intRdPlaylist(data) {
    debugger
    var recommend = data['recommend'], li,
        $rdPlayList = $('#rdPlayList');
    $rdPlayList.html('');
    for (let i = 0; i < recommend.length; i++) {
        li = "<li data-res-id='" + recommend[i]['id'] + "'\n" +
            "                    <div class=\"u-cover u-cover-1\">\n" +
            "                            <img src=\"" + recommend[i]['picUrl'] + "\">\n" +
            "                            <div class=\"bottom\">\n" +
            "                                <a class=\"icon-play f-fr\" title=\"播放\" href=\"javascript:;\" data-res-type=\"17\"\n" +
            "                                   data-res-id=\"2069633659\"\n" +
            "                                   data-res-action=\"play\"></a>\n" +
            "                                <span class=\"icon-headset\"></span>\n" +
            "                                <span class=\"nb\">" + recommend[i]['playcount'] + "次</span>\n" +
            "                            </div>\n" +
            "                        </div>\n" +
            "                        <p class=\"dec\">\n" +
            "                           <a title=\"" + recommend[i]['name'] + "\" href=\"#\" class=\"msk\"\n" +
            "                               data-res-id=\"" + recommend[i]['id'] + "\" data-res-type=\"" + recommend[i]['type'] + "\"\n" +
            "                               data-res-action=\"log\"\n" +
            "                               data-res-data=\"recommendclick|5|featured|user-playlist\">" +
            "                               " + recommend[i]['name'] + " " +
            "                           </a>\n" +
            "                        </p>\n" +
            "                    </li>"
        $rdPlayList.append(li);
    }
    $("#rdPlayList>li").on("click", function () {
        debugger
        console.log($(this));
        var id = $(this).attr("data-res-id");
        listSearch();
        inilikePlaylist(id);
    });
}

// ==============EXPORT=====================

// export
window.requestAPI = requestAPI;