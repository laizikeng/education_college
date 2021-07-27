import request from '@/utils/request'

export default{
    // current：当前页
    // limit：每页记录数
    // condition：查询条件
    getTeacherListPage(current,limit,condition){
        return request({
            url:`/eduservice/edu-teacher/pageTeacherConditional/${current}/${limit}`,
            method:'post',
            // condition 条件对象，后端使用RequestBody获取数据
            // data表示把对象转换为JSON格式传递，对应ResponseBody
            data: condition,
        })
    },
    deleteTeacherById(id){
        return request({
            url:`/eduservice/edu-teacher/deleteTeacher/${id}`,
            method:'get',
        })
    },
    updateTeacherInfo(teacher){
        return request({
            url:`/eduservice/edu-teacher/updateTeacher`,
            method:'post',
            data:teacher
        })
    },
    addTeacher(teacher){
        return request({
            url:`/eduservice/edu-teacher/addTeacher`,
            method:'post',
            data:teacher
        })
    },
    getTeacherInfo(id){
        return request({
            url:`/eduservice/edu-teacher/getTeacherById/${id}`,
            method:'get',
        })
    },
    updateTeacher(teacher){
        return request({
            url:`/eduservice/edu-teacher/updateTeacher`,
            method:'post',
            data:teacher
        })
    },
}