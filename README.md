# OGADA

패스트 캠퍼스에서 진행한 팀 프로젝트 입니다.

장소 검색을 통해 여행 동선을 계획하고 기록하며 예산을 설정하고 지출을 관리합니다.





## Description

- 개발 기간: 2020.03.09~ 2020.03.13 (5일)
- 참여 인원: iOS 3명 [Team repository⬅️](https://github.com/JoongChangYang/OGADA_iOS)
- 사용 기술
  - Language: Swift5
  - Framework: UIKit, MapKit
  - Open API: GooglePlaces
- 담당 구현 파트
  - 여행 동선 



## Views

<img src = "https://github.com/JoongChangYang/OGADA_iOS/blob/master/assets/OGADA_synthesize.png"></img>

## Implementation

### 여행 동선

<img src = "https://github.com/JoongChangYang/OGADA_iOS/blob/master/assets/movingline.gif"></img>

- GooglePlaces를 이용하여 가고싶은 지역을 검색하고 동선에 추가, 저장

  - GooglePlaces `GMSAutocompleteResultsViewController` class를 사용하여 장소 검색 자동완성 구현

  - 기존의 동선에 원하는 순서에 삽입

  

- 동선을 날짜 별로 관리하고 방문한 장소를 표시

  - `MKMapView`

    - 방문한 장소: 깃발 `⚑` 이미지로 커스텀한 `Annotation`으로 표현

    - 방문하지 않은 장소: 기본 `MKAnnotation`으로 표현

  - `UITableView` 

    - `UITableViewCell`
      - title: 장소 이름
      - subtitle: 주소
      - 좌측 원형 숫자 뷰: 동선의 순서
      - `SwipeAction`을 통해 동선 수정, 삭제

    - 방문한 장소: 푸른색의 원형 숫자 뷰로 표현
    - 방문하지 않은 장소: 붉은색의 원형 숫자 뷰로 표현

    

- 선택한 장소로 `MKMapView` 이동 

  - `UITableViewCell`을 클릭하면 해당 장소로 `MKMapView` 이동
  - 선택한 cell이 없는 경우 모든 `Annotation`이 보일 수 있도록 `MKMapView`세팅

- 트러블 슈팅

  - 장소를 선택하지 않은 상황에서 전체 장소들의 `MKPointAnnotation`들을 모두 보여주려고 했으나 어떻게 보여줘야할지 애매한 문제

    - `MKMapView`의 `region`의 `center`를 모든 장소의 위도, 경도의 평균으로 지정

      

  - `MKMapView`의 `center`를 위경도의 평균으로 잡은것 까진 좋았지만 `MKMapView`의 확대 정도를 어느정도로 해야 할지 애매함

    - 여러개의 장소들 중 가장 위도의 차이가 큰 두 장소의 위도의 차이, 동일하게 경도의 차이, 두가지 수치를 구해 `MKCoordinateSpan` 세팅