package com.example.common_vo;


import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
public class UcenterMemberComment {
    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "会员id")
    @TableId(value = "id", type = IdType.ID_WORKER_STR)
    private String id;
    @ApiModelProperty(value = "昵称")
    private String nickname;
    @ApiModelProperty(value = "用户头像")
    private String avatar;
}
