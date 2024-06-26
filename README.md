# spring Boot를 이용한, 치킨 mes 프로젝트
![image](https://github.com/wououoo/project_chicken/blob/main/%EC%B5%9C%EC%A2%85%EB%B3%B8/kammi/src/main/resources/static/img/mainlogo/mainLogo2.png)

<br>

## 📌 목차
1. [🖥️ 프로젝트 개요](#프로젝트-개요)
2. [📕 주요기능](#주요기능)
3. [🔧 아키텍처](#아키텍처)
4. [🏗️ ERD](#erd)
5. [📽️ 작동 영상](#작동-영상)
   <br><br>

## 🖥️ 프로젝트 개요
### ⏲️ 프로젝트 개발 기간
  - 2024.03.28 ~ 2024.04.25
    ![일정](https://github.com/wououoo/project_chicken/assets/156730657/abd2d497-9fe0-4518-bcdf-439ffaee9eac)


### 🔖프로젝트 주제
  - 대상: 치킨 프렌차이즈를 운영하는 본사
  - 용도: 구매 → 생산 → 판매 프로세스를 효율적, 체계적으로 관리할 수 있는 시스템
  - 개발: SpringBoot(Maven Project), mvc패턴을 이용하여 개발
    
### 📁프로젝트 구현 내용
  - 제조 회사의 구성원 별 권한 제한 및 프로세스 별 데이터의 CRUD 기능 구현

### ⚙ 개발환경 및 도구
  - `JAVA 17`
  - `JDK 17.0.2`
  - **IDE**: IntelliJ
  - **Framework**: Springboot(3.0.9)
  - **DataBase**: Oracle DB(ojdbc8)
  - **ORM**: Mybatis
  - **DevOps**: Maven, Git, GitHub
  - **Tools**: Discord, GoogleDrive, StarUML
    
### 🧑‍🤝‍🧑 담당업무
|팀원명|프로필|담당업무|
|---|---|---|
|[우경주<br>(팀원)](https://github.com/wououoo)|<p align="center"><img src="https://github.com/heyJSH/Project-Meal_Kit_SpringBoot/assets/150403977/2bdb07d5-ae47-44f5-89dd-6335d7030ca3" width="100"></p>|제조 시스템 설계<br>레시피, BOM, 제작지시, 제조수행|

<br><br>


## 📕 업무별 상세사항
치킨을 생산/제조하는 업체에서 자원관리를 위해 사용하는 프로그램을 제공한다.

<details>
  <summary><b>1. 구매관리</b> (👈 Click)</summary>
   <br>
  <div markdown="1">
     <h3>레시피</h3>
    <ul>
       <li>DB에 등록된 레시피와 그에 맞는 사진을 출력한다.</li>
       <img src="https://github.com/wououoo/project_chicken/assets/156730657/101c0fa7-49b6-4a4e-97f2-84ede97cf37f" alt="레시피 메인">
       <br>
        <li>레시피 페이지 아래 등록 버튼을 클릭 시 다음과 같은 모달이 출력된다.</li>
       <img src="https://github.com/wououoo/project_chicken/assets/156730657/59f17eee-91f8-438f-9aab-05a2bb2730f9" alt="레시피 등록">
           <ol>
              <li>첫번째 레시피 등록에 레시피명, 사진을 추가하면 두번째 모달이 나온다</li>       
              <br>
              <li>BOM을 등록할 수 있으며 필요 시 추가 버튼을 클릭하여 여러개의 BOM을 다중 등록할 수 있다</li>
           </ol>
       <br>
       <li>레시피 사진을 클릭할 경우 다음과 같은 모달이 출력된다</li>
       <img src="https://github.com/wououoo/project_chicken/assets/156730657/99f46e16-afd4-4941-b41b-cf31b1107c90" alt="레시피 상세">
            <ol>
              <li>레시피 정보 및 BOM정보를 수정, 삭제할 수 있다</li>       
              <br>
              <li>데이터 추가 버튼 클릭 시 BOM을 추가할 수 있는 모달로 변경된다</li>
           </ol>
       <br>
    </ul>
  </div>
</details>

<details>
  <summary><b>2. 제조지시</b> (👈 Click)</summary>
   <br>
  <div markdown="2">
     <h3>제조지시</h3>
    <ul>
       <li>제조를 지시한 현황을 보여주는 페이지가 출력된다</li>
       <img src="https://github.com/wououoo/project_chicken/assets/156730657/006dce3f-8ec4-455f-896d-658ca185ee45" alt="제조지시 메인">
       <br>
        <li>지시 버튼 클릭 시 제조를 지시할 수 있는 모달이 출력된다</li>
       <img src="https://github.com/wououoo/project_chicken/assets/156730657/22ed5bf9-b5e7-4e86-b633-715c1ee507ab" alt="제조지시">
           <ol>
              <li>레시피로 등록된 정보만 SELECT 박스에서 선택가능</li>       
           </ol>
       <br>
       <li>제조지시 페이지에서 지시한 현황을 클릭 시 제조지시 상세화면 모달 출력</li>
       <img src="https://github.com/wououoo/project_chicken/assets/156730657/8d88acc3-e95a-478d-bf1b-a79c644a654c" alt="지시 상세">
            <ol>
              <li>지시한 생산량만 수정이 가능</li>       
              <br>
              <li>제조 수행이 실행된 경우 수정 불가</li>
           </ol>
       <br>
    </ul>
  </div>
</details>

<details>
  <summary><b>3. 제조수행</b> (👈 Click)</summary>
   <br>
  <div markdown="3">
     <h3>제조지시</h3>
    <ul>
       <li>제조를 수행한 현황을 보여주는 페이지가 출력된다</li>
       <img src="https://github.com/wououoo/project_chicken/assets/156730657/f0697337-982c-47cc-b7c1-b2a0b1321acd" alt="제조수행 메인">
       <br>
        <li>수행 버튼 클릭 시 제조를 수행할 수 있는 모달이 출력된다</li>
       <img src="https://github.com/wououoo/project_chicken/assets/156730657/b8f9890e-1f21-49e3-9f80-647e30faf7f8" alt="제조수행">
           <ol>
              <li>지시한 품목을 SELECT 박스에서 선택</li>       
              <li>제조 라인 선택(1,2,3번 라인)</li> 
              <li>제조할 수량 선택(지시한 수량을 넘을 수 없음)</li> 
          </ol>
       <br> 
       <li>제조수행 페이지에서 수행 현황을 클릭 시 제조지시 상세화면 모달 출력</li>
       <img src="https://github.com/wououoo/project_chicken/assets/156730657/95aff1e3-971f-4aad-a56a-f3818f423784" alt="수행 상세">
            <ol>
              <li>제조라인, 생산량, 수행자만 수정가능</li>       
              <br>
              <li>만약 라인 및 수행자가 다른 공정을 수행중이라면 수정할 수 없음</li>
              <br>
              <li>작업수행 버튼 클릭 시 차례대로 시작시간, 염지, 조리, 양념, 포장, 종료시간 순서대로 시간이 출력</li>
              <br>
              <li>작업수행이 시작되었을 경우 수정 불가 </li>               
           </ol>
       <br>
    </ul>
  </div>
</details>
<details>
  <summary><b>4. 페이지</b> (👈 Click)</summary>
   <br>
  <div markdown="4">
     <h3>페이징처리</h3>
    <ul>
       <li>제조지시 및 제조수행 페이지는 페이징처리가 되어있고, 5개씩 보이며 선택조건으로 각각 제조상태, 제조라인을 기준으로 검색할 수 있다</li>
        <img src="https://github.com/wououoo/project_chicken/assets/156730657/f7346ecb-e4e7-4948-b050-a60cb3ce3668" alt="페이징">
    </ul>
  </div>
</details>


<br><br>

## 🔧 아키텍처
![image](https://github.com/heyJSH/Project-Meal_Kit/assets/151722511/c95a5896-9d37-44d8-a89f-034644dfeea4)
<br><br>

## 🏗️ ERD
DB와 ERD <br>
![image](https://github.com/wououoo/project_chicken/assets/156730657/4b4fc4af-4cc2-4dad-a3ba-48dce380052c)
<br><br>



