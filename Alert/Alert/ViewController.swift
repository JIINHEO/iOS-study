//
//  ViewController.swift
//  Alert
//
//  Created by 허지인 on 2021/07/11.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func touchUpShowAlertButton(_ sender: UIButton) {
        self.showAlertController(style: UIAlertController.Style.alert)
    }
    
    @IBAction func touchUpShowActionSheetButton(_ sender: UIButton){
        self.showAlertController(style: UIAlertController.Style.actionSheet)
    }
    func showAlertController(style: UIAlertController.Style){
        let alertController: UIAlertController
        alertController = UIAlertController(title: "Title", message: "Message", preferredStyle: style)
        
        let okAction: UIAlertAction
           okAction = UIAlertAction(title: "OK", style: .default, handler: { (action: UIAlertAction) in
             print("OK pressed")
           })
        
        let cancelAction: UIAlertAction
        cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        let handler:(UIAlertAction)-> Void
        handler = { (action: UIAlertAction) in print("action pressed \(action.title ?? "")")}
        
        let someAction: UIAlertAction
        someAction = UIAlertAction(title: "Some", style: UIAlertAction.Style.destructive, handler: handler)
        
        let anotherAction: UIAlertAction
        anotherAction = UIAlertAction(title: "Another", style: UIAlertAction.Style.default, handler: handler)
        
        alertController .addAction(someAction)
        alertController.addAction(anotherAction)
        
        alertController.addTextField{ (field: UITextField) in
                                     field.placeholder = "플레이스 홀더"
                                     field.textColor = UIColor.red
        }
    
        //모달이 올라오는 애니메이션이 끝나고 바로 그 직후에 호출될것
        self.present(alertController, animated: true, completion: {print("Alert controller shown")})
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

