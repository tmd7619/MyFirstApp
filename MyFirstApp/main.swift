

//
//  func.swift
//  MyFirstApp
//
//  Created by yunseungwon on 2022/10/18.
//

import Foundation

/**
 함수와 클로저
 */

func hello(name: String, time: Int) -> String {
    
    var str = ""
    for _ in 0..<time {
        str += "\(name)님 안녕하세요!\n"
    }
    
    return str
}
// Swift에서는 독특하게 함수를 호출할 때 파라미터 이름을 함께 써줘야함
hello(name: "전수열" , time: 3)

// 함수를 호출할때 사용하는 파라미터 이름과 함수 내부에서 사용하는 파라미터 이름을 다르게 하고 싶다면?
func hello2(to name: String, numberOfTimes time: Int){
    // 함수 내부에서는 name과 time을 사용
    for _ in 0..<time{
        print(name)
    }
    
}
hello2(to: "전수열", numberOfTimes: 3)

// 파라미터 이름을 _로 정의하면 함수를 호출할 때 파라미터 이름 생략 가능
func hello3(_ name : String , time: Int){
    
    // ....
    
}
hello3("전수열", time: 3)

// 파라미터의 기본값 지정, 지정 시 파라미터 생략 가능
func hello4(name: String, time: Int = 1){
    ///
    
}
hello4(name: "전수열")


// ... 을 사용하면 개수가 정해지지 않은 파라미터(Variadic Parameters)를 받을 수 있음
func sum(_ numbers: Int...) -> Int{
    var sum = 0
    for number in numbers{
        sum += number
    }
    
    return sum
}

sum(1,2)
sum(3,4,5)

func helloGenerator(message: String) -> (String, String) -> String {
    func hello(firstName: String, lastName: String) -> String {
        return lastName + firstName + message
    }
    return hello
}

let hello = helloGenerator(message: "님 안녕하세요!")
hello("수열", "전")



// Closure -> 중괄호로 감싸진 실행 가능한 코드 블럭
/*
 Closure 문법 특징
 1. 익명 함수인 만큼 func란 키워드를 쓰지 않음
 2. { (Parameters) -> Return Type in
 실행구문
 }
 3. Parameter와 return type이 둘다 없는 클로저?
 let closure = { () -> () in print("Closure")
 }
 4. 파라미터와 리턴타입이 둘다 있는 클로저?
 let closure = { (name: String) -> String in
 return "Hello, \(name)"
 }
 5. 클로저에선 Argument Label을 사용하지 않음 -> 따라서 4번의 name은 Argument Label이 아니고 Parameter Name
 6. 함수의 파라미터 타입으로 클로저를 전달할 수 있음
 func doSomething(closure: () -> ()){
 closure()
 }
 
 
 
 */


// 클로저 기본 문법 (하나도 생략이 안된)
func helloGenerator2(message: String) -> (String, String) -> String {
    return { (firstName: String, lastName: String) -> String in
        return lastName + firstName + message
    }
}

// 타입 추론에 의해 반환 타입 생략 // 첫째줄에 -> (String, String) 이 부분으로 반환 타입을 추론할 수 있기에, 두번째 줄 타입 생략
func helloGenerator3(message: String) -> (String, String) -> String {
    return { firstName, lastName in
        return lastName + firstName + message
    }
}

// 타입추런에 의해 파라미터가 문자열인 걸 알 수 있음 -> 변수명 생략
func helloGenerator4(message: String) -> (String, String) -> String{
    return {
        return $1 + $0 + message
    }
}

// 클로저의 내부가 한줄이라면, return 까지도 생략이 가능함
func helloGenerator5(message: String) -> (String, String) -> String{
    return { $1 + $0 + message}
}

// 클로저는 변수처럼 정의할 수 있음
let hello5: (String, String) -> String = { $1 + $0 + "님 안녕하세요!"}
hello5("수열", "전")

/*
 클래스와 구조체
 클래스는 상속이 가능, 구조체는 불가능
 
 */

class Dog {
    var name : String?
    var age : Int?
    
    func simpleDescription() -> String {
        if let name = self.name {   //self.프로퍼티명 // 클래스나 구조체 자신의 인스턴스에 속한 프로퍼티
            return "\(name)"
        } else {
            return "No name"
        }
    }
    
}

struct Coffee {
    var name: String?
    var size: String?
    
    func simpleDescription() -> String {
        if let name = self.name {
            return "= \(name)"
        } else {
            return "= No name"
        }
    }
}

var myDog = Dog() // 인스턴스 초기화
myDog.name = "찡코"
myDog.age = 3
print(myDog.simpleDescription()) // 찡코

var myCoffee = Coffee()
myCoffee.name = "아메리카노"
myCoffee.size = "Venti";
print(myCoffee.simpleDescription()) // = 아메리카노

// 클래스는 상속이 가능하지만, 구조체는 불가능
class Animal {
    let numberOfLegs = 4
}

class Dog2: Animal {
    var name: String?
    var age: Int?

}
var myDog2 = Dog2()
print(myDog2.numberOfLegs) // Animal 클래스로부터 상속받은 값 (4)

// 클래스는 참조하고, 구조체는 복사함
var dog1 = Dog() // dog1은 새로 만들어진 Dog()를 참조함
var dog2 = dog1 // dog2는 dog1이 참조하는 Dog()를 똑같이 참조함
dog1.name = "찡코" // dog1의 이름을 바꾸면 Dog()의 이름이 바뀌기 때문에
print(dog2.name as Any) // dog2의 이름을 가져와도 바뀐 이름("찡코")이 출력됨

// 구조체 복사
var coffee1 = Coffee() // coffee1은 새로 만들어진 Coffee() 그 자체
var coffee2 = Coffee() // coffee2는 coffee1을 복사한 값 그 자체
coffee1.name = "아메리카노"
// coffee2.name  // coffee2는 완전 별개이기 때문에 이름이 바뀌지 않음(nil)

// 생성자 // 클래스와 구조체 모두 생성자를 가지고 있음. 생성자에서는 속성의 초깃값을 지정할수 있음

class Dog3{
    var name: String?
    var age: Int?
    
    init(){
        self.age = 0
    }
}

struct Coffee2{
    var name: String?
    var size: String?
    
    init(){
        self.size = "Tail"
    }
    
}

// 만약 속성이 옵셔널이 아니라면, 항상 초기값을 가져야함. 만약 옵셔널이 아닌 속성이 초깃값을 가지고 있지 않으면 컴파일 에러가 발생
class Dog4 {
    var name: String?
    // var age: Int // Compile Error
    
}

// 초깃값 지정방법??

// 1. 속성을 정의할때
class Dog5{
    var name: String?
    var age: Int = 0
    
}

// 2. 생성자에서 초깃값 지정
class Dog6{
    var name: String?
    var age: Int
    
    init(){
        self.age = 0
    }
    
}

// 생성자도 함수와 마찬가지로 파라미터를 받을 수 있음
class Cat {
    var name: String?
    var age: Int
    
    init(_ name: String?, _ age: Int){
        self.name = name
        self.age = age
    }
}

var myCat = Cat("haha", 23)

/*
    만약 상속받은 클래스라면 생성자에서 상위 클래스의 생성자를 호출해줘야 함
    만약 생성자의 파라미터가 상위클래스의 파라미터와 같다면, override 키워드를 붙여줘야함
    super.init()은 클래스 속성들의 초깃값이 모두 설정된 후에 해야 함
    그리고 나서부터 자기 자신에 대한 self 키워드를 사용할 수 있음
 */

class Dog7: Animal{
    var name: String?
    var age: Int
    
    override init(){
        self.age = 0 // Dog7 클래스의 초깃값 설정
        super.init() // 상위 클래스 생성자 호출
        print(self.simpleDescription())
    }
    
    func simpleDescription() -> String {
        if let name = self.name {
            return "\(name)"
        } else {
            return "No name"
        }
    }
}

// 속성 (Properties)
/*
    속성은 크게 Stored Property, Computed Property 두가지로 나뉨
    지금까지 정의하고 사용한 name, age 와 같은 속성들이 Stored Property
    Computed Property는 get, set을 이용해 정의할 수 있음
    set에는 새로 설정될 값을 newValue라는 예약어를 통해 접근 가능
*/

// 구조체는 값 타입으로, 구조체 변수를 새로운 변수에 할당할 때마다 새로운 구조체가 할당됨
// 즉 같은 구조체를 여러 개의 변수에 할당한 뒤, 값을 변경시키더라고 다른 변수에 영향을 주지 않음 ( 값 자체를 복사)
struct Hex {
    var decimal: Int?
    var hexString: String? {
        get {
            if let decimal = self.decimal {
                return String(decimal, radix: 16) // radix는 진수변환 할 수 있는 문법
            } else {
                return nil
            }
        }
        set {
            if let newValue = newValue {
                self.decimal = Int(newValue, radix: 16)
            } else {
                self.decimal = nil
            }
        }
        
    }
}

// get set 포맷
/*
class test {

    var 프로퍼티명: 타입 {
        get {
            //필요한 연산 과정
            return 반환값
        }
        set(매개변수명) {
            //필요한 연산구문 ex) 프로퍼티명 = 매개변수명
        }
    }
}
*/


/*
 튜플(Tuple)
 
 튜퓰은 어떠한 값들의 묶음임. 배열과 비슷하지만, 배열과는 다르게 길이가 고정되어있음. 값에 접근할 때에도 [] 대신 .을 사용
 튜플은 소괄호, 배열은 대괄호
 */

var coffeeInfo = ("아메리카노", 5100)
print(coffeeInfo.0) //아메리카노
print(coffeeInfo.1) // 5100

// 튜플 파라미터에 이름을 붙일 수 있음
var namedCoffeeInfo = (coffee: "아메리카노", price: 5100)
print(namedCoffeeInfo.coffee) // 아메리카노
print(namedCoffeeInfo.price) // 5100

// 간단한 자료형을 만들 때에는 구조체 대신 튜플을 사용하여 만듬
// 튜플 타입의 어노테이션
var coffeeInfo1: (String, Int)
var namedCoffeeInfo1: (coffee: String, price: Int)

// 여러 변수에 값을 지정
let (coffee, price) = ("아메리카노", 5100)
print(coffee) // 아메리카노
print(price) // 5100





/// 커피 이름에 맞는 커피 가격 정보를 반환합니다. 일치하는 커피 이름이 없다면 `nil`을 반환합니다.
///
/// - parameter name: 커피 이름
///
/// - returns: 커피 이름과 가격 정보로 구성된 튜플을 반환합니다.


func coffeeInfo(for name: String) -> (name: String, price: Int)? { // 함수 호출 시 for 사용, 내부에선 name으로 사용
    let coffeeInfoList: [(name: String, price: Int)] = [ // 밖에 [] : 딕셔너리 안에 () : 튜플
        ("아메리카노", 5100),
        ("라떼", 5600),
    ]
    for coffeeInfo in coffeeInfoList {
        if coffeeInfo.name == name {
            return coffeeInfo
        }
    }
    return nil
}


// enum : 같은 주제로 연관된 데이터들을 멤버로 구성하여 나타내는 자료형

// 열거형 정의하기 //

// 1. 원시값이 웞는 열거형
enum Position {
    case top
    case mid
    case jug
    case adc
    case sup
    
}
// 가로로 나열도 가능
enum Position2 {
    case top, mid, jug, adc, sup
}

// 실제 사용
var user1: Position = .top
var user2: Position = .mid

// 2. 원시값이 있는 열거형
/*
    case에 원시값을 지정해줄 수도 있는데, 이를 Raw Value라고 함
    Raw Value가 될 수 있는 자료형은
    Number Type
    Character Type
    String Type
 */

// 1) Number Type
enum NumPosition: Int {
    case top // 0
    case mid // 1
    case jug // 2
    case adc // 3
    case sup // 4
}

var user3: NumPosition = .top

print(user3.rawValue) // 0























