package com.aimprosoft.task5.portlet;

import com.liferay.portal.kernel.util.ParamUtil;

import javax.portlet.*;
import java.io.IOException;

public class DisplayPortlet extends GenericPortlet {

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


    public void doDispatch(RenderRequest renderRequest, RenderResponse renderResponse) throws IOException, PortletException{
        String path = renderRequest.getParameter("path");
        if (path != null) {
            include(path, renderRequest, renderResponse);
        }
        else {
            super.doDispatch(renderRequest, renderResponse);
        }
    }

    @ProcessAction(name = "departments")
    public void processDepartments(ActionRequest request, ActionResponse response) {
        String action = ParamUtil.get(request,"action","");
        if ("list".equalsIgnoreCase(action)) {

        }
    }
}
