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
                <input type="file" name="upfile" onchange="checkFile(this)"/><br />
                <input class="button" type="submit" value="등록""/>
            </div>
        </form>
        <script>
        function checkFile(f) {
            var file = f.files;

            if (!/\.(gif|jpg|jpeg|png)$/i.test(file[0].name))
                alert(
                    "gif, jpg, png 파일만 선택해 주세요.\n\n현재 파일 : " +
                        file[0].name
                );
            else return;
            f.outerHTML = f.outerHTML;
        }
        </script>
    </body>
</html>
