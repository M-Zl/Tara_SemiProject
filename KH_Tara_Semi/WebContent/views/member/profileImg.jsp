<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Document</title>
        <style>
            .profile {
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                width: 300px;
                height: 150px;
            }
            .profile > span {
                color: #4169e1;
                margin-bottom: 30px;
                font-size: 30px;
            }
            .button {
                border-style: none;
                border-radius: 15px;
                width: 50px;
                color: white;
                background-color: royalblue;
            }
        </style>
    </head>

    <body>
        <form
            action="<%=request.getContextPath() %>/member/profile"
            method="post"
            enctype="multipart/form-data"
        >
            <div class="profile">
                <span>프로필 사진</span>
                <input type="file" name="upfile" /><br />
                <input class="button" type="submit" value="등록""/>
            </div>
        </form>
    </body>
</html>
