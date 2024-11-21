---
layout: single
title: Nordic development setting in Mac
categories: Embedded_systems
tags:
  - Nordic
  - Embedded_systems
modified: 2024-02-27
---

# Intro 
이번에 brain stimulation/recodring system을 만드는 과제를 맡게 되었다. Benchmark 할 논문에서 stimulation/recodring system을 위해 nRF52840 DK 보드를 micro controller로서 사용했다. 우선 이 논문의 시스템을 modify 하기 위해서 bluetooth 통신을 하는 nRF52840 DK와 wifi 를 지원하는 nRF7002 DK를 구매하였다. 

해당 보드에 project를 build 하고 load 하기 위한 development setting을 해보자. 

[공식 tutorial (nRF52)](https://docs.nordicsemi.com/bundle/ncs-latest/page/nrf/device_guides/working_with_nrf/nrf52/gs.html)에서 볼 수 있듯이 자체 프로그램을 사용하거나, vscode extention을 사용하는 방법이 있다. 나는 vscode가 편하니 후자의 방법으로 세팅을 하였다. 

# Installation 
[nRF connect for vscode: installation](https://youtu.be/EAJdOqsL9m8?si=0nqYFHkAtuFgzfDp) 영상에서 자세한 설치 방법을 알 수 있다. 짧게 정리해보면 nRFcommand line tools를 다운하고, vscode extension을 다운하면 준비는 끝이다.  

우선, 영상에서와 같이 nRF Command line tools를 다운 받고, nRF tools와 Jlink를 모두 설치한다. 

![nRF command tools 설치 (mac)](/assets/images/2024-02-27-Nordic_nRF_dev_setting/nRF_command_line_tool_install.png) 

이후 vscode에서 nRFconnect for VS code extension Pack을 설치 하면 준비는 다 되었다.

# Sample code & Build & flash

[nRF Connect for VS Code, part 2: Creating an application](https://youtu.be/T4RfflybIGE?si=5d-pas20X_DjSOqY) 

[nRF Connect for VS Code, part 3: Building an application](https://youtu.be/N1kDSMBtQ2U?si=0MfOpSXGaJhWjH53) 

[nRF Connect for VS Code, part 4: Flashing an application](https://youtu.be/qjVvfU6ShUU?si=2zR_m0aYxz0Ht226)  
영상을 순서 대로 따라하며 여러 sample 코드를 보드에 flash 하고 실행해본다.  

필자의 경우에는 J-Link를 설치하지 않아 error 가 떴었다. 반드시 모든 파일을 다 설치하도록 하자. 

# 마치며
Extension을 통해 생각보다 간편하게 setting을 완료 할 수 있었다. 심지어 configure 파일은 GUI로도 변경할 수 있다. 

