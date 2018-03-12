<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.portlet.*, javax.naming.*, javax.sql.*" %>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<portlet:defineObjects />
<%PortletPreferences prefs = renderRequest.getPreferences();%>

VIEW MODE
<%
    String DATASOURCE_CONTEXT = "java:comp/env/jdbc/LiferayPool";
    Connection result = null;
    try {
        Context initialContext = new InitialContext();
        if ( initialContext == null){
            out.println("JNDI problem. Cannot get InitialContext.");
        }
        DataSource datasource = (DataSource)initialContext.lookup(DATASOURCE_CONTEXT);
        if (datasource != null) {
            result = datasource.getConnection();
            out.println("Lookup datasource.");
            Statement stmt = result.createStatement();
            ResultSet rs = stmt.executeQuery("select * from departments");
            while(rs.next()){
                out.println (rs.getString("name"));
            }
            stmt.close();
            result.close();
        }
        else {
            out.println("Failed to lookup datasource.");
        }
    }
    catch ( NamingException ex ) {
        out.println("Cannot get connection: " + ex);
    }
    catch(SQLException ex){
        out.println("Cannot get connection: " + ex);
    }
%>