<%--
  Created by IntelliJ IDEA.
  User: 弦
  Date: 2020/10/6
  Time: 15:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="libs/jquery-3.1.1.min.js"></script>
</head>
<body>
<input type="text" name="searchText" value="山海">
<input id="btn" type="button" value="搜索">
<audio id="audio" src="" autoplay="autoplay" loop="loop" controls></audio>
<div id="div1">
</div>
</body>
</html>
<script type="text/javascript">
    function playMusic(path) {
        var audioEle = document.getElementById("audio");
        audioEle.src=path;
        audioEle.load();
        if (audioEle.paused){ /*如果已经暂停*/
            audioEle.play();   //播放
        }else {
            audioEle.pause();  //暂停
        }
    }
    function getMusicUrl(id) {
        if (!id) return;
        return `http://music.163.com/song/media/outer/url?id=${id}`;
    }


    $(function () {
        var musicURl;
        $('#btn').click(function () {
            $.ajax({
                "url":url+"/search?keywords="+$(':text').val()+"",
                "dataType":"json",
                "type":"post",
                "success":function(data){
                    alert(data);
                    var songs = data['result']['songs'];
                    var listLen = songs.length;
                    var listHtml = '';
                    for (var i = 0; i < listLen; i++) {
                        listHtml += `
							<tr data-index="`+ i + `"  data-id="` + songs[i]['id'] + `" data-song-name="` + songs[i]['name'] + `" data-duration="` + songs[i]['dt'] + `" data-audio="`+ getMusicUrl(songs[i]['id']) +`" data-album-name="` + songs[i]['al']['name'] + `" data-album-pic="` + songs[i]['al']['picUrl'] + `" data-singer-name="` + songs[i]['ar']['name'] + `">
								<td class="index" data-num="`+ ((+i + 1) < 10 ? "0" + (+i + 1) : (+i + 1)) + `">` + ((+i + 1) < 10 ? "0" + (+i + 1) : (+i + 1)) + `</td>
								<td><i class="fa fa-heart-o" aria-hidden="true"></i>&nbsp;
<i class="fa fa-download" aria-hidden="true"></i></td>
								<td>`+ songs[i]['name'] + `</td>
								<td>`+ songs[i]['ar']['name'] + `</td>
								<td>`+ songs[i]['al']['name'] + `</td>
								<td>`+ '--:--' + `</td>
							</tr>
						`;
                    }
                $('#div1').html(listHtml);
                    $('tr').css("backgroundColor","#4FD7C3");
                    $('tr').hover(function () {
                        $(this).css("backgroundColor","red");
                    },function () {
                        $(this).css("backgroundColor","#4FD7C3");
                    });
                    $('tr').on('dblclick',function(e){
                        //写双击事件要干的事
                        musicURl = $(this).attr("data-audio");
                        playMusic(musicURl);
                    });
                }
            });
        });
    });
</script>
