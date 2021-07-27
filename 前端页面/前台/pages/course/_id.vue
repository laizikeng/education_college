<template>
  <div id="aCoursesList" class="bg-fa of">
    <!-- /课程详情 开始 -->
    <section class="container">
      <section class="path-wrap txtOf hLh30">
        <a href="#" title class="c-999 fsize14">首页</a>
        \
        <a href="#" title class="c-999 fsize14">{{ courseWebVo.subjectLevelOne }}</a>
        \
        <span class="c-333 fsize14">{{ courseWebVo.subjectLevelTwo }}</span>
      </section>
      <div>
        <article class="c-v-pic-wrap" style="height: 357px;">
          <section class="p-h-video-box" id="videoPlay">
            <img :src="courseWebVo.cover" :alt="courseWebVo.subjectLevelTwo" class="dis c-v-pic" style="height: 357px">
          </section>
        </article>
        <aside class="c-attr-wrap">
          <section class="ml20 mr15">
            <h2 class="hLh30 txtOf mt15">
              <span class="c-fff fsize24">{{ courseWebVo.title }}</span>
            </h2>
            <section class="c-attr-jg">
              <span class="c-fff">价格：</span>
              <b class="c-yellow" style="font-size:24px;">￥{{ courseWebVo.price }}</b>
            </section>
            <section class="c-attr-mt c-attr-undis">
              <span class="c-fff fsize14">主讲： {{ courseWebVo.teacherName }}&nbsp;&nbsp;&nbsp;</span>
            </section>
            <section class="c-attr-mt of">
              <span class="ml10 vam">
                <em class="icon18 scIcon"></em>
                <a class="c-fff vam" title="收藏" href="#">收藏</a>
              </span>
            </section>
            <section class="c-attr-mt" v-if="(Number(courseWebVo.price)==0||isBuy)&&isOpen">
              <a href="#" title="立即观看" class="comm-btn c-btn-3" @click="watchVideo()">立即观看</a>
            </section>
            <section class="c-attr-mt" v-if="(Number(courseWebVo.price)!=0&&!isBuy)&&isOpen">
              <a href="#" title="立即购买" class="comm-btn c-btn-3" @click="createOrder()">立即购买</a>
            </section>
            <section class="c-attr-mt" v-if="!isOpen">
              <a href="#" title="暂未开放" class="comm-btn c-btn-3" disabled>暂未开放</a>
            </section>
          </section>
        </aside>
        <aside class="thr-attr-box">
          <ol class="thr-attr-ol clearfix">
            <li>
              <p>&nbsp;</p>
              <aside>
                <span class="c-fff f-fM">购买数</span>
                <br>
                <h6 class="c-fff f-fM mt10">{{ courseWebVo.viewCount }}</h6>
              </aside>
            </li>
            <li>
              <p>&nbsp;</p>
              <aside>
                <span class="c-fff f-fM">课时数</span>
                <br>
                <h6 class="c-fff f-fM mt10">{{ courseWebVo.lessonNum }}</h6>
              </aside>
            </li>
            <li>
              <p>&nbsp;</p>
              <aside>
                <span class="c-fff f-fM">浏览数</span>
                <br>
                <h6 class="c-fff f-fM mt10">{{ courseWebVo.buyCount }}</h6>
              </aside>
            </li>
          </ol>
        </aside>
        <div class="clear"></div>
      </div>
      <!-- /课程封面介绍 -->
      <div class="mt20 c-infor-box">
        <article class="fl col-7">
          <section class="mr30">
            <div class="i-box">
              <div>
                <section id="c-i-tabTitle" class="c-infor-tabTitle c-tab-title">
                  <a name="c-i" class="current" title="课程详情">课程详情</a>
                </section>
              </div>
              <article class="ml10 mr10 pt20">
                <div>
                  <h6 class="c-i-content c-infor-title">
                    <span>课程介绍</span>
                  </h6>
                  <div class="course-txt-body-wrap">
                    <section class="course-txt-body">
                      <p v-html="courseWebVo.description"></p>
                    </section>
                  </div>
                </div>
                <!-- 课程介绍 -->
                <div class="mt50">
                  <h6 class="c-g-content c-infor-title">
                    <span>课程大纲</span>
                  </h6>
                  <section class="mt20">
                    <div class="lh-menu-wrap">
                      <menu id="lh-menu" class="lh-menu mt10 mr10">
                        <ul>
                          <!-- 文件目录 -->
                          <li class="lh-menu-stair" v-for="chapter in chapterVideoList" :key="chapter.id">
                            <a href="javascript: void(0)" :title="chapter.title" class="current-1">
                              <em class="lh-menu-i-1 icon18 mr10"></em>{{ chapter.title }}
                            </a>
                            <ol class="lh-menu-ol" style="display: block;">
                              <li class="lh-menu-second ml30" v-for="video in chapter.children" :key="video.id">

                                <a href="#" title  @click.prevent="toPlayer(video.videoSourceId)">
                                  <span class="fr">
                                    <i class="free-icon vam mr10">免费试听</i>
                                  </span>
                                  <em class="lh-menu-i-2 icon16 mr5">&nbsp;</em>{{ video.title }}
                                </a>
                              </li>
                            </ol>
                          </li>
                        </ul>
                      </menu>
                    </div>
                  </section>
                </div>
                <!-- /课程大纲 -->
              </article>
            </div>
          </section>
        </article>
        <aside class="fl col-3">
          <div class="i-box">
            <div>
              <section class="c-infor-tabTitle c-tab-title">
                <a title href="javascript:void(0)">主讲讲师</a>
              </section>
              <section class="stud-act-list">
                <ul style="height: auto;">
                  <li>
                    <div class="u-face">
                      <a :href="'/teacher/'+courseWebVo.teacherId">
                        <img :src="courseWebVo.avatar" width="50" height="50" alt>
                      </a>
                    </div>
                    <section class="hLh30 txtOf">
                      <a class="c-333 fsize16 fl" :href="'/teacher/'+courseWebVo.teacherId">{{ courseWebVo.teacherName }}</a>
                    </section>
                    <section class="hLh20 txtOf">
                      <span class="c-999">{{ courseWebVo.intro }}</span>
                    </section>
                  </li>
                </ul>
              </section>
            </div>
          </div>
        </aside>
        <div class="clear"></div>
      </div>
    </section>
    <br>
    <!-- /课程详情 结束 -->


    <!-- 评论区开始 -->
    <el-card class="box-card" style="width: 80%;align-content: center;margin-left: 10%">
      <div>
        <span>
          <el-input v-model="commentVo.content" style=";align-content: center;width: 90%"
                    type="textarea"
                    :rows="2"
                    placeholder="发表您的评论"
          />
          <el-button type="primary" @click="commitComment()">发表评论</el-button>
        </span>
      </div>

      <div v-if="total==0">
        <br><br>
        <p align="center">暂无评论呦~~~</p>
        <br><br>
      </div>

      <div v-if="total!=0">
        <section class="stud-act-list">
          <ul style="height: auto;" v-for="comment in commentList" :key="comment.id">
            <li>
              <div class="u-face">
                <a href="#">
                  <img :src="comment.avatar" width="50" height="50" alt>
                </a>
              </div>
              <section class="hLh30 txtOf">
                <a class="c-999" href="#">{{ comment.nickname }}</a>
              </section>
              <section class="hLh20 txtOf">
                <span class="c-333 fsize16 fl">{{ comment.content }}</span>
              </section>
            </li>
          </ul>
        </section>
        <!-- 分页 -->
        <el-pagination
          :current-page="this.current"
          :page-size="this.limit"
          :total="this.total"
          style="padding: 30px 0; text-align: center;"
          layout="total, prev, pager, next, jumper"
          @current-change="getCommentInfo"
        />
      </div>
    </el-card>
    <!-- 评论区结束 -->
  </div>
</template>
<script>
import courseApi from '@/api/course'
import commentApi from '@/api/comment'
import orderApi from '@/api/order'
import cookie from 'js-cookie';

export default {
  data() {
    return {
      current: 1, // 当前页
      total: '',
      limit: 5,
      chapterVideoList: [],


      courseId: '',
      commentVo: {
        courseId: '',
        teacherId: '',
        content: '',
      },
      commentList: {},

      courseWebVo: {},
      isBuy: false,

      isOpen:'',  // 课程是否具有可以上线的条件（有至少一个视频。。。）
      introSourcePlayerId:'',
    }
  },
  created() {
    this.initCourseInfo();
  },
  methods: {
    toPlayer(videoSourceId){
      if(this.isBuy||this.courseWebVo.price===0){
        window.open('/player/'+videoSourceId,'_blank') ;
      }else{
        this.$message.warning("请先购买课程");
      }
    },
    watchVideo(){
      if(this.isOpen){
        window.open('/player/'+ this.introSourcePlayerId,'_blank') ;
      }else{
        this.$message({
          type: "warning",
          message: "对不起，该课程暂未开放",
        })
      }

    },
    // 查询课程详情信息
    initCourseInfo() {
      this.courseId = this.$route.params.id;
      this.commentVo.courseId = this.$route.params.id;
      this.commentVo.teacherId = this.courseWebVo.teacherId;

      courseApi.getCourseInfo(this.courseId).then(response => {
        this.courseWebVo = response.data.data.courseWebVo
        this.chapterVideoList = response.data.data.chapterVideoList
        this.introSourcePlayerId = response.data.data.chapterVideoList[0].children[0].videoSourceId

        this.isOpen = response.data.data.chapterVideoList.length>0
        this.isBuy = response.data.data.isBuy
      });

      this.getCommentInfo();
    },

    // 生成订单
    createOrder() {
      if(!cookie.get("guli_token")){
        this.$message({
          type: "error",
          message: "请先登录",
        });
        window.setTimeout("window.location='/login'", 1000)
        return
      }
      orderApi.createOrder(this.courseId).then(response => {
        // 获取返回订单号,跳转页面
        this.$router.push({path: '/order/' + response.data.data.orderNo})
      })
    },

    getCommentInfo(current = 1) {
      this.current = current
      commentApi.getCommentList(this.current, this.limit, this.courseId).then(response => {
        this.commentList = response.data.data.list;
        this.total = response.data.data.total;
      })
    },
    commitComment() {
      commentApi.addComment(this.commentVo).then(response => {
        if (response.data.success) {
          this.$message({
            type: "success",
            message: "发表成功",
          })
          this.commentVo.content = '';
          this.getCommentInfo();
        } else {
          this.$message({
            type: "error",
            message: "请先登录",
          });
          window.setTimeout("window.location='/login'", 1500)
        }
      })
    },

  }
};
</script>
