<template>
  <div class="app-container">
    <h2>讲师列表</h2>


    <!--查询表单-->
    <el-form :inline="true" class="demo-form-inline">
      <el-form-item>
        <el-input v-model="condition.name" placeholder="讲师名"/>
      </el-form-item>

      <el-form-item>
        <el-select v-model="condition.level" clearable placeholder="讲师头衔">
          <el-option :value="1" label="高级讲师"/>
          <el-option :value="2" label="首席讲师"/>
        </el-select>
      </el-form-item>

      <el-form-item label="添加时间">
        <el-date-picker
          v-model="condition.begin"
          type="datetime"
          placeholder="选择开始时间"
          value-format="yyyy-MM-dd HH:mm:ss"
          default-time="00:00:00"
        />
      </el-form-item>
      <el-form-item>
        <el-date-picker
          v-model="condition.end"
          type="datetime"
          placeholder="选择截止时间"
          value-format="yyyy-MM-dd HH:mm:ss"
          default-time="00:00:00"
        />
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

      <el-table-column prop="name" label="名称" width="80"/>

      <el-table-column label="头衔" width="80">
        <template slot-scope="scope">
          {{ scope.row.level === 1 ? '高级讲师' : '首席讲师' }}<!--三个等号判断 值 和 类型-->
        </template>
      </el-table-column>

      <el-table-column prop="intro" label="资历"/>

      <el-table-column prop="gmtCreate" label="添加时间" width="160"/>

      <el-table-column prop="sort" label="排序" width="60"/>

      <el-table-column label="操作" width="200" align="center">
        <template slot-scope="scope">
          <router-link :to="'/teacher/edit/'+scope.row.id">
            <el-button type="primary" size="mini" icon="el-icon-edit">修改</el-button>
          </router-link>
          <!--注意此处 获取 id 的方式-->
          <el-button type="danger" size="mini" icon="el-icon-delete" @click="deleteTeacherById(scope.row.id)">删除
          </el-button>
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

import teacher from '@/api/edu/teacher'

export default {
  // 核心代码
  // data:{

  // },

  // 定义变量和初始值
  data() {
    return {
      list: null,//查询之后接口返回集合
      current: 1, //当前页码
      limit: 6, //每页显示数目
      total: 0, //总记录数
      condition: {}//查询条件
    }
  },
  // 页面渲染之前执行，一般调用methods定义的方法
  created() {
    this.getList()
  },
  // 页面JS方法
  methods: {
    resetData() {
      this.condition={}
    },
    // 删除讲师
    deleteTeacherById(id) {
      this.$confirm('此操作将永久删除讲师记录, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        teacher.deleteTeacherById(id)
          .then(response => {
            // 提示信息
            this.$message({
              type: 'success',
              message: '删除成功!'
            })

            // 回到页面
            this.getList()
          })

      })
      // .catch(() => {
      //   this.$message({
      //     type: 'info',
      //     message: '已取消删除'
      //   });
      // });
    },

    // current:不传值则为1
    getList(current = 1) {
      this.current = current
      teacher.getTeacherListPage(this.current, this.limit, this.condition)
        .then(response => {
          this.list = response.data.list
          this.total = response.data.total
        }) //请求成功
        .catch(error => {
          console.log(error)
        }) //请求失败
    }
  }

}
</script>
