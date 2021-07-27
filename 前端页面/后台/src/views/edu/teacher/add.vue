<template>
  <div class="app-container">
    <h2 v-if="this.teacher.id"> {{ title2 }}</h2>
    <h2 v-else>{{ title1 }}</h2>
    <el-form label-width="120px">
      <el-form-item label="讲师名称">
        <el-input v-model="teacher.name"/>
      </el-form-item>
      <el-form-item label="讲师排序">
        <el-input-number v-model="teacher.sort" controls-position="right" min="0"/>
      </el-form-item>
      <el-form-item label="讲师头衔">
        <el-select v-model="teacher.level" clearable placeholder="请选择">
          <el-option :value="1" label="高级讲师"/>
          <el-option :value="2" label="首席讲师"/>
        </el-select>
      </el-form-item>
      <el-form-item label="讲师资历">
        <el-input v-model="teacher.career"/>
      </el-form-item>
      <el-form-item label="讲师简介">
        <el-input v-model="teacher.intro" :rows="10" type="textarea"/>
      </el-form-item>


      <!-- 讲师头像 -->
      <el-form-item label="讲师头像">

        <!-- 头衔缩略图 -->
        <pan-thumb :image="teacher.avatar"/>
        <!-- 文件上传按钮 -->
        <el-button type="primary" icon="el-icon-upload" @click="imagecropperShow=true">更换头像</el-button>
        <image-cropper
          v-show="imagecropperShow"
          :width="300"
          :height="300"
          :key="imagecropperKey"
          :url="BASE_API+'/eduoss/teacher/avatar'"
          field="file"
          @close="close"
          @crop-upload-success="cropSuccess"/>
      </el-form-item>

      <el-form-item>
        <el-button :disabled="saveBtnDisabled" type="primary" @click="addOrUpdate">保存</el-button>
      </el-form-item>
    </el-form>

  </div>
</template>
<script>
import teacher from '@/api/edu/teacher'
import ImageCropper from '@/components/ImageCropper'
import PanThumb from '@/components/PanThumb'

export default {
  components: { ImageCropper, PanThumb },
  data() {
    return {
      title1: '\xa0\xa0\xa0\xa0\xa0\xa0\xa0添加讲师',
      title2: '\xa0\xa0\xa0\xa0\xa0\xa0\xa0编辑讲师',
      teacher: {
        name: '',
        sort: 0,
        level: 1,
        career: '',
        intro: '',
        avatar: ''
      },

      // 头像上传部分
      saveBtnDisabled: false,  // 保存按钮是否禁用
      imagecropperShow: false, // 上传弹框组件是否显示
      imagecropperKey: 0, // 上传组件值
      BASE_API: process.env.BASE_API // 获取dev.env.js里面地址
    }
  },
  created() { //页面渲染之前执行
    this.init()
  },

  //路由变化，方法执行
  watch: {
    $route(to, from) {
      this.init()
    }
  },

  methods: {
    // 上传之后接口返回图片地址
    cropSuccess(data) {
      // 关弹框
      this.imagecropperShow = false
      // 头像地址赋值
      this.teacher.avatar = data.url
      // 组件初始化
      this.imagecropperKey = this.imagecropperKey + 1
    },

    close() {
      // 关闭上传头像弹框
      this.imagecropperShow = false
      // 组件初始化
      this.imagecropperKey = this.imagecropperKey + 1
    },

    init() {
      //判断路径有id值,做修改
      if (this.$route.params && this.$route.params.id) {
        //从路径获取id值
        const id = this.$route.params.id
        //调用根据id查询的方法
        this.getInfo(id)
      } else {
        //路径没有id值，做添加
        //清空表单
        this.teacher = {}
      }
    },
    //根据讲师id查询的方法
    getInfo(id) {
      teacher.getTeacherInfo(id)
        .then(response => {
          this.teacher = response.data.teacher
        })
    },
    addOrUpdate() {
      // 判断修改还是添加
      // 根据teacher是否有id
      if (!this.teacher.id) {
        //添加
        this.addTeacher()
      } else {
        //修改
        this.updateTeacher()
      }
    },
    //修改讲师的方法
    updateTeacher() {
      teacher.updateTeacherInfo(this.teacher)
        .then(response => {
          //提示信息
          this.$message({
            type: 'success',
            message: '修改成功!'
          })
          //路由跳转，注意格式！
          this.$router.push({ path: '/teacher/list' })
        })
    },

    isEmpty(obj) {
      if (typeof obj === "undefined" || obj === null || obj === "") {
        return true;
      } else {
        return false;
      }
    },
    checkForm(){
      if(this.isEmpty(this.teacher.name)){
        this.$message.warning("请输入讲师名称");
        return false;
      }
      if(this.isEmpty(this.teacher.sort)){
        this.$message.warning("请输入讲师排序");
        return false;
      }
      if(this.isEmpty(this.teacher.level)){
        this.$message.warning("请选择讲师头衔");
        return false;
      }
      if(this.isEmpty(this.teacher.career)){
        this.$message.warning("请输入讲师资历");
        return false;
      }
      if(this.isEmpty(this.teacher.intro)){
        this.$message.warning("请输入讲师简介");
        return false;
      }
      if(!this.teacher.id&&this.imagecropperKey===0){
        this.$message.warning("请上传讲师头像")
        return false
      }
      return true
    },
    //添加讲师的方法
    addTeacher() {
      if(!this.checkForm()) return;

      teacher.addTeacher(this.teacher)
        .then(response => {//添加成功
          //提示信息
          this.$message({
            type: 'success',
            message: '添加成功!'
          })
          //路由跳转，注意格式！
          this.$router.push({ path: '/teacher/list' })
        })
    }

  }
}
</script>
