package com.aimprosoft.task5.portlet;

import javax.portlet.GenericPortlet;
import javax.portlet.PortletException;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;
import java.io.IOException;

public class Portlet2 extends GenericPortlet{
    private String viewTemlate;

    public void init() {
        this.viewTemlate = getInitParameter("view-template");
    }

    public void doView(RenderRequest renderRequest, RenderResponse renderResponse) throws IOException, PortletException {
        include(viewTemlate,renderRequest,renderResponse);

    }

    private void include(String path, RenderRequest renderRequest, RenderResponse renderResponse)
            throws IOException, PortletException {
        getPortletContext().getRequestDispatcher(path).include(renderRequest, renderResponse);
    }

}
