<%
    
    String str=request.getParameter("fname");
    int a=str.lastIndexOf("\\");
    String fname=str.substring(a+1);
    session.setAttribute("fname",fname);
    out.println("done");
    %>