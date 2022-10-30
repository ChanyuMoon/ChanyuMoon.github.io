---
layout: post
titile: 여러 content들을 3등분 한 위치에 두되 중간 content를 화면 정확히 중간에 두는 법, css hack, kokoa clone.
---

## 핸드폰 화면을 만드는데 중간에 위치한 시게를 정확히 중간에 두고 나머지 아이콘들은 양끝에 놓고 싶다.  

html 소스코드  

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/styles.css">
    <title>Welcome to Kokoa clone</title>
</head>
<body>
    <div class="status-bar">
        <div class="status-bar__column">
            <span>No Service</span>
            <i class="fas fa-wifi"></i>
        </div>
        <div class="status-bar__column">
            <span>18:43</span>
        </div>
        <div class="status-bar__column">
            <!--To Do: Turn Locked icon-->
            <span>110%</span>
            <i class="fas fa-battery-full"></i>
            <i class="fas fa-bolt"></i>
            <a href=""></a>
        </div>
    </div>
    <header class="welcome-header">
        <h1 class="welcome-header__title">Welcome to Kokoa clone</h1>
        <p class="welcome-header__text">If you have a Kokoa clone, log in with your email or phone number.</p>
    </header>
    <!--form is unique-->
    <form action="" id="login-form">
        <input type="text" placeholder="Email or phone number">
        <input type="password" placeholder="Password">
        <input type="submit" value="Log In">
        <input type="submit" value="Sign Up">
        <a href="#">Find Kokoa Account or Password</a>
    </form>
    <script defer src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" integrity="sha384-rOA1PnstxnOBLzCLMcre8ybwbTmemjzdNlILg8O7z1lUkLXozs4DHonlDtnE7fpc" crossorigin="anonymous"></script>
</body>
</html>
```  

문제 상황에서의 css 소스  

```css
body{
    font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
}
.status-bar{
    display: flex;
    justify-content: space-between;
}
.status-bar__column:first-child span{
    margin-right: 5px;
}
```  
기존의 결과물은 다음과 같다.  

<img src="img/css_hack_content_middle.png">  

여기 보이는 중간 18:43이 딱 중간에 안맞는다. 이를 해결하기 위해서 다음과 같이 css를 작성해 볼 것이다.  

```css
body{
    font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
}
.status-bar{
    display: flex;
    justify-content: center;
}
.status-bar__column{
    width: 33%;
}
.status-bar__column:first-child span{
    margin-right: 5px;
}
.status-bar__column:nth-child(2) {
    display: flex;
    justify-content: center;
}
.status-bar__column:nth-child(3){
    display: flex;
    justify-content: end;
    align-items: center;
}
.status-bar__column .fa-battery-full{
    margin: 0px 5px;
}
```  

하나씩 보자. 우선 `.status_bar`에 적용시켰던 `justify-content: space-between`은 element사이 거리만을 같게 하기에 시계 element를 화면 중간에 위치 시키는데 방해가 된다.  

우리는 자동으로 나누어주는 방식보다는 각 element의 width를 동일하게 설정한 뒤 그 안에서 icon들을 움직이는 방식을 사용할 것이다.  

```css
.status-bar{
    display: flex;
}
.status-bar__column{
    width: 33%;
}
```  

![](img/2022-01-12_step_1.png)

element들이 같은 크기로 잘 나누어졌지만 내부의 icon들이 왼쪽 정렬 되어있다.  

이를 위해서 2,3번째 element들을 flex로 바꾼뒤 주축에 대해 중간 정렬을 할 것이다. 주축을 만질때에는 `justify-content`를 사용해 주자.  

```css
.status-bar__column:first-child span{
    margin-right: 5px;
}
.status-bar__column:nth-child(2) {
    display: flex;
    justify-content: center;
}
.status-bar__column:nth-child(3){
    display: flex;
    justify-content: end;
    align-items: center;
}
```  

추가적으로 첫번째(제일 왼쪽) element의 가시성 향상을 위해 icon의 wifi와 문구 사이 간격을 조금 주었다(앞선 이미지들은 이미 적용이 된 상태였다. 포스팅에서 크게 중요한 부분은 아니지만 혼선을 막기 위해 설명하였다.).  

이렇게 하면 우리가 원하는 모습대로 잘 정렬된 status-bar를 볼 수 있다.  

![](img/2022-01-12_status-bar_final.png)




