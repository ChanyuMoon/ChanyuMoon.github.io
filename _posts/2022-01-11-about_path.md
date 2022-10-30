---
layout: single
title: 절대 경로와 상대 경로
---

## 파일 경로  
개발을 함에 있어서 local directory 내에 존재하는 파일들을 불러와야 하는 경우가 있다. 이 경우 우리는 파일의 path(경로)를 알려 줌으로써 그 파일에 접근 할 수 있다. 
파일의 경로를 나타내는 방식에는 절대 경로와 상대 경로가 존재한다. 항상 개념은 기억을 하지만 막상 코딩을 할 때 정확한 경로 표기 방식이 헷갈려 늘 구글링을 하기에 이 포스팅에서 한번 정리하고자 한다.  

### 절대 경로  
절대 경로는 root directory의 위치를 시작점으로 파일의 위치는 표기하는 방식이다. Root directory를 defalut로 생각하기에 absolut(절대)라는 naming이 생겼다고 이해하면 좋을 듯 하다.  

예를 들어 macbook의 root directory는 home인데 home 안의 Users, chanyumoon, projects 에 접근하는 경로를 생각해보자.(Finder나 윈도우에서는 파일 탐색기로 클릭하는 과정을 떠올려보라.)
위 과정을 따라 나온 경로를 상하관계에 따라 구분자로 구분을 하여 표현하면 그것이 경로가 된다. 보통 구분자는 / (슬래쉬)나 \ (역슬래쉬)로 표현된다.  

이때 python, c++등 코딩을 할 때 조심해야 할 것은 바로 \를 표현할 때이다. 키보드의 enter위에 존재하는 \는 문자열에서 escape sequence로 사용된다. 
이 문자들은 문자열로써 인식 되는 것이 아닌 기능을 나타내게 되는데, 예를 들어  \n 은 줄바꿈, \t 은 tab(보통 4칸의 space), \w 는 whitespace(space, tab, enter 등 문자 사이에 구분)을 나타낸다.  

즉 "\Users\chanyumoon\projects\data.csv" 로 적게되면 \뒤의 문자들이 escape sequence로 인식이 되어 잘못된 path가 되게 된다.
\를 구분자로 path를 적어 줄때에는 \\ 로 내가 지금 적는 역슬래쉬가 escape sequence가 아닌 단순 chractor임을 나타내어야 한다.  

지금 위 경로의 시작점에 home이 왜 없는지 의아할텐데 이 부분에 대해서는 아래 상대 경로를 설명하면서 알아보도록 하자.  

그냥 슬래쉬(/)로 구분 할 때는 그냥 적으면 된다.  

### 상대 경로  
대다수의 경우 상대 경로로 파일 위치를 나타내는 방식이 선호된다. 그 이유는 상대 경로는 여러 컴퓨터와 상관 없이 general 하게 작동되는 점 때문이다.
쉽게 말하면 호환성이 좋다고도 이해해도 된다(조금 거창한 표현이긴하지만..).  

위 절대 경로 "Users/chanyumoon/projects/data.csv"로 file에 접근하여 코딩된 코드가 있다고 하자. 이 코드를 다른 컴퓨터에서 그대로 실행을 시키면 바로 error가 뜰 것이다. 
이는 당연한 것이 다른 컴퓨터에는 다른 directory들로 구성이 되어있기 때문에 data.csv를 같이 내려 받았다고 해도 다른 path에 존재하게 되는 것이다. 
절대 경로로 file을 불러오게 되면 코드를 내려 받는 사람마다 자신의 컴퓨터에 data.csv path를 찾아서 코드를 수정해줘야 한다. 매우 비생산적이다.  

이런 일을 방지하기 위해 **상대 경로** 를 사용한다. 상대 경로는 현재 그 코드가 존재하는 위치를 기준으로 path를 작성하는 것이다.
현재 위치는 환경 변수 $PATH에 저장 되는데, 만약 내가 코드를 projects directory 내부에 존재하는 code.py에서 돌린다고 생각을 해보자.  

그러면 
```
$path = "/Users/chanyumoon/projects"
```  

가 되는 것이다. 그러면 나는 code.py 내부에서 data.csv를 부르기 위해 data의 path를 다음과 같이 적으면 되는 것이다.  

```python
data_path_expression_1 = "data.csv"
```  

Q. $PATH의 끝에 /가 있어야 /Users/chanyumoon/projects/data.csv로 완성이 되지 않을까?  

A. 아마 상대 경로의 defalut 설정에 있어서 두 string을 "/"로 연결해주는 코드가 있을 듯하다. 왜냐하면, /은 뒤에서 보겠지만 root directory를 나타내기 때문이다.  

마지막으로 상대 경로에 있어서 부모, 자식 directory로 이동할 수 있는 표현 방식을 끝으로 포스팅을 마치겠다.  

만약 상위로 가고 싶다면 "../"을  

아래로 이동하고 싶으면 "/"을  

root directory에서 시작을 하고 싶다면 "/"로 시작을  

현재 directory에서 시작을 하고 싶다면 "./"로 시작을 하면 된다.  

예제를 보자. Directory 구조는 다음과 같다.  

- - - - root 
- - - A
- - B1
- - B2 (현재 코드 위치)
- C  

A의 path -> "/A" or "../" or "./../"  

B1의 path -> "/A/B1" or "B1" or "./B1"  

C의 path -> "./C"
