package com.example.servicebase.exeception;


import com.example.ResultEntity;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

@Slf4j
@ControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(Exception.class)
    @ResponseBody
    public ResultEntity error(Exception e){
        e.printStackTrace();
        return ResultEntity.error().message(e.getMessage());
    }

    @ExceptionHandler(GuliException.class)
    @ResponseBody
    public ResultEntity error(GuliException e){
        e.printStackTrace();
        return ResultEntity.error().message(e.getMessage()).code(e.getCode());
    }

}
