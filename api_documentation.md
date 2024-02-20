# Gofferwall SDK Documentation for iOS
## Contents
#### [Interface](#interface-1)
- [Core](#core)
  - sharedInstance
  - initialize:mediaId:mediaSecret:delegate
  - initialize:delegate
  - setUserId:userID
  - getSDKVersion
- [Offerwall](#offerwall)
  - showOfferWall:unitID:delegate
  - showOfferwall4TNK:unitID:delegate
  - showOfferwall4Tapjoy:unitID:delegate
#### [Callback](#callback-1)
- [Core](#core-1)
  - onInitializedCallback:isSuccess
- [Offerwall](#offerwall-1)
  - onOfferwallAdOpened:unitId
  - onOfferwallAdFailedToShow:unitId:error
#### [Model](#model-1)
- GofferwallError

<br><br><br>

### Interface
#### Core
##### + (instancetype)sharedInstance
- Gofferwall Interface의 singleton 객체를 가져옵니다.
<br><br>

##### - (void)initialize:mediaId:mediaSecret:delegate
- Gofferwall SDK 초기화를 진행합니다.

| Parameters     |              |
| ----------- | ------------------------------------------------------------ |
| mediaId     | Amdin page에서 등록한 해당 application에 대한 ID                  |
| mediaSecret | mediaId에 대응되는 Secret key                                  |
| delegate    | Delegate callbacks을 위한 delegate                            |

<br>

##### - (void)initialize:delegate
- Gofferwall SDK 초기화를 진행합니다.

| Parameters     |              |
| ----------- | ------------------------------------------------------------ |
| delegate    | Delegate callbacks을 위한 delegate                            |

<br>

##### - (BOOL)setUserId:userID
- Application 사용자의 Unique Id를 설정. 이 정보는 reward 지급 등에 있어 사용자를 구분하는데 사용합니다.<br>
※ 만일 서비스에서 한 사람당 N개의 계정 사용이 가능한 경우, 계정 변경 시 `setUserId` 호출로 애디스콥에 변경 정보를 전달해주어야 합니다.
  그렇지 않을 경우 변경된 계정 정보로 보상 지급이 되지 않으니 유의해주세요.
⚠️ UserID의 최대 길이는 64자 입니다.

| Parameters |                     |
| ---------- | ------------------- |
| userId     | 고유한 유저의 ID 값 |

| Return     |                                     |
| ---------- | ----------------------------------- |
| isSuccesss | UserID의 형식이 잘못 되었을 경우 NO |

<br>

##### - (NSString \*)getSDKVersion
- Gofferwall SDK Version 을 확인합니다.

| Return     |                              |
| :--------- | ---------------------------- |
| NSString * | Gofferwall.framework의 Version |

<br>

#### Offerwall
##### - (BOOL)showOfferWall:unitID:delegate
- Gofferwall 의 Offerwall ViewController 를 IP로 국내(TNK)/국외(Tapjoy)를 구분하여 Display 합니다.
- GofferwallDelegate의 onOfferwallAdOpened(), onOfferwallAdFailedToShow() callbacks을 통해 Offerwall ViewController 의 Open, Fail 정보를 얻습니다.
⚠️ `initialize:mediaId:mediaSecret:delegate` 가 먼저 호출되어야 합니다.

| Parameters |                           |
| ---------- | ------------------------- |
| unitId     | 보여질 Offerwall의 UnitID |
| delegate   | Delegate callbacks을 위한 delegate |

| Return     |                              |
| ---------- | ---------------------------- |
| isSuccesss | UnitID이 잘못 되었을 경우 NO |

<br>

##### - (BOOL)showOfferwall4TNK:unitID:delegate
- Gofferwall 의 TNK Offerwall ViewController 를 Display 합니다.
- GofferwallDelegate의 onOfferwallAdOpened(), onOfferwallAdFailedToShow() callbacks을 통해 Offerwall ViewController 의 Open, Fail 정보를 얻습니다.
⚠️ `initialize:mediaId:mediaSecret:delegate` 가 먼저 호출되어야 합니다.

| Parameters |                           |
| ---------- | ------------------------- |
| unitId     | 보여질 Offerwall의 UnitID |
| delegate   | Delegate callbacks을 위한 delegate |

| Return     |                              |
| ---------- | ---------------------------- |
| isSuccesss | UnitID이 잘못 되었을 경우 NO |

<br>

##### - (BOOL)showOfferwall4Tapjoy:unitID:delegate
- Gofferwall 의 Tapjoy Offerwall ViewController 를 Display 합니다.
- GofferwallDelegate의 onOfferwallAdOpened(), onOfferwallAdFailedToShow() callbacks을 통해 Offerwall ViewController 의 Open, Fail 정보를 얻습니다.
⚠️ `initialize:mediaId:mediaSecret:delegate` 가 먼저 호출되어야 합니다.

| Parameters |                           |
| ---------- | ------------------------- |
| unitId     | 보여질 Offerwall의 UnitID |
| delegate   | Delegate callbacks을 위한 delegate |

| Return     |                              |
| ---------- | ---------------------------- |
| isSuccesss | UnitID이 잘못 되었을 경우 NO |

<br><br>

### Callback
#### Core
##### onInitializedCallback:isSuccess
- init을 진행한 후, 발생됩니다.

| Parameters |                        |
| :--------- | ---------------------- |
| isSuccess  | Initialize의 성공 결과 |

<br>

#### Offerwall
##### onOfferwallAdOpened:unitID
- Offerwall이 open 되었을 때 발생됩니다.

| Parameters |                         |
| :--------- | ----------------------- |
| unitID     | Open된 UnitID           |

<br>

##### onOfferwallAdFailedToShow:unitID:error
- Offerwall이 open 되었을 때 발생됩니다.

| Parameters |                         |
| :--------- | ----------------------- |
| unitID | Show를 요청한 UnitID |
| error      | GofferwallError 참조      |

<br><br>

### Model
##### GofferwallError

| Variable    | Description                      |
| :---------- | -------------------------------- |
| code        | error's code (GofferwallErrorCode) |
| description | error's description              |

| Error Code       | Cause | Instruction |
| ---------------- | ----- | ----------- |
| INTERNAL_ERROR   | Gofferwall Sdk 내부 오류 혹은 Gofferwall Server 오류 | 지속적으로 발생 시 Gofferwall 개발팀에 문의 |
| MEDIATION_ERROR  | Mediation 광고 Network의 3rd party sdk 오류 | 지속적으로 발생 시 Gofferwall 개발팀에 문의 |
| INITIALIZE_ERROR | Gofferwall.Sdk.Initialize 시 mediaId/mediaSecret이 유효하지 않음 | Adiscope admin page에서 등록된 media (application)의 id와 secret을 확인 |
| SERVER_SETTING_ERROR | 광고를 보여주기 위해 필요한 내부 설정값 오류. Adiscope admin 설정의 수익화, 유닛 활성화가 OFF인 경우 | Adiscope admin page의 설정 확인 |
| INVALID_REQUEST | Show시, 입력한 unitId 오류 | Adiscope admin page에 정의된 각 unitId를 다시 확인 후 Show()에 입력 |
| NETWORK_ERROR | Network read/write timed out 혹은 Network connection 오류 | Device의 network 연결 상태를 확인 |
| USER_SETTING_ERROR | 오퍼월 Show를 호출했는데 userId 세팅이 안 되어 있는 경우 | setUserId 호출 확인 |
