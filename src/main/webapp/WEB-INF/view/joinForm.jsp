<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
            <title>Document</title>
        </head>

        <body>
            <h1>회원가입 페이지</h1>
            <hr>
            <form action="/join" method="post" onsubmit="return valid()">
                <input id="username" type="text" name="username" placeholder="Enter username">
                <button type="button" onclick="sameCheck()">유저네임 중복체크</button>
                <br>

                <input id="password" type="password" placeholder="Enter password"><br>
                <input id="email" type="email" placeholder="Enter email"><br>

                <button type="submit">회원가입</button>
            </form>

            <script>
                let submitCheck = false;

                $("#username").keydown(() => {
                    if (submitCheck == true) {
                        alert("중복체크를 다시 하셔야 합니다");
                        submitCheck = false;
                    }
                });

                function valid() {
                    if (submitCheck) {
                        return true;
                    } else {
                        alert("유저네임 중복체크를 해주세요")
                        return false;
                    }
                }

                function sameCheck() {
                    let username = $("#username").val();

                    $.ajax({
                        type: "get",
                        url: "/user/usernameSameCheck?username=" + username
                    }).done((res) => {
                        if (res.data == true) {
                            alert(res.msg);
                            submitCheck = true;
                        } else {
                            alert(res.msg);
                            submitCheck = false;
                        }
                    }).fail((err) => {

                    });
                }
            </script>
        </body>

        </html>