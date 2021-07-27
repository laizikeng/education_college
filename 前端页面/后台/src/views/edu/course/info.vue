<template>

  <div class="app-container">

    <h2 style="text-align: center;">发布新课程</h2>

    <el-steps :active="1" process-status="wait" align-center style="margin-bottom: 40px;">
      <el-step title="填写课程基本信息"/>
      <el-step title="编辑课程大纲"/>
      <el-step title="发布"/>
    </el-steps>
    <el-form label-width="120px">

      <el-form-item label="课程标题">
        <el-input v-model="courseInfo.title" placeholder=" 示例：机器学习项目课：从基础到搭建项目视频课程。专业名称注意大小写"/>
      </el-form-item>

      <!-- 所属分类 -->
      <el-form-item label="课程分类">
        <!-- 一级分类 -->
        <el-select
          v-model="courseInfo.subjectParentId"
          placeholder="一级分类" @change="subjectLevelOneChanged"><!--该方式声明方法可以自动获取id-->


          <el-option
            v-for="subject in subjectOneList"
            :key="subject.id"
            :label="subject.title"
            :value="subject.id"/>

        </el-select>

        <!-- 二级分类 -->
        <el-select v-model="courseInfo.subjectId" placeholder="二级分类">
          <el-option
            v-for="subject in subjectTwoList"
            :key="subject.id"
            :label="subject.title"
            :value="subject.id"/>
        </el-select>
      </el-form-item>


      <!-- 课程讲师 -->
      <el-form-item label="课程讲师">
        <el-select
          v-model="courseInfo.teacherId"
          placeholder="请选择">
          <!--key保证唯一标识-->
          <el-option
            v-for="teacher in teacherList"
            :key="teacher.id"
            :label="teacher.name"
            :value="teacher.id"/>

        </el-select>
      </el-form-item>

      <el-form-item label="总课时">
        <el-input-number :min="1" :max="999" v-model="courseInfo.lessonNum" controls-position="right"
                         placeholder="请填写课程的总课时数"/>
      </el-form-item>

      <!-- 课程简介-->
      <el-form-item label="课程简介">
        <tinymce :height="300" v-model="courseInfo.description"/>
      </el-form-item>


      <!-- 课程封面-->
      <el-form-item label="课程封面">
        <el-upload
          :show-file-list="false"
          :on-success="handleAvatarSuccess"
          :before-upload="beforeAvatarUpload"
          :action="BASE_API+'/eduoss/course/cover'"
          class="avatar-uploader">
          <img :src="courseInfo.cover" width="400px" height="200px" title="默认封面，点击以更换封面" alt="网络有点问题~"/>
        </el-upload>

      </el-form-item>

      <el-form-item label="课程价格">
        <el-input-number v-model="courseInfo.price" :precision="2" :min="0" :step="1" :max="9999" size="medium" style="width: 240px" placeholder="请输入课程价格，免费课程为0元"/>
        元
      </el-form-item>

      <el-form-item>
        <el-button :disabled="saveBtnDisabled" type="primary" @click="addOrUpdate">保存并下一步</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>


<script>
import course from '@/api/edu/course'
import subject from '@/api/edu/subject'
import Tinymce from '@/components/Tinymce'
import {getInfo} from '../../../api/login'

export default {
  components: {Tinymce},
  data() {
    return {

      BASE_API: process.env.BASE_API,
      saveBtnDisabled: false,
      courseInfo: {
        title: '',
        subjectId: '',   // 一级id
        subjectParentId: '',  // 二级id
        teacherId: '',
        lessonNum: 0,
        description: '',
        cover: '/static/default-course-cover.jpg',
        price: ''
      },
      courseId: '',
      teacherList: [],
      subjectOneList: [],   // 此集合包含所有subject
      subjectTwoList: [],

      // courseInfo:{
      //   subjectId: '',
      //   teacherId: '',
      //   lessNum: '',
      //   description: '',
      //   cover: '',
      //   price: '',
      // }
    }
  },
  created() {
    if (this.$route.params && this.$route.params.id) {
      this.courseId = this.$route.params.id
      this.getInfo()
    } else {
      // 初始化一级分类
      this.getOneSubject()
    }
    // 初始化所有讲师
    this.getListTeacher()

  },
  methods: {
    // 回显方法
    getInfo() {
      course.getCourseInfo(this.courseId)
        .then(response => {
          this.courseInfo = response.data.courseInfoVo
          subject.getSubjectList()
            .then(response => {
              this.subjectOneList = response.data.list
              // 二级选项需手动赋值，因为直接写入一级分类值无法
              for (let i = 0; i < this.subjectOneList.length; i++) {
                var oneSubject = this.subjectOneList[i]
                if (this.courseInfo.subjectParentId === oneSubject.id) {
                  this.subjectTwoList = oneSubject.children
                  break
                }
              }
            })
        })
    },
    // 课程封面上传成功与上传之前执行的两个方法
    handleAvatarSuccess(response, file) {
      this.courseInfo.cover = response.data.url
      this.$message({
        type: "success",
        message: "上传图片成功",
      })
    },
    beforeAvatarUpload(file) {
      const isJPG = file.type === 'image/jpeg'
      const isPNG = file.type === 'image/png'
      const isLt10M = file.size < 10 * 1024 * 1024

      if (!isJPG && !isPNG) {
        this.$message.error('上传头像图片只能是 JPG 或 PNG 格式!')
      } else if (!isLt10M) {
        this.$message.error('上传头像图片大小不能超过 10MB!')
      } else {
        this.$message.info('图片上传中，请稍后')
      }


      return (isJPG || isPNG) && isLt10M
    },
    // 查询所有一级分类
    getOneSubject() {
      subject.getSubjectList()
        .then(response => {
          this.subjectOneList = response.data.list
        })
    },
    getTwoSubject() {

    },
    subjectLevelOneChanged(id) {
      this.courseInfo.subjectId = ''   // 清空旧二级分类
      for (let i = 0; i < this.subjectOneList.length; i++) {
        var oneSubject = this.subjectOneList[i]
        console.log(id + '/' + oneSubject.id)
        if (id === oneSubject.id) {
          this.subjectTwoList = oneSubject.children
          break
        }
      }
    },
    getListTeacher() {
      course.getListTeacher()
        .then(response => {
          this.teacherList = response.data.items
        })
    },
    addCourse() {
      course.addCourseInfo(this.courseInfo)
        .then(response => {
          // 提示
          this.$message({
            type: 'success',
            message: '添加课程信息成功！'
          })
          // 跳转
          this.$router.push({path: '/course/chapter/' + response.data.courseId})
        })
    },
    updateCourseInfo() {
      course.updateCourseInfo(this.courseInfo)
        .then(result => {
          this.$message({
            type: "success",
            message: "修改课程信息成功！",
          })

          this.$router.push({path: '/course/chapter/' + this.courseId})
        })
      return undefined;
    },

    checkForm() {
      if (this.isEmpty(this.courseInfo.title)) {
        this.$message.warning('请输入课程标题')
        return false
      }
      if (this.isEmpty(this.courseInfo.subjectId)) {
        this.$message.warning('请选择正确的课程分类')
        return false
      }
      if (this.isEmpty(this.courseInfo.teacherId)) {
        this.$message.warning('请选择讲师')
        return false
      }

      if (this.isEmpty(this.courseInfo.lessonNum)) {
        this.$message.warning('请输入课时数')
        return false
      }
      if (this.isEmpty(this.courseInfo.description)) {
        this.$message.warning('请输入课程描述')
        return false
      }
      if (this.isEmpty(this.courseInfo.cover)) {
        this.$message.warning('课程封面不能为空')
        return false
      }
      if (this.isEmpty(this.courseInfo.price) || this.courseInfo.price < 0 || !this.isNumber(this.courseInfo.price)) {
        this.$message.warning('请输入正确的课程价格')
        return false
      }
      return true;
    },
    addOrUpdate() {
      if (!this.checkForm()) return

      if (!this.courseId) {
        //添加
        this.addCourse()
      } else {
        //修改
        this.updateCourseInfo()
      }
    },

    isEmpty(obj) {
      if (typeof obj === "undefined" || obj === null || obj === "") {
        return true;
      } else {
        return false;
      }
    },

    isNumber(val) {
      var regPos = /^\d+(\.\d+)?$/; //非负浮点数
      var regNeg = /^(-(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*)))$/; //负浮点数
      if (regPos.test(val) || regNeg.test(val)) {
        return true;
      } else {
        return false;
      }
    }

  }
}
</script>
<style scoped>
.tinymce-container {
  line-height: 29px;
  width: 90%;
}
</style>
