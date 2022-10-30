---
layout: post
title: 폴더 경로 포함 자동화
---

# 폴더 경로 포함 자동화

## matlabpath

matlabpath 을 command window에 치면 matlab이 function을 찾는 path를 볼 수 있다. Matlab은 .m으로 작성된 file의 이름을 입력함으로써 해당 file을 실행할 수 있다. 다만 다른 언어들과 다른 점은 다른 directory에 포함된 file이름이라면 중복을 구분하지 않는다. 이말은 즉슨 path에 존재하는 동일한 file.m이 두개 있다면 먼저 나온 file 만을 실행한다. 

따라서 이런 중복을 manage하기 위해서 matlabpath 자체에 directory를 추가, 제거하는 방식을 사용한다. 

하지만 matlab 실행 마다 file path을 더해주는 것을 수작업을 하기에는 너무 귀찮다. 따라서 이를 code로써 자동화 할 수 있는 함수를 알아보자. 

### addpath, genpath

1. addpath(filepath)
    
    filepath(char): matlabpath에 filepath을 추가한다.
    
2. genpath(dirpath)
    
    dir 하부에 모든 file path들을 ;로 분리한 char 형태로 출력함. 
    
    ex)
    
    - dir1
        - file1-1
        - dir2
            - file2-1
    
    → ‘.\dir\file1-1;.\dir1\dir2\file2-1;
