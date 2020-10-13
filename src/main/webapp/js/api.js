$(function () {
    /*获取推荐歌单*/
    const tJplayList = function tJplayList() {
        requestAPI({
            url: urlT + "/homepage/block/page",
            data: {
                cookie: cookie
            },
            callback: function (data) {
                console.log(data);
            }
        })
    };

    /*收藏取消收藏歌单
    * type: 1:收藏,2:取消收藏 */
    function subscribePlayList(t,id) {
        requestAPI({
            "url":urlT+"/playlist/subscribe",
            "data":{
                t:t,
                id:id
            },
            callback:function (data) {

            }
        })
    }
    /*添加喜欢的音乐*/
    function addLikeSong(id) {
        requestAPI({
            "url":urlT+"/like?id="+id,
            callback:function () {

            }
        })
    }
    /*获取评论
    * type: 资源类型
    *       0: 歌曲  1: mv  2: 歌单  3: 专辑
    *       4: 电台 5: 视频  6: 动态
    *
    * sortType: 排序方式
    *       1:按推荐排序,2:按热度排序,3:按时间排序
    * */
    function getCommentNew(id,type,sortType) {
        requestAPI({
            "url":urlT+"/comment/new",
            data:{
                "Type":type,
                "id":id,
                sortType:sortType
            },
            callback:function (data) {

            }
        })
    }
    /*发送删除评论
    * type：0: 删除  1: 发送  2: 删除
    * */
    function sendDeleteComment(id,rid,type,) {
        requestAPI({
            "url":urlT+"/comment",
            data:{
                "Type":type,
                "id":id,
            },
            callback:function (data) {

            }
        })
    }

    /*获取用户每日推荐 */
    function refreshLogin() {
        requestAPI({
            url:urlT+"/recommend/resource",
            data:{
                cookie:cookie
            },
            callback:function (data) {
                intRdPlaylist(data);
            }
        });
    }
})