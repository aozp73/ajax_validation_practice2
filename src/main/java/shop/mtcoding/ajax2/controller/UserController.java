package shop.mtcoding.ajax2.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import shop.mtcoding.ajax2.dto.ResponseDto;

@Controller
public class UserController {

    @GetMapping("/user/usernameSameCheck")
    public @ResponseBody ResponseDto<?> check(String username) {
        // 유효성 검사
        if (username == null || username.isEmpty()) {
            return new ResponseDto<>(-1, "username QueryString을 전달해주세요", null);
        }

        if (username.equals("ssar")) {
            return new ResponseDto<>(1, "동일한 username 존재합니다", false);
        } else {
            return new ResponseDto<>(1, "해당 username 으로 회원가입 할 수 있습니다", true);
        }
    }

    @GetMapping("/joinForm")
    public String joinForm() {
        return "joinForm";
    }
}
