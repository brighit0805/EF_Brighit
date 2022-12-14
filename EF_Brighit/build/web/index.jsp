<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <title>JSP Page</title>
        </head>
        <body>
            <h1>Bienvenido al Sistema</h1>
            <script type="text/javascript">
                setTimeout(function(){
                    location.href='./sesion?accion=login';
                }, 500);
            </script>
        </body>
    </html>
</f:view>
