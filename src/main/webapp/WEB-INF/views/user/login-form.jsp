<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>WorkUs Login Page</title>
    <link rel="stylesheet" href="../../../resources/css/login-form.css">
</head>
<body>
<div class="container">
    <!-- Heading -->
    <h1>WORKUS</h1>

    <!-- Links -->
    <ul class="links">
        <li>
            <a href="#" id="signin">로그인</a>
        </li>
        <li>
            <a href="#" id="signup">회원가입</a>
        </li>
        <li>
            <a href="#" id="reset">비밀번호 찾기</a>
        </li>
    </ul>

    <!-- Form -->
    <form  action="" method="post">
        <!-- email input -->
        <div class="first-input input__block first-input__block">
            <input type="email" placeholder="ID 또는 사번을 입력해주세요" class="input" id="email"   />
        </div>
        <!-- password input -->
        <div class="input__block">
            <input type="password" placeholder="비밀번호를 입력해주세요" class="input" id="password"    />
        </div>
        <!-- repeat password input -->
        <div class="input__block">
            <input type="password" placeholder="Repeat password" class="input repeat__password" id="repeat__password"    />
        </div>
        <!-- sign in button -->
        <button class="signin__btn">
            Sign in
        </button>
    </form>
    <!-- separator -->
    <div class="separator">
        <p>OR</p>
    </div>
    <!-- google button -->
    <button class="google__btn">
        <i class="fa fa-google"></i>
        Sign in with Google
    </button>
    <!-- google button -->
</div>
</body>
<footer>
</footer>
</html>
