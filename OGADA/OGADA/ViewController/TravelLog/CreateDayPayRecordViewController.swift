//
//  CreateDayPayRecordViewController.swift
//  OGADA
//
//  Created by YoujinMac on 2020/03/10.
//  Copyright © 2020 didwndckd. All rights reserved.
//

import UIKit
import MobileCoreServices

class CreateDayPayRecordViewController: BaseViewController {
    
    let category: String = ""
    
    private let exchangeType = SelectedTravel.shared!.foreign.rawValue
    
    private lazy var createView = CreateDayPayView(frame: view.frame, exchangeType: exchangeType)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .background
        // Do any additional setup after loading the view.
        setUI()
        setConstraint()
    }
    
    //MARK: - UI
    private func setUI() {
        createView.delegate = self
        
        view.addSubview(createView)
        view.bringSubviewToFront(backButton)
    }
    
    private func setConstraint() {
        createView.frame = view.frame

    }

    //MARK: - Action
    override func popAction() {
        dismiss(animated: true, completion: nil)
    }
    
    private func presentAlbum() {
        print(#function)
    }
    
    private func presentCamera() {
        print(#function)
    }

}

//MARK: createDayPayRecord Delegate
extension CreateDayPayRecordViewController: CreateDayPayDelegate {
    func didTabCategoryButton() {
        let categoryVC = DayPayRecordCatgoryPickerViewController()
        categoryVC.modalPresentationStyle = .overFullScreen
        present(categoryVC, animated: true)
    }
    
    func didTabPayTypeButton() {
        let payTypeVC = DayPayRecordPayTypePickerViewController()
        payTypeVC.modalPresentationStyle = .overFullScreen
        present(payTypeVC, animated: true)
    }
    
    func didTabCreateButton() {
        // 완성!
        print("didTabCreateButton")
    }
    
    func addPicture() {
        // 앨범에서 사진 가져오기.
//        print("addPicture")
        
        let alertController = Alert(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let albumAction = UIAlertAction(title: "앨범", style: .default, handler: { _ in
            self.presentAlbum()
        })
        let cameraAction = UIAlertAction(title: "카메라", style: .default, handler: { _ in
            self.presentCamera()
        })
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        
        alertController.freeAlertDisplay(target: self, actions: [albumAction, cameraAction, cancelAction])
        
    }
    
    
    
//    func categoryText() -> String {
//        print("categoryText()")
//        return category
//    }
}
