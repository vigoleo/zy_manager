package net.wanho.pojo;

import java.io.Serializable;

/**
 * Created by silen on 2018/3/21.
 */
public class Result implements Serializable {
    private  int  status;
    private String msg;
    private Object object;

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getObject() {
        return object;
    }

    public void setObject(Object object) {
        this.object = object;
    }
}
