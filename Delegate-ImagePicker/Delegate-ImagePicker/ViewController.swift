//
//  ViewController.swift
//  Delegate-ImagePicker
//
//  Created by 허지인 on 2021/08/07.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet var imgView: UIImageView!
    @IBAction func pick(_ sender: Any) {
        // 이미지 피커 컨트롤러 인스턴스 생성
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary // 이미지 소스로 사진 라이브러리 선택
        picker.allowsEditing = true // 이미지 편집 기능 On
        // 추가된 부분) 델리게이트 지정
        picker.delegate = self
        
        // 이미지 피커 컨트롤러 실행
        self.present(picker, animated: false)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

// MARK:- 이미지 피커 컨트롤러 델리게이트 메소드
extension ViewController: UIImagePickerControllerDelegate{
    
    // 이미지 피커1에서 이미지를 선택하지 않고 취소했을 때 호출되는 메소드
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // 이미지 피커 컨트롤러 창 닫기
        picker.dismiss(animated:false){ () in
            
            // 알림창 호출
            let alert = UIAlertController(title: "",
                                          message: "이미지 선택이 취소되었습니다",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .cancel))
            self.present(alert, animated: false)
        }
    }
}

// MARK:- 내비게이션 컨트롤러 델리게이트 메소드
extension ViewController: UINavigationControllerDelegate{
    
    // 이미지 피커에서 이미지를 선택했을 때 호출되는 메소드
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // 이미지 피커 컨트롤러 창 닫기
        picker.dismiss(animated: false){ () in
            // 이미지를 이미지 뷰에 표시
            let img = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
            self.imgView.image = img
        }
        
    }
}
