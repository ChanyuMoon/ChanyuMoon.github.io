---
layout: single
title: Manual, DeepLabCut
---

## DeepLabCut이란?  

DeepLabCut은 영상에 사용자가 관심을 가지는 특징점(keypoint)의 위치를 추정해주는 tool이다. 예를 들어 원숭이의 손이 무언가를 쥐는 영상이 있다고 생각을 해보자. 이때 우리는 이 영상에서 사람 손마디를 특징점으로 지정하고 이것의 위치를 표현하고 싶어한다. 이럴때 DeepLabCut을 사용할 수 있는 것이다.  

큰 workflow를 봄으로써 DeepLabCut을 이해해보자. 우선 DeepLabCut은 결국 모델을 학습하여 영상(input)을 특징점이 표시된 영상(outout)으로 만들어 주는 것이다. 그렇다면 어떻게 영상을 학습 하는 것일까?  

DeepLabCut에서는 각 영상을 frame 단위로 잘라서 그 순간순간의 사진을 뽑게 된다. 뽑힌 frame들을 k-mean과 같은 방법을 이용해 유사한 형태의 frame을 grouping 한 뒤 그 중 대표되는 frame을 선정하게 된다.  

이렇게 대표로 선정된 frame들이 일종의 training data 로써 사용되는데, 사용되기에 앞서 사용자가 원하는 keypoints을 직접 각 frame에 찍어주고 skeleton도 찍어주는 과정이 필요하다(skeleton은 optional하다). 이는 지도학습에서의 labeling이 된 train data를 만드는 과정과 동일하다.  

이렇게 만들어진 data set을 train data와 test data로 split을 한 후 train data와 test data로 model을 train 한다.  

## DeepLabCut 사용 manual  

지금 부터는 내가 DeepLabCut을 사용하면서 정리한 manual이다. 지속적으로 error나 지켜야할 rule 내지는 form 같은 것도 update 할 것이다.  

### 시작 전에  

시작하기 앞서 우선 내 컴퓨터에 GPU가 있는지 확인을 해보아야한다. 만약 노트북이라면 tensorflow로 model 학습을 하고 local 상에서는 돌릴 생각을 하지 않는 것이 좋다.  

아래의 manual은 학교에 존재한 workplace에서 local로 돌린 상황으로 추후에 notebook을 이용한 방식도 정리해보겠다.  

### Setup(Need to be updated)  

연구실의 workplace에는 이미 conda environment와 deeplabcut이 다 세팅이 되어있는 상태였다. 따라서 setting의 경우에는 notebook ver.을 진행하며 안내하겠다. 다만 크게 jupyternotebook을 이용해 project을 생성하고 이용하는 방식과 deeplabcut에서 만들어 놓은 program을 이용하는 방식이 있는데, **후자가 20000배 편리하고 직관적이여 추천**하나 **colab을 사용할때에는 jupyternotebook을 사용**해야 한다(애초에 코딩으로 deeplearning하는 곳이니..).  

세팅: https://github.com/DeepLabCut/DeepLabCut/blob/master/docs/installation.md  

### deeplabcut 실행  

우선 DLC-GPU 가상환경을 키자. DeepLabCut에서 conda를 추천하니 conda를 사용하자.  

anaconda prompt를 관리자 모드로 열어준다(이건 왜인지는 모르겠다).  

```
conda activate DLC-GPU
```  

그 후 deeplabcut을 실행한다.  

```
python -m deeplabcut
```  

잠시 기다리면 deeplabcut이 켜진다(이때 anaconda prompt에 무슨 message가 올라오는데 자세히 읽어보면 gpu가 있으면 무시해도 된다고 안내하므로 걱정할 필요없다).  

### 1. project manage  

우선 manage projects tab으로 들어가 project를 생성하거나 load 해주는데 중요한 것은 project name, experimenter name, video selection은 필수로 적어주어야 project가 생성된다.    

option으로 project를 어디에 생성할지 그리고 single/multi animal을 대상으로 할지도 정할 수 있다.  

### 2. edit config.yaml  

#### 일자를 영어로 수정  

다음 단계에 앞서 project의 정보들을 담고 있는 config.yaml file을 edit해야한다. 우선 일자가 한글로 적혀 있으면 무조건 영어로 바꾸어 주어야한다. 이렇게 해야 나중에 train을 하는 과정에서 error가 안뜨는 것 같다.  

예) 1월 12 -> jan12  

#### bodyparts 생성  

우리가 원하는 keypoints를 bodyparts 아래에 적어주면된다.  

이때 중요한 것은 **절대 겹치면 안된다.** 혹시 나중에 labeling 단계에서 bodyparts should be unique라는 문구와 함께 실행이 안된다.  

**한 번더 확인하자, bodyparts 는 unique해야 한다(나 정말 개고생했으니 한번 더 확인해보자).**  

#### skeleton  

skeleton의 경우 당장 적어주지 않아도 된다. 적는 것 보다 나중에 labeling 단계에서 나오는 ui로 보면서 연결하는 것이 훨씬 편하다.  

### 3. labeling  

이제 labeling tab을 눌러 labeling button을 누른다. 그러면 label을 할 frame이 들어있는 폴더를 선택하여 labeling을 시작한다. 이때 손수 일일이 keypoints를 찍어주면서 labeling을 한다.  

labeling이 끝나면 skeleton button을 눌러서 나오는 img에 keypoints를 이어준다. 이때 왼쪽 클릭을 누르면 선이 생겨 연결이 가능하고, 오른 클릭으로 줄을 지나면 두 keypoinys사이의 연결을 끊을 수 있다.  

### 4. train test data split  

다음으로 data를 만드는 tab을 눌러 train test data split을 진행한다.  

### 5. training  

이제 training step이다. 여기서는 어떤 model을 사용할 것인지 그리고 data agumentation logic을 무엇을 사용할지 선택하여 train을 시작하면 된다.  
