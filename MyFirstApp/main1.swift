//
//  PracticeSwift.swift
//  MyFirstApp
//
//  Created by yunseungwon on 2022/10/18.
//

import Foundation


// 변수는 var로 선언, 상수는 let으로 선언
// Swift는 정적 타이핑 언어로, 변수나 상수를 정의할 때 그 자료형(타입)이 어떤 것인지 명시해주어야 하는 언어
var name: String = "YSW" // " : String "  -> Type Annotation
let birthyear: Int = 1995

// Swift는 타입을 굉장히 엄격하게 다루기 때문에, float + int 와 같은 기본적인 연산조차 x
let height: Float = 12.15
// birthyear + height // 컴파일 에러
// (Float)birthyear + height // OK

// Array and Dictionary
var langauges = ["Swift", "Objective-C", "Python"]

var capitals = [
    
    "한국":"서울",
    "미국":"워싱턴",
    "일본":"도쿄",
]


// 타입 정의
var capitals2: [String: String] = [
    
    "한국":"서울",
    "미국":"워싱턴",
    "일본":"도쿄"
]

// 빈배열 및 빈딕셔너리 정의
var l: [String] = []

// 빈배열을 좀더 간결하게?
var l2 = [String]()

// 조건문과 반복문
var age = 19;
var student = "";


if age >= 8 && age < 14 {
    student = "초등학생";
} else if age < 17 {
    student = "중학생"
} else {
    student = "기타"
}

// Optional
// Swift에서 값이 없는 경우를 나타낼 때는 nil 을 사용
// 자바와는 다르게 Swift에서는 ""도 값이 있는 경우로 침

// 값이 있일 수도 있고, 없을 수도 있는 변수를 정의할 때는 타입 어노테이션에 ?를 붙여야 함

// 옵셔널에 초기값을 지정하지 않으면, default nil
var email: String?
print(email) // nil

email = "tasdfa@naverm"
print(email)

//옵셔널로 정의한 변수는 옵셔널이 아닌 변수와는 다름
let aaa: String? = "ddd"
// let rrr: String = aaa // Compile. error


// Optional -----> any (String, Int, ....) or nil

// Optional Binding
let optionalEmail : String? = "tmd@naver.com"

if let email = optionalEmail {
    
    print(email) // optionalEmail의 값이 존재한다면 해당 값이 출력됨
}
// optionalEmail 값이 존재하지 않는다면, if 문을 그냥 지나침


// 하나의 if문에서 콤마로 구분하여 여러 옵셔널을 바인딩할 수 있음
var optionalEmail2 : String? = "tmd@naver.com"
var optionalEmai3 : String? = "tmd@naver.com"

if let name = optionalEmail2,
   let email = optionalEmai3 { // 두번째 let은 생략 가능?????
    // a, b 값이 존재
}

// Optional Chaining
let array: [String]? = []
var isEmptyArray = false

if let array = array, array.isEmpty{
    isEmptyArray = true
} else {
    isEmptyArray = false
}

// after Optional Chaning
let isEmtyArray = array?.isEmpty == true

//옵셔널 체이닝은 옵셔널의 속성에 접근할 때, 옵셔널 바인딩 과정을 ? 키워드로 줄여주는 역할
// 1. array가 nil인 경우 -> array?.isEmpty --------------> 'nil' 반환
// 2. array가 빈배열인 경우 -> array?.isEmpty ------------> 'true' 반환
// 3. array에 요소가 있는 경우 -> array?.isEmpty -----------> 'false'반환

// 옵셔널 벗기기
// 옵서녈에 값이 있다고 가정하고 값에 바로 접근할 수 있게 해주는 키워드 ! 를 붙여 사용
print(optionalEmail) // Optional("~~~@naver.com")
print(optionalEmail!) // "~~~@naver.com")

// !을 사용할떄 주의할 점은, 옵셔널의 값이 nil의 경우에는 런타임 에러가 발생 -> 자바의 NullPointerException과 비슷
// 런타임 에러가 발생하면 iOS앱은 강재로 종료(크래시)됨 -> 굉장히 조심해서 사용할 것

// 가급적이면 일반적인 옵셔널을 사용해서 정의하고, 옵셔널 바인딩 또는 옵셔널 체이닝을 통해 값에 접근하는 것이 더 바람직 함























