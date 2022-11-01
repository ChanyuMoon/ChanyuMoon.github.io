---
layout: single
title: "Github Jekyll blog posting하기"
last_modified_at: 2022-11-01
categories: blog
tag: [blog]
---

# Blog 설정

이전에 github과 jekyll을 통한 간단한 blog를 만들어 잘 활용하고 있었는데, 쓰다보니 여러 기능들을 추가하고 조금 더 있어보이는 블로그를 만들고 싶어졌다.  

여러 블로그와 영상을 보다 테디노트라는 유튜버 분이 정리해둔 영상을 찾아 따라하며 블로그를 어느 정도 완성하였다. 아래에 링크를 걸었으니 궁금하신 분들은 영상을 보면 많은 도움이 될 것 같다.  

Category, tag를 지정하고 이로 분류되어 post를 볼 수 있는 page도 만들었고, disqus를 이용해 댓글 기능도 구현을 하였는데, 가장 기본적인 이미지를 post에 업로드 하는것이 잘 되지 않았다.  

테디노트님 영상에서 markdown post 자체를 typora와 같은 markdown 편집기를 이용하여 사용하길래, 나도 사용을 해보았다. 다만, typora 자체에서는 잘보이는데, 실제 jekyll로 local host를 하여 보면 image가 보이지 않는 것이다.  

혹시 편집기 문제인가 싶어 typora와 유사한 marktext라는 편집기도 사용을 해보았는데, 마찬가지였다.  

해서 해결책을 찾은 것이 바로 vscode내에서 markdown 문법이나 html 문법으로 이미지를 넣는 것이다. 다만 여기서 이미지 파일을 모아두는 폴더의 위치를 `assets` 폴더 아래에 두어야 한다.  

나 같은 경우 `/assets/image/` 로 이미지를 저장하여, `![$name your image](/assets/images/$filename)` 과 같은 markdown 문법 format으로 이미지를 넣었다(여기서 `$`는 임의로 바꾸면 된다는 표시).  

![apple](/assets/images/2022-10-29-changed_theme/images.jpg)  

위 처럼 사과 그림을 넣을 수 있다!  

Markdown 문법 뒤에 중괄호(`{}`)를 이용해 align이나 크기 조절등의 설정을 해줄 수 있다.  

```html
![apple](/assets/images/2022-10-29-changed_theme/images.jpg){: .align-center}
![apple](/assets/images/2022-10-29-changed_theme/images.jpg){: width="30%" height="30%"}
![apple](/assets/images/2022-10-29-changed_theme/images.jpg){: .align-center width="30%" height="30%"}
```

맨 아래 code로 사과 이미지를 붙여넣으면 아래 그림이 나온다(vscode 상에서는 반영이 안된 상태로 나올 수 있는데 local host에서는 반영이 되어서 보일 것이다). 

![apple](/assets/images/2022-10-29-changed_theme/images.jpg){: .align-center width="30%" height="30%"}

이제 드디어 새 블로그에서 포스팅을 할 수 있을 것 같다.  

추가적으로 markdown 편집 프로그램도 될 것 같은데 방법을 찾는데로 update 하겠다.  

# 참고

[테디노트님 유튜브](https://www.youtube.com/c/teddynote)

[minimal-mistakes 공식 가이드](https://mmistakes.github.io/minimal-mistakes/docs/quick-start-guide/)

[성공한 이미지 업로드 방법](https://blog.jaeyoon.io/2017/12/jekyll-image.html)