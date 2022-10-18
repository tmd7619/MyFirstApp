

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













