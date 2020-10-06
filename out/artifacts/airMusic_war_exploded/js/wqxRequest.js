function playMusic(path) {
    var audioEle = document.getElementById("audio");
    audioEle.src = path;
    audioEle.load();
    if (audioEle.paused) { /*如果已经暂停*/
        audioEle.play();   //播放
    } else {
        audioEle.pause();  //暂停
    }
}

function getMusicUrl(id) {
    if (!id) return;
    return `http://music.163.com/song/media/outer/url?id=${id}`;
}

let url = 'http://localhost:3000';
$(function () {
    var str = $('#inpSearch').val();
    var musicURl;

    function searchRequest(str) {
        if (!str) {
            showTipBox("error", "不能为空哟！");
        } else if (str === sessionStorage.getItem("searchString")) {
            // 避免重复请求
            showTipBox("error", "重复请求了！");
        } else {
            console.log("res-200 " + str);
            showLoadingBox(true);
            $.ajax({
                "url": url + "/cloudsearch?keywords=" + str + "&limit=100",
                "dataType": "json",
                "type": "post",
                "success": function (data) {
                    showLoadingBox(false);
                    if (!data.result) {
                        showTipBox("error", "查无此曲！"); // 查无此歌
                    } else {
                        console.log(data);
                        // render DOM
                        var songs = data['result']['songs'];
                        var listLen = songs.length;
                        var listHtml = '';
                        for (var i = 0; i < listLen; i++) {
                            listHtml += `
						<tr data-index="` + i + `"  data-id="` + songs[i]['id'] + `" data-song-name="` + songs[i]['name'] + `" data-duration="` + songs[i]['dt'] + `" data-audio="` + getMusicUrl(songs[i]['id']) + `" data-album-name="` + songs[i]['al']['name'] + `" data-album-pic="` + songs[i]['al']['picUrl'] + `" data-singer-name="` + songs[i]['ar']['name'] + `">
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
                        $('tr').on('dblclick', function (e) {
                            //写双击事件要干的事
                            musicURl = $(this).attr("data-audio");
                            playMusic(musicURl);
                        });
                    }
                }
            });
        }
    }

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
    var funcSearch = function () {
        var strSearch = $("#inpSearch").val().trim();
        // 显示搜索页 隐藏列表页
        $("#pageMain").slideUp(300);
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

    // 切换歌单与搜索页
    $("#list_create_like").on("click", function () {
        // 显示列表页 隐藏搜索页
        $("#pageSearch").slideUp(500);
        $("#pageMain").slideDown(500);
    });
});