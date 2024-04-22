# Gofferwall for iOS Integration
[![GitHub package.json version](https://img.shields.io/badge/Unity-1.2.0-blue)](https://github.com/Gofferwall/Gofferwall-Unity-UPM)
[![GitHub package.json version](https://img.shields.io/badge/Android-1.2.0-blue)](https://github.com/Gofferwall/Gofferwall-Android-Sample)
[![GitHub package.json version](https://img.shields.io/badge/iOS-1.2.0-blue)](../../releases)

- iOS 12.0 + / iPadOS 13.0 + / Xcode 14.3 +
<br/>

## Contents
#### [Installation](#installation-1)
- [1. CocoaPods](#1-cocoapods)
#### [Setup Xcode](#setup-xcode-1)
- [1. info.plist 수정](#1-infoplist-수정)
#### [Gofferwall Overview](#gofferwall-overview-1)
- [1. Import](#1-import)
- [2. Initialize](#2-initialize)
- [3. 사용자 정보 설정](#3-사용자-정보-설정)
- [4. Offerwall](#4-offerwall)
#### [Gofferwall Server 연동하기](./blob/main/reward_callback_info.md)
#### [Gofferwall Error Information](./blob/main/api_documentation.md#model)
#### [Xcode15 Sandbox Error](#xcode15-sandbox-error-1)
<br/><br/><br/>

## Installation
### 1. CocoaPods
- CocoaPods는 Cocoa Projects의 Dependency를 관리할 수 있음

#### A. CocoaPods Install
```csharp
gem install cocoapods
```
- 명령어를 사용하여 설치 진행
<br/><br/>

#### B. Podfile
```csharp
# source 'https://github.com/CocoaPods/Specs.git' // 제한망 or install error시 추가
platform :ios, '12.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'Gofferwall', '1.2.0'
end
```
- CocoaPods의 Xcode Project내에 Podfile에서 기술
<br/><br/>

#### C. Pod Install
```csharp
pod install --repo-update
```
- 다음의 명령어를 실행해서 Library를 Xcode Project로 추가
<br/><br/><br/>

## Setup Xcode
### 1. info.plist 수정
#### A. GofferwallMediaId, GofferwallMediaSecret 추가
```csharp
<key>GofferwallMediaId</key>
<string></string>
<key>GofferwallMediaSecret</key>
<string></string>
```
<br/>

#### B. App Tracking Permission 추가
```csharp
<key>NSUserTrackingUsageDescription</key>
<string></string>
```
<br/><br/><br/>

# Gofferwall Overview
## 1. Import
```swift
import Gofferwall
```
<br/><br/>

## 2. Initialize
### A. Code에서 Media 없이 Initialize 방법
```swift
GofferwallInterface.sharedInstance().initialize(self)
```
- Build된 Project에서 `Info.plist` 파일에서 `GofferwallMediaId`가 있어야 함 ([Info.plist 확인](./#a-gofferwallmediaid-gofferwallmediasecret-추가))
- App 실행 시 1회 설정 권장
<br/><br/>

### B. Code에서 직접 Media 넣어서 Initialize 방법
```swift
let MEDIA_ID = "";        // 관리자를 통해 발급
let MEDIA_SECRET = "";    // 관리자를 통해 발급
GofferwallInterface.sharedInstance().initialize(MEDIA_ID, mediaSecret: MEDIA_SECRET, delegate: self)
```
- App 실행 시 1회 설정 권장
<br/><br/>

### C. Callbacks
```swift
func onInitialized(_ isSuccess: Bool) {
    if (isSuccess) {
        // Initialize Call Back
    } else {
        // Initialize Fail
    }
}
```
<br/><br/>

## 3. 사용자 정보 설정
```swift
let USER_ID = "";        // set unique user id to identify the user in reward information
GofferwallInterface.sharedInstance().setUserId(USER_ID);
```
- `Offerwall`를 사용하기 위해 ${\color{red}필수}$ 설정
- 64자까지 설정 가능
<br/><br/><br/>

## 4. Offerwall
### A. Global Show
```swift
let OFFERWALL_UNIT_ID = "";      // 관리자를 통해 발급
GofferwallInterface.sharedInstance().showOfferwall(OFFERWALL_UNIT_ID, delegate: self)
```
- Gofferwall 의 Offerwall ViewController 를 IP로 국내(TNK)/국외(Tapjoy)를 구분하여 Display
- `Show`가 실행되면 `onOfferwallAdOpened`와 `onOfferwallAdFailedToShow` 중 하나가 항상 호출
<br/><br/>

### B. TNK Show
```swift
let OFFERWALL_UNIT_ID = "";      // 관리자를 통해 발급
GofferwallInterface.sharedInstance().showOfferwall4TNK(OFFERWALL_UNIT_ID, delegate: self)
```
- Gofferwall 의 TNK Offerwall ViewController 를 Display
- `Show`가 실행되면 `onOfferwallAdOpened`와 `onOfferwallAdFailedToShow` 중 하나가 항상 호출
<br/><br/>

### C. Tapjoy Show
```swift
let OFFERWALL_UNIT_ID = "";      // 관리자를 통해 발급
GofferwallInterface.sharedInstance().showOfferwall4Tapjoy(OFFERWALL_UNIT_ID, delegate: self)
```
- Gofferwall 의 Tapjoy Offerwall ViewController 를 Display
- `Show`가 실행되면 `onOfferwallAdOpened`와 `onOfferwallAdFailedToShow` 중 하나가 항상 호출
<br/><br/>

### D. Callbacks
```swift
func onOfferwallAdOpened(_ unitID: String!) {
    // Offerwall이 열림
}
func onOfferwallAdFailed(toShow unitID: String!, error: GofferwallError!) {
    // Offerwall이 Fail
}
```
<br/><br/>

# [Gofferwall Server 연동하기](./blob/main/reward_callback_info.md)
<br/><br/><br/>

# Gofferwall Error Information
- [Error 정보](./blob/main/api_documentation.md#model)
<br/><br/><br/>

# Xcode15 Sandbox Error
- TARGETS -> Build Settings -> ENABLE_USER_SCRIPT_SANDBOXING 값을 `NO`로 변경

