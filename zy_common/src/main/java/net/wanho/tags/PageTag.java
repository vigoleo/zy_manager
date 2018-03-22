package net.wanho.tags;

import com.github.pagehelper.PageInfo;
import net.wanho.pojo.User;

import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by silen on 2018/3/22.
 */
public class PageTag extends SimpleTagSupport {
    @Override
    public void doTag() throws IOException {
        PageContext pageContext= (PageContext) this.getJspContext();
        PrintWriter out=pageContext.getResponse().getWriter();
        PageInfo<User> pageInfo= (PageInfo<User>) pageContext.getRequest().getAttribute("pageInfo");
        int pages=pageInfo.getPages();
        for(int i=0;i<pages;i++){
            out.println("<a href='javascript:jump(\""+(i+1)+"\")'>第"+(i+1)+"页</a>");
        }
    }

}
