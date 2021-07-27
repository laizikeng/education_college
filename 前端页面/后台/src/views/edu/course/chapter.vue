<template>

  <div class="app-container">

    <h2 style="text-align: center;">发布新课程</h2>

    <el-steps :active="2" process-status="wait" align-center style="margin-bottom: 40px;">
      <el-step title="填写课程基本信息"/>
      <el-step title="创建课程大纲"/>
      <el-step title="发布"/>
    </el-steps>
    <el-button type="success" round @click="openChapterDialog();isAdd=true" style="float:right">添加章节</el-button>
    <ul class="chanpterList">
      <li
        v-for="chapter in chapterVideoList"
        :key="chapter.id">
        <p>
          {{ chapter.title }} <span style="opacity:0.5;margin-left:20px;color: #8b8b8b;font-style: italic">sort:{{chapter.sort}}</span>
          <span class="acts">
                    <el-button type="primary" size="small"  @click="openVideo(chapter.id)">添加小节</el-button>
                    <el-button type="warning" size="small"  @click="openEditChapter(chapter.id);isAdd=false">编辑</el-button>
                    <el-button type="danger"  size="small"   @click="removeChapter(chapter.id)">删除</el-button>
                </span>
        </p>

        <!-- 视频 -->
        <ul class="chanpterList videoList">
          <li
            v-for="video in chapter.children"
            :key="video.id">
            <p>{{ video.title }} <span style="opacity:0.5;margin-left:20px;color: #8b8b8b;font-style: italic">sort:{{video.sort}}</span>
              <span class="acts">
                    <el-button type="warning" size="mini" @click="openEditVideoDialog(video.id)">编辑</el-button>
                    <el-button type="danger"  size="mini" @click="removeVideo(video.id)">删除</el-button>
                </span>
            </p>
          </li>
        </ul>
      </li>
    </ul>

    <div style="float:left;margin-left: 40%;margin-top: 7%;margin-bottom: 4%">
      <el-button size="medium" @click="previous">上一步</el-button>
      <el-button size="medium" :disabled="saveBtnDisabled" type="primary" @click="next">下一步</el-button>
    </div>

    <!-- 添加和修改章节表单 -->
    <el-dialog :visible.sync="dialogChapterFormVisible" title="添加章节">
      <el-form :model="chapter" label-width="120px">
        <el-form-item label="章节标题">
          <el-input v-model="chapter.title"/>
        </el-form-item>
        <el-form-item label="章节排序">
          <el-input-number v-model="chapter.sort" :min="0" controls-position="right"/>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogChapterFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="addOrUpdate">确 定</el-button>
      </div>
    </el-dialog>

    <!-- 添加和修改小节表单 -->
    <el-dialog :visible.sync="dialogVideoFormVisible" title="添加课时">
      <el-form :model="subChapter" label-width="120px">
        <el-form-item label="课时标题">
          <el-input v-model="subChapter.title"/>
        </el-form-item>
        <el-form-item label="课时排序">
          <el-input-number v-model="subChapter.sort" :min="0" controls-position="right"/>
        </el-form-item>

        <el-form-item label="上传视频">
          <el-upload
            :on-preview="handleVodPreview"
            :on-success="handleVodUploadSuccess"
            :on-remove="handleVodRemove"
            :before-remove="beforeVodRemove"
            :on-exceed="handleUploadExceed"
            :file-list="this.fileList"
            :action="BASE_API+'/eduvod/uploadVideo'"
            :limit="1"
            class="upload-demo"
            >
            <el-button size="small" type="primary">上传视频</el-button>
            <el-tooltip placement="right-end">
              <div slot="content">最大支持1G，<br>
                支持3GP、ASF、AVI、DAT、DV、FLV、F4V、<br>
                GIF、M2T、M4V、MJ2、MJPEG、MKV、MOV、MP4、<br>
                MPE、MPG、MPEG、MTS、OGG、QT、RM、RMVB、<br>
                SWF、TS、VOB、WMV、WEBM 等视频格式上传
              </div>
              <i class="el-icon-question"/>
            </el-tooltip>
          </el-upload>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogVideoFormVisible = false">取 消</el-button>
        <el-button :disabled="saveVideoBtnDisabled" type="primary" @click="addOrUpdateVideo">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import chapter from '@/api/edu/chapter'
import video from '@/api/edu/video'
import course from '../../../api/edu/course'

export default {
  data() {
    return {
//=============================章节数据=================================
      saveBtnDisabled: false,
      courseId: '',
      chapterVideoList: [],
      dialogChapterFormVisible: false,
      chapter: {
        // 章节数据
        id: '',
        title: '',
        sort: 0,
        courseId: ''
      },
      isAdd: true,
//=============================小节数据=================================
      saveVideoBtnDisabled: false,
      dialogVideoFormVisible: false,


      isUploadVideo:false,
      subChapter: {
        id: '',
        title: '',
        sort: 0,
        videoSourceId: ''
      },
      fileList: [],
      BASE_API: process.env.BASE_API
    }
  },
  created() {
    // 从路由获取课程id
    if (this.$route.params && this.$route.params.id) {
      this.courseId = this.$route.params.id
      this.getChapterVideo(this.courseId)
    }
  },
  methods: {

    isEmpty(obj) {
      if (typeof obj === "undefined" || obj === null || obj === "") {
        return true;
      } else {
        return false;
      }
    },
//=============================小节方法=================================
    // 检查章节格式，成功后初始化表单
    checkAndInitChapterUpdate(){
      if(String(this.subChapter.title).length>50||this.isEmpty(this.subChapter.title)){
        this.$message.warning("课程标题必须在 1~50 个字符之间")
        return false
      }
      if(this.isEmpty(this.subChapter.sort)){
        this.$message.warning("请选择课程排序")
        return false
      }

      // 视频文件上传检查
      if(!this.isUploadVideo){
        this.$message.warning("每个课时必须上传视频。若已上传，请等待视频上传成功")
        return false
      }

      this.isUploadVideo = false; // 视频上传状态初始化
      return true;
    },

    // 选中上传视频但未上传之时的操作
    handleVodPreview(){
      this.$message.info("视频上传中，请稍后")
    },

    // 确认移除视频时的操作
    handleVodRemove() {

    },
    beforeVodRemove(file, fileList) {
      this.$message.warning("不允许删除视频，您可以删除小节再重新上传")
      return false
    },
    handleVodUploadSuccess(response, file, fileFList) {
      this.$message.success("视频上传成功")
      // 成功上传视频，不能初始化视频上传状态，因为对话框未关闭！
      this.isUploadVideo = true

      // 上传视频id赋值
      this.subChapter.videoSourceId = response.data.videoId
      // 上传视频名称赋值
      this.subChapter.videoOriginalName = file.name
    },
    handleUploadExceed() {
      this.$message.warning('每个小节只能有一个视频！')
    },

    updateVideo(id) {
      video.updateVideo(this.subChapter)
        .then(result => {
          // 关闭弹框 提示 刷新页面 清空数据
          this.dialogVideoFormVisible = false
          this.$message({
            type: 'success',
            message: '修改小节成功！'
          })
          this.getChapterVideo(this.courseId)
        })
    },
    removeVideo(id) {
      this.$confirm('此操作将删除章节, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {  //点击确定，执行then方法
        //调用删除的方法
        video.deleteVideo(id)
          .then(result => {
            this.$message({
              type: 'success',
              message: '删除成功!'
            })
            this.getChapterVideo(this.courseId)
          })
      }) //点击取消，执行ca

    },

    openEditVideoDialog(id) {
      this.isUploadVideo = true  // 如果能打开编辑框，则一定已经上传了视频，视频是不允许在这里删除的

      video.getVideoInfo(id)
        .then(result => {
          this.subChapter = result.data.video
          this.fileList = [{'name': this.subChapter.videoOriginalName}]
        })

      this.dialogVideoFormVisible = true

    },
    openVideo(chapterId) {
      this.subChapter = {}
      this.subChapter.sort = 0 // 不能赋空值
      this.fileList = []

      this.isUploadVideo = false
      // 设置小节的章节id(父id)
      this.subChapter.chapterId = chapterId

      // 打开对话框
      this.dialogVideoFormVisible = true
    },
    addVideo() {
      // 设置课程id
      this.subChapter.courseId = this.courseId
      video.addVideo(this.subChapter)
        .then(result => {
          //提示信息
          this.$message({
            type: 'success',
            message: '添加小节成功!'
          })
          //刷新页面
          this.getChapterVideo(this.courseId)
          this.dialogVideoFormVisible = false
        })
      this.subChapter.id = ''
    },
    addOrUpdateVideo() {
      if(!this.checkAndInitChapterUpdate()) return;

      if (this.subChapter.id) {
        this.updateVideo()
      } else {
        this.addVideo()
      }
    },
//=============================章节方法=================================
    removeChapter(id) {
      this.$confirm('此操作将删除章节和其下所有小节！ 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'error'
      }).then(() => {  //点击确定，执行then方法
        //调用删除的方法
        chapter.deleteChapter(id)
          .then(response => {//删除成功
            //提示信息
            this.$message({
              type: 'success',
              message: '删除成功!'
            })
            //刷新页面
            this.getChapterVideo(this.courseId)
          })
      }) //点击取消，执行catch方法
    },
    openEditChapter(id) {
      this.dialogChapterFormVisible = true
      chapter.getChapterInfo(id)
        .then(result => {
          this.chapter = result.data.chapter
        })
    },
    openChapterDialog() {
      this.subChapter = {}
      this.chapter.title = ''
      this.chapter.sort = ''
      this.dialogChapterFormVisible = true
    },
    updateChapter() {
      chapter.updateChapter(this.chapter)
        .then(result => {
          // 关闭弹框 提示 刷新页面 清空数据
          this.dialogChapterFormVisible = false
          this.$message({
            type: 'success',
            message: '修改章节成功！'
          })
          this.getChapterVideo(this.courseId)
        })
    },
    checkChapterForm(){
      if(this.isEmpty(this.chapter.title)||this.isEmpty(this.chapter.sort)){
        this.$message.warning("请输入正确的章节信息");
        return false;
      }
      return true
    },
    addOrUpdate() {
      if(!this.checkChapterForm())return;
      if (this.isAdd) {
        this.addChapter()
      } else {
        this.updateChapter()
      }
    },
    addChapter() {
      this.chapter.courseId = this.courseId
      this.chapter.id = ''
      chapter.addChapter(this.chapter)
        .then(result => {
          // 关闭弹框 提示 刷新页面 清空数据
          this.dialogChapterFormVisible = false
          this.$message({
            type: 'success',
            message: '添加章节成功！'
          })
          this.getChapterVideo(this.courseId)
        })
    },
    // 根据课程id查询章节和小节
    getChapterVideo(id) {
      chapter.getChapterVideoList(id)
        .then(response => {
          this.chapterVideoList = response.data.chapterVideoList
        })
    },
    previous() {
      this.$router.push({ path: '/course/info/' + this.courseId })
    },
    next() {
      this.$router.push({ path: '/course/publish/' + this.courseId })
    }
  }
}
</script>

<style scoped>
.chanpterList {
  position: relative;
  list-style: none;
  margin: 0;
  padding: 0;
}

.chanpterList li {
  position: relative;
}

.chanpterList p {
  float: left;
  font-size: 20px;
  margin: 10px 0;
  padding: 10px;
  height: 70px;
  line-height: 50px;
  width: 100%;
  border: 1px solid #DDD;
}

.chanpterList .acts {
  float: right;
  font-size: 14px;
}

.videoList {
  padding-left: 50px;
}

.videoList p {
  float: left;
  font-size: 14px;
  margin: 10px 0;
  padding: 10px;
  height: 50px;
  line-height: 30px;
  width: 100%;
  border: 1px dotted #DDD;
}

</style>
