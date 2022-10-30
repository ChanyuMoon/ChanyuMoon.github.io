---
layout: post
title: Python 버전 설치 가이드(make error)
---  

## 가상환경을 만들자. 

이번에 python web development 와 ML이 포함된 class를 신청해서 내일 첫 수업을 듣는다. 수업을 듣기 전에 ubuntu에서 가상 환경을 만들어 class에서 요구하는 python 3.7.5와 관련 pakages를 다운 받을 계획이었다.  

이리 저리 찾아보니 최종적으로는 Docker라는 것으로 환경을 구성할 것이나, 당장 내일 수업 준비를 해야하기에 그나마 쉬운 virtualenv를 이용하여 가상환경을 구성하기로 했다. 원래는 venv를 사용하려 했으나, venv(virtualenv의 lite 버전)에서는 python 버전을 달리 하지 못한다고 해서 virturalenv를 사용하게 되었다.  

이리 저리 구글링을 하다 python 버전은 공식 홈페이지에서 다운을 받아야 한다고 해서 ubuntu에서 다운하는 법을 찾아보았다.  

https://somjang.tistory.com/entry/PythonUbuntu%EC%97%90-Python-37-%EC%84%A4%EC%B9%98%ED%95%98%EA%B8%B0  

위 사이트 방식대로 하다가 make가 안먹는 것이다. 해서 또 구글링을 해보니 `./configure`을 통해서 하는 파일 생성이 잘 되지 않은 것이었다. 보니 이 파일 생성을 위해서는 `g++`가 필요한데 ubuntu에는 그게 default로 설치가 안되어있는 것 이다.  

https://blog.naver.com/PostView.nhn?isHttpsRedirect=true&blogId=worms035&logNo=205939879&redirect=Dlog&widgetTypeCall=true&directAccess=false  


그래서 `sudo apt-get install g++` 를 한뒤 다시 `./configure`를 해주니 잘되었다.  




