package com.lnzz.util;

import java.io.Serializable;

/**
 * ClassName：Result
 *
 * @author 冷暖自知
 * @version 1.0
 * @date 2019/12/12 14:43
 * @Description:操作结果集
 */
public class Result  implements Serializable {
    public static final int SUCCESS = 1;
    public static final int FAILURE = -1;

    private static final long serialVersionUID = 5576237395711742681L;

    public Result(boolean success, String msg, Object data) {
        this.success = success;
        this.msg = msg;
        this.data = data;
    }

    public Result(boolean success, String msg) {
        this.success = success;
        this.msg = msg;
    }

    private boolean success = false;

    private String msg = "";

    private Object data = null;

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
