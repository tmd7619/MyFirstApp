//
//  ViewController.swift
//  MyFirstApp
//
//  Created by yunseungwon on 2022/10/17.
//

import UIKit
//
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Click_A(_ sender: UIButton) {
        print("A버튼이 클릭되었습니다.")
        // 메시지창 컨트롤러 인스턴스 생성
        let alert = UIAlertController(title: "알림", message: "A버튼이 클릭되었습니다.", preferredStyle: UIAlertController.Style.alert)

        // 메시지 창 컨트롤러에 들어갈 버튼 액션 객체 생성
        let defaultAction =  UIAlertAction(title: "default", style: UIAlertAction.Style.default)
        let cancelAction = UIAlertAction(title: "cancel", style: UIAlertAction.Style.cancel, handler: nil)
        let destructiveAction = UIAlertAction(title: "destructive", style: UIAlertAction.Style.destructive){(_) in
            // 버튼 클릭시 실행되는 코드

        }
                
        //메시지 창 컨트롤러에 버튼 액션을 추가
        alert.addAction(defaultAction)
        alert.addAction(cancelAction)
        alert.addAction(destructiveAction)
      
        //메시지 창 컨트롤러를 표시
        self.present(alert, animated: false)
    }
    
    @IBAction func Click_B(_ sender: UIButton) {
        print("B버튼이 클릭되었습니다.")
        // 메시지창 컨트롤러 인스턴스 생성
        let alert = UIAlertController(title: "알림", message: "B버튼이 클릭되었습니다.", preferredStyle: UIAlertController.Style.alert)

        

        // 메시지 창 컨트롤러에 들어갈 버튼 액션 객체 생성
        let defaultAction =  UIAlertAction(title: "default", style: UIAlertAction.Style.default)
        let cancelAction = UIAlertAction(title: "cancel", style: UIAlertAction.Style.cancel, handler: nil)
        let destructiveAction = UIAlertAction(title: "destructive", style: UIAlertAction.Style.destructive){(_) in
            // 버튼 클릭시 실행되는 코드

        }
                
        //메시지 창 컨트롤러에 버튼 액션을 추가
        alert.addAction(defaultAction)
        alert.addAction(cancelAction)
        alert.addAction(destructiveAction)
      
        //메시지 창 컨트롤러를 표시
        self.present(alert, animated: false)

    }
}

