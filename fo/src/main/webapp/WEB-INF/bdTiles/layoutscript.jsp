<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE tiles-definitions PUBLIC
       "-//Apache Software Foundation//DTD Tiles Configuration 3.0//EN"
       "http://tiles.apache.org/dtds/tiles-config_3_0.dtd">
<tiles-definitions>

   <!-- main -->
   <definition name="layout" template="/WEB-INF/tiles/layout-main.jsp">
       <put-attribute name="header" value="/WEB-INF/tiles/header.jsp" />
       <put-attribute name="body" value="" />
       <put-attribute name="footer" value="/WEB-INF/tiles/footer.jsp" />
   </definition>
   <definition name="*/*.tiles" extends="layout">
       <put-attribute name="body" value="/WEB-INF/jsp/{1}/{2}.jsp" />
   </definition>

   <!-- bdmain -->
   <definition name="layoutBd" template="/WEB-INF/bdTiles/layout-main.jsp">
       <put-attribute name="header" value="/WEB-INF/bdTiles/header.jsp" />
       <put-attribute name="body" value="" />
       <put-attribute name="footer" value="/WEB-INF/bdTiles/footer.jsp" />
   </definition>
   <definition name="*/*.bdtiles" extends="layoutBd">
       <put-attribute name="body" value="/WEB-INF/jsp/{1}/{2}.jsp" />
   </definition>
   
   <definition name="*/*.sample" extends="layoutBd">
       <put-attribute name="body" value="/WEB-INF/jsp/{1}/{2}.jsp" />
   </definition>

    <definition name="layoutNo" template="/WEB-INF/noTiles/layout-main.jsp">
        <put-attribute name="body" value="" />
    </definition>
    <definition name="*/*.notiles" extends="layoutNo">
        <put-attribute name="body" value="/WEB-INF/jsp/{1}/{2}.jsp" /> 
    </definition>

   <definition name="*/*" template="/WEB-INF/tiles/body.jsp">
       <put-attribute name="body" value="/WEB-INF/jsp/{1}/{2}.jsp" />
   </definition>

</tiles-definitions> 