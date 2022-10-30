---
layout: single
title: What is Git?
---


git에 대해서 공부한 내용을 정리한 글입니다. 

## Git이란?
: Git은 소스코드를 버전별로 관리 하는 '분산형 버전 관리 시스템'입니다. 

 여러 사람이 함께 프로젝트를 하며 소스코드를 수정할때 local에서 수정상황이 어땠는지 몰라 팀원의 수정부분을 고려하지 않고 코드를 덮어씌운다거나 하는 문제를 탁월하게 해결해주는 장점이 있어요. 
 
 또한 개인 project에 있어서도 자신이 코드를 수정한 commit이라는 분기점을 기반으로 이전 버전으로 돌아갈 수 있어 유용합니다. 
 
 ### 저장소
 
 git을 사용함에 있어 저장소의 종류는 두가지, local repository와 remote repository가 있습니다. 
사용자는 remote repository를 local하게 내려받아 사용할 수 있고, 반대로 자신의 local repository 내용을 remote respository에 반영되도록 요청 혹은 업로드 할 수 있어요. 


### commit

git에 있어서 여러 파일들을 repository내에서 수정하게 될 것 인데, 이때 어떤 변경점이 있는지 수정하여 repository에 업로드하는 시점에 변경점에 대한 간단한 설명을 적어 표현 하는 것을 commit이라고 합니다. 

commit들은 시간 순으로 저장이 되며, 과거의 commit을 통해 해당 시점에 변경된 파일에 접근 할 수 있게 돼요. 

#### commit 작성 templet(git 권장)

1번째 줄 : 커밋 내의 변경 내용을 요약
2번째 줄 : 빈 칸
3번째 줄 : 변경한 이유

### work tree 와 index

변경된 파일들 중 일부만 commit을 하고 싶을 수 있는데 이때 index라는 개념이 사용이 돼요. 구조는 다음과 같습니다. 우리가 작업하는 공간인 work tree에서 변경한 파일 들이 있고 이중에서 commit을 할 파일들만 index에 등록을 해요. 그 후 index에 등론된 모든 파일을 repository에 commit을 하게 되는 것입니다. 

즉 index 공간에 등록을 하는 stage라는 단계를 통해 원하는 변경점만 선택적으로 commit을 할 수 있는 거에요. 

![](https://images.velog.io/images/chanyumoon/post/b80ee85f-7a0c-4238-b13f-8771fdabfda7/image.png)



출처:
https://backlog.com/git-tutorial/kr/