let urlT = "http://localhost:3000";
let cookie = null;
$(function () {
    $("#userMsg").click(function () {
        $(".back").fadeIn(800);
    });
    $(".log_close").click(function () {
        $(".back").fadeOut(800);
    });
    $(".register").hide();
    $(".fanghui").hide();

    $(".zhuche").click(function () {
        if ($(".checkbox").get(0).checked) {
            $(".zhuche").slideUp(500);
            $(".denlu").slideUp(500);
            $(".chk").slideUp(1000);
            $(".register").fadeIn(1000);
            $(".fanghui").slideDown(1000);
        } else {
            alert("请先勾选相关《契约》");
        }
    })
    $(".fanghui").click(function () {
        $(".register").slideUp(500);
        $(".fanghui").slideUp(500);
        $(".denlu").slideDown(1000);
        $(".chk").slideDown(1000);
        $(".zhuche").slideDown(1000);
    })
    $("#loginUser").click(function () {
        showLoadingBox(true);
        const user = $(":text[class=user]").val();
        const pwd = $(":password[class=password]").val();
        if (!(user.length === 11)) {
            showTipBox("error", "手机号不正确！");
            return;
        }
        if (pwd === "") {
            showTipBox("error", "请输入密码");
            return;
        }
        requestAPI({
            url: urlT + "/login/cellphone?",
            data: {
                "phone": user,
                "password": pwd
            },
            xhrFields: { withCredentials: true },
            callback: function (data) {
                if (!!(data['msg']) || !!(data['message'])) {
                    showTipBox("error", data['msg']);
                }
                $(".back").fadeOut(500);
                userMessger(data);
                refreshLogin();
                tJplayList();

            }
        });
    });

    $(".register").click(function () {
        showTipBox("info", "注册！");
    });
});

/*
	刷新当前登录状态并打印信息
* */
function logStatus() {
    requestAPI({
        url: urlT + "/login/refresh",
        callback: function (data) {
            if (!!data['msg']) {
                showTipBox("info", data['msg']);
            }
        }
    });
}

/*打印用户信息*/
function userMessger(data) {
    cookie = data['cookie'];
    var userinfo = data["profile"];
    var nickname = userinfo['nickname'],
        userid = userinfo['userId'],
        follows = userinfo['follows'],//关注数
        followeds = userinfo['followeds'],//粉丝数
        userImgUrl = userinfo['avatarUrl'], //头像
        userImgUrlID = userinfo['avatarImgId'], //头像id
        playlistCount = userinfo['playlistCount'];
    $("#nickname").attr("data_uID", userid);
    $("#nickname").attr("data_uImgID", userImgUrlID);
    $("#nickname").attr("data_playlistCount", playlistCount);
    $("#nickname").html(nickname);
    $("#user_avatar").attr("src", userImgUrl);
    userPlaylist();
}