<template>
  <div class="app-container">
    <el-form label-width="120px">
      <el-form-item label="信息描述">
        <el-tag type="info">excel模版说明</el-tag>
        <el-tag>
          <i class="el-icon-download"/>
          <a :href="'/static/01.xlsx'">点击下载模版</a>
        </el-tag>

      </el-form-item>

      <el-form-item label="选择Excel">
        <el-upload
          ref="upload"
          :auto-upload="false"
          :on-success="fileUploadSuccess"
          :on-error="fileUploadError"
          :disabled="importBtnDisabled"
          :limit="1"
          :action="BASE_API+'/eduservice/edu-subject/addSubject'"
          name="file"
          accept="application/vnd.ms-excel,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet">
          <el-button slot="trigger" size="small" type="primary">选取文件</el-button>
          <el-button
            :loading="loading"
            style="margin-left: 10px;"
            size="small"
            type="success"
            @click="submitUpload">上传到服务器</el-button>
        </el-upload>
      </el-form-item>
    </el-form>
  </div>
</template>
<script>
  export default {
    data() {
      return {
        BASE_API: process.env.BASE_API, // 获取dev.env.js里面地址
        importBtnDisabled:false, //按钮是否禁用
        loading:false,
      };
    },
    methods: {
      submitUpload(){
            this.importBtnDisabled = true
            this.loading = true
            this.$refs.upload.submit()
      },
      fileUploadSuccess(){
          // 提示信息
          this.loading = false
          this.$message({
              type:'success',
              message:'添加课程成功'
          })
          //跳转至课程分类
          this.$router.push({path:'/subject/list'})
      },
      fileUploadError(){
          // 提示信息
          this.loading = false
          this.$message({
              type:'error',
              message:'添加课程失败'
          })
      },
    },
    created(){
        
    },
  }
</script>

<style>

</style>
