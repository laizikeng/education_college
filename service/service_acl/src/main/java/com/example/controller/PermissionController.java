package com.example.controller;

import com.example.ResultEntity;
import com.example.entity.Permission;
import com.example.service.PermissionService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 * 权限 菜单管理
 * </p>
 *
 * @author testjava
 * @since 2020-01-12
 */
@RestController
@RequestMapping("/admin/acl/permission")
public class PermissionController {

    @Autowired
    private PermissionService permissionService;


    //获取全部菜单
    @ApiOperation(value = "递归查询所有菜单")
    @GetMapping
    public ResultEntity indexAllPermission() {
        List<Permission> list =  permissionService.queryAllMenuGuli();
        return ResultEntity.ok().data("children",list);
    }

    @ApiOperation(value = "递归删除菜单")
    @DeleteMapping("remove/{id}")
    public ResultEntity remove(@PathVariable String id) {
        permissionService.removeChildByIdGuli(id);
        return ResultEntity.ok();
    }

    @ApiOperation(value = "给角色分配权限")
    @PostMapping("/doAssign")
    public ResultEntity doAssign(String roleId,String[] permissionId) {
        permissionService.saveRolePermissionRealtionShipGuli(roleId,permissionId);
        return ResultEntity.ok();
    }

    @ApiOperation(value = "根据角色获取菜单")
    @GetMapping("toAssign/{roleId}")
    public ResultEntity toAssign(@PathVariable String roleId) {
        List<Permission> list = permissionService.selectAllMenu(roleId);
        return ResultEntity.ok().data("children", list);
    }



    @ApiOperation(value = "新增菜单")
    @PostMapping("save")
    public ResultEntity save(@RequestBody Permission permission) {
        permissionService.save(permission);
        return ResultEntity.ok();
    }

    @ApiOperation(value = "修改菜单")
    @PutMapping("update")
    public ResultEntity updateById(@RequestBody Permission permission) {
        permissionService.updateById(permission);
        return ResultEntity.ok();
    }

}

