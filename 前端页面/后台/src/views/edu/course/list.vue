<template>
  <div class="app-container">
    <h2>课程列表</h2>


    <!--查询表单-->
    <el-form :inline="true" class="demo-form-inline">
      <el-form-item>
        <el-input v-model="conditions.title" placeholder="课程名称"/>
      </el-form-item>

      <el-form-item>
        <el-select v-model="conditions.status" clearable placeholder="课程状态">
          <el-option :value="'Normal'" label="已发布"/>
          <el-option :value="'Draft'" label="未发布"/>
        </el-select>
      </el-form-item>

      <el-button type="primary" icon="el-icon-search" @click="getList()">查询</el-button>
      <el-button type="default" @click="resetData()">清空</el-button>
    </el-form>

    <!-- 表格 -->
    <el-table
      :data="list"
      border
      stripe
      fit
      highlight-current-row>

      <el-table-column
        label=""
        width="50"
        align="center">
        <template slot-scope="scope">
          {{ (current - 1) * limit + scope.$index + 1 }}
        </template>
      </el-table-column>

      <el-table-column prop="title" label="课程名称" />

      <el-table-column label="课程状态" width="80">
        <template slot-scope="scope">
          {{ scope.row.status==='Normal'?'已发布':'未发布' }}<!--三个等号判断 值 和 类型-->
        </template>
      </el-table-column>

      <el-table-column prop="lessonNum" label="课时数" width="100" />

      <el-table-column prop="gmtCreate" label="添加时间" width="100"/>

      <el-table-column prop="viewCount" label="浏览数量" width="100" />
      <el-table-column label="操作" align="center">
        <template slot-scope="scope">
          <el-button type="primary" size="mini" icon="el-icon-delete" @click="updateCourseById(scope.row.id)">修改</el-button>
          <el-button type="danger" size="mini" icon="el-icon-delete" @click="deleteCourseById(scope.row.id)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <!-- 分页 -->
    <el-pagination
      :current-page="current"
      :page-size="limit"
      :total="total"
      style="padding: 30px 0; text-align: center;"
      layout="total, prev, pager, next, jumper"
      @current-change="getList"
    />

  </div>
</template>

<script>

import course from '@/api/edu/course'

export default {
  // 定义变量和初始值
  data(){
    return{
      list:null,//查询之后接口返回集合
      current:1, //当前页码
      limit:6, //每页显示数目
      total:0, //总记录数
      conditions:{},//查询条件

    }
  },
  // 页面渲染之前执行，一般调用methods定义的方法
  created(){
    this.getList()
  },
  // 页面JS方法
  methods:{
    // 修改课程
    updateCourseById(id){
      this.$router.push({path:'/course/info/'+id})  // 添加修改共用一个页面
    },

    // 删除课程
    deleteCourseById(id) {
      this.$confirm('此操作将永久删除课程记录, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        course.deleteCourseById(id)
          .then(response=>{
            // 提示信息
            this.$message({
              type: 'success',
              message: '删除成功!'
            });
            // 回到页面
            this.getList()
          })

      })
    },
    resetData() {
      this.conditions={}
    },
    // current:不传值则为1
    getList(current = 1){
      this.current = current
      course.getPageCourse(this.conditions,this.current,this.limit)
        .then(response =>{
          this.list = response.data.list
          this.total = response.data.total
        }) //请求成功
        .catch(error =>{
          console.log(error)
        }) //请求失败
    }
  }
}
</script>
