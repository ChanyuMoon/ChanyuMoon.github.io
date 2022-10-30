---
layout: single
title: css 예제, kokoa clone.
---

## font-family  

css에서 원하는 font를 지정하는 property이다.  

기본적으로 vs code에 내장되어있는 font를 사용해도 좋지만, 여러 font를 웹브라우저에서 검색하여 가져올 수 도 있다.  

우리는 google font라는 사이트에서 font를 가져올 것이다. google font에는 여러 font들이 있는데, 이중 마음에 드는 것을 고른다.  

그 후 font의 크기와 bold 유무에 따라 여러 type이 존재하는데, 이 중에서 우리가 가져오고 싶은 녀석들만 add하여 font-family를 구성한다.  

구성한 뒤에 Use on the web 표시에서 두가지 방식을 통해 우리의 html, css 소스에 적용할 수 있다. 우선 link를 통해 html 자체에 적용하는 방법이 있고, 둘째로 css에서 import를 하여서 font-famiily property로 적용하는 방식이다.  

기본적으로 html을 이쁘게 하는 소스들은 css에서 관장하기에 css에 적는 방식인 두번째 방식을 추천한다. 

```css
@import url('https://fonts.googleapis.com/css2?family=The+Nautigal:wght@400;700&display=swap');
body{
    font-family: 'The Nautigal', cursive;
}
```  



