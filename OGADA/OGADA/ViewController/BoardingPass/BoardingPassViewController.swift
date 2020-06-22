//
//  BoardingPassViewController.swift
//  OGADA
//
//  Created by 양중창 on 2020/03/04.
//  Copyright © 2020 didwndckd. All rights reserved.
//

import UIKit

class BoardingPassViewController: UIViewController {
    
    private let boardingPassView = UIView()
    private let boardingPassImage = UIImageView()
    private let airPlanImage = UIImageView()
    private let departureTimeLabel = UILabel()
    private let arrivalTimeLabel = UILabel()
    private let departureLabel = UILabel()
    private let arrivalLabel = UILabel()
    private let teminalLabel = UILabel()
    private let arrivalAirportLabel = UILabel()
    private let departureDateLabel = UILabel()
    private let departureDateOutPutLabel = UILabel()
    private let checkInCountLabel = UILabel()
    private let checkIncountOutPutLabel = UILabel()
    private let procedureLabel = UILabel()
    private let procedureButton = UIButton()
    private let clickLabel = UILabel()
    private let gateLabel = UILabel()
    private let gateOutPutLabel = UILabel()
    private let leadTimeLabel = UILabel()
    private let leadTimeOutPutLabel = UILabel()
    private let barCordImage = UIImageView()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setConstrains()
    }
    
    private var imageVisible = true
    
    override func viewDidAppear(_ animated: Bool) {
      super.viewDidAppear(animated)
      clickAni()
// 기기별 보딩이미지 사이즈 다르게
      if imageVisible {
          boardingPassImage.frame = CGRect(x: 0, y: 0, width: boardingPassView.frame.width, height: airPlanImage.frame.minY - 16)
          boardingPassImage.image = UIImage(named: "보딩이미지")
          boardingPassImage.contentMode = .scaleAspectFill
          boardingPassImage.clipsToBounds = true
          boardingPassView.addSubview(boardingPassImage)
          
          imageVisible = false
      }
      print(boardingPassImage.frame)
    }
    //MARK: UI
    func setUI() {
        let nationTextSize: CGFloat = 48
        let subTextSize: CGFloat = 12
        let textSize: CGFloat = 16
        
        view.backgroundColor = .background
        
        boardingPassView.backgroundColor = .white
        boardingPassView.layer.shadowOpacity = 0.7
        boardingPassView.layer.shadowOffset = CGSize(width: 5, height: 0)
        boardingPassView.layer.shadowRadius = 5
        boardingPassView.layer.masksToBounds = false
      
        view.addSubview(boardingPassView)
        
        
        
        airPlanImage.image = UIImage(named: "비행기")
        airPlanImage.contentMode = .scaleAspectFill
        boardingPassView.addSubview(airPlanImage)
        
        departureTimeLabel.text = "09:18"
        departureTimeLabel.textColor = .subText
        departureTimeLabel.font = UIFont.systemFont(ofSize: subTextSize)
        departureTimeLabel.textAlignment = .center
        boardingPassView.addSubview(departureTimeLabel)
        
        arrivalTimeLabel.text = "14:20"
        arrivalTimeLabel.textColor = .subText
        arrivalTimeLabel.font = UIFont.systemFont(ofSize: subTextSize)
        arrivalTimeLabel.textAlignment = .center
        boardingPassView.addSubview(arrivalTimeLabel)
        
        departureLabel.text = "ICN"
        departureLabel.textColor = .text
        departureLabel.font = UIFont.boldSystemFont(ofSize: nationTextSize)
        departureLabel.textAlignment = .center
        boardingPassView.addSubview(departureLabel)
        
        
        arrivalLabel.text = "NYC"
        arrivalLabel.textColor = .text
        arrivalLabel.font = UIFont.boldSystemFont(ofSize: nationTextSize)
        arrivalLabel.textAlignment = .center
        boardingPassView.addSubview(arrivalLabel)
        
        teminalLabel.text = "인천공항 제1터미널"
        teminalLabel.textColor = .subText
        teminalLabel.font = UIFont.systemFont(ofSize: subTextSize)
        teminalLabel.textAlignment = .center
        boardingPassView.addSubview(teminalLabel)
        
        arrivalAirportLabel.text = "John F Kennedy"
        arrivalAirportLabel.textColor = .subText
        arrivalAirportLabel.font = UIFont.systemFont(ofSize: subTextSize)
        arrivalAirportLabel.textAlignment = .center
        boardingPassView.addSubview(arrivalAirportLabel)
        
        departureDateLabel.text = "출발일 및 시간"
        departureDateLabel.textColor = .subText
        departureDateLabel.font = UIFont.systemFont(ofSize: subTextSize)
        departureDateLabel.textAlignment = .left
        boardingPassView.addSubview(departureDateLabel)
        
        departureDateOutPutLabel.text = "2020.03.01" + " / " + "09:18"
        departureDateOutPutLabel.textColor = .text
        departureDateOutPutLabel.font = UIFont.boldSystemFont(ofSize: textSize)
        departureDateOutPutLabel.textAlignment = .left
        boardingPassView.addSubview(departureDateOutPutLabel)
        
        checkInCountLabel.text = "체크인카운터"
        checkInCountLabel.textColor = .subText
        checkInCountLabel.font = UIFont.systemFont(ofSize: subTextSize)
        checkInCountLabel.textAlignment = .left
        boardingPassView.addSubview(checkInCountLabel)
        
        checkIncountOutPutLabel.text = "88"
        checkIncountOutPutLabel.textColor = .text
        checkIncountOutPutLabel.font = UIFont.boldSystemFont(ofSize: textSize)
        checkIncountOutPutLabel.textAlignment = .left
        boardingPassView.addSubview(checkIncountOutPutLabel)
        
        procedureLabel.text = "출국장 혼잡도 보기"
        procedureLabel.textColor = .subText
        procedureLabel.font = UIFont.systemFont(ofSize: subTextSize)
        procedureLabel.textAlignment = .left
        boardingPassView.addSubview(procedureLabel)

        // button title underline
        
//        let yourAttributes: [NSAttributedString.Key: Any] = [
//            .font: UIFont.systemFont(ofSize: 14),
//            .foregroundColor: UIColor.blue,
//            .underlineStyle: NSUnderlineStyle.single.rawValue]
//
//        let attributeString = NSMutableAttributedString(string: "보기", attributes: yourAttributes)
//        procedureButton.setAttributedTitle(attributeString, for: .normal)
        procedureButton.setTitle("보기", for: .normal)
        procedureButton.setTitleColor(.text, for: .normal)
        procedureButton.backgroundColor = .clear
        procedureButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: textSize)
        procedureButton.titleLabel?.textAlignment = .left
        procedureButton.addTarget(self, action: #selector(procedureButtonDidTap) , for: .touchUpInside)
        boardingPassView.addSubview(procedureButton)
        
        gateLabel.text = "탑승구"
        gateLabel.textColor = .subText
        gateLabel.font = UIFont.systemFont(ofSize: subTextSize)
        gateLabel.textAlignment = .left
        boardingPassView.addSubview(gateLabel)
        
        gateOutPutLabel.text = "5"
        gateOutPutLabel.textColor = .text
        gateOutPutLabel.font = UIFont.boldSystemFont(ofSize: textSize)
        gateOutPutLabel.textAlignment = .left
        boardingPassView.addSubview(gateOutPutLabel)
        
        leadTimeLabel.text = "소요시간"
        leadTimeLabel.textColor = .subText
        leadTimeLabel.font = UIFont.systemFont(ofSize: subTextSize)
        leadTimeLabel.textAlignment = .left
        boardingPassView.addSubview(leadTimeLabel)
        
        
        leadTimeOutPutLabel.text = "8시간 13분"
        leadTimeOutPutLabel.textColor = .text
        leadTimeOutPutLabel.font = UIFont.boldSystemFont(ofSize: textSize)
        leadTimeOutPutLabel.textAlignment = .left
        boardingPassView.addSubview(leadTimeOutPutLabel)
        
        barCordImage.image = UIImage(named: "바코드")
        barCordImage.contentMode = .scaleAspectFit
        boardingPassView.addSubview(barCordImage)
         
        clickLabel.text = "   ↑\nclick!!"
        clickLabel.numberOfLines = 0
        clickLabel.textColor = .text
        clickLabel.font = UIFont.systemFont(ofSize: subTextSize)
        clickLabel.textAlignment = .left
        boardingPassView.addSubview(clickLabel)
        
    }
    func setConstrains() {
        let guide = view.safeAreaLayoutGuide
        let padding: CGFloat = 8 // 아이폰 7, 8 은 padding 4, 나머지 8
        [boardingPassView,airPlanImage,departureTimeLabel,arrivalTimeLabel,departureLabel,arrivalLabel,teminalLabel,arrivalAirportLabel,departureDateLabel,departureDateOutPutLabel,checkInCountLabel,checkIncountOutPutLabel,procedureLabel,procedureButton,gateLabel,gateOutPutLabel,leadTimeLabel,leadTimeOutPutLabel,barCordImage,clickLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        boardingPassView.centerYAnchor.constraint(equalTo: guide.centerYAnchor).isActive = true
        boardingPassView.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
        boardingPassView.widthAnchor.constraint(equalTo: guide.widthAnchor, multiplier: 0.9).isActive = true
        boardingPassView.heightAnchor.constraint(equalTo: guide.heightAnchor, multiplier: 0.8).isActive = true
        
        airPlanImage.bottomAnchor.constraint(equalTo: departureTimeLabel.topAnchor).isActive = true
        airPlanImage.leadingAnchor.constraint(equalTo: boardingPassView.leadingAnchor, constant: padding * 2).isActive = true
        airPlanImage.trailingAnchor.constraint(equalTo: boardingPassView.trailingAnchor, constant: -padding * 3).isActive = true
        airPlanImage.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        departureTimeLabel.bottomAnchor.constraint(equalTo: arrivalLabel.topAnchor, constant: -padding).isActive = true
        departureTimeLabel.leadingAnchor.constraint(equalTo: airPlanImage.leadingAnchor, constant:  padding).isActive = true
        
        arrivalTimeLabel.bottomAnchor.constraint(equalTo: arrivalLabel.topAnchor, constant: -padding).isActive = true
        arrivalTimeLabel.trailingAnchor.constraint(equalTo: airPlanImage.trailingAnchor).isActive = true
        
        departureLabel.bottomAnchor.constraint(equalTo: arrivalAirportLabel.topAnchor).isActive = true
        departureLabel.leadingAnchor.constraint(equalTo: departureTimeLabel.leadingAnchor).isActive = true
        
        arrivalLabel.bottomAnchor.constraint(equalTo: arrivalAirportLabel.topAnchor).isActive = true
        arrivalLabel.trailingAnchor.constraint(equalTo: arrivalTimeLabel.trailingAnchor).isActive = true
        
        teminalLabel.bottomAnchor.constraint(equalTo: checkInCountLabel.topAnchor, constant: -padding * 4).isActive = true
        teminalLabel.centerXAnchor.constraint(equalTo: departureLabel.centerXAnchor).isActive = true
        
        arrivalAirportLabel.bottomAnchor.constraint(equalTo: checkInCountLabel.topAnchor, constant: -padding * 4).isActive = true
        arrivalAirportLabel.centerXAnchor.constraint(equalTo: arrivalLabel.centerXAnchor).isActive = true
        
        departureDateLabel.bottomAnchor.constraint(equalTo: departureDateOutPutLabel.topAnchor, constant: -padding).isActive = true
        departureDateLabel.leadingAnchor.constraint(equalTo: barCordImage.leadingAnchor).isActive = true
        
        departureDateOutPutLabel.bottomAnchor.constraint(equalTo: leadTimeLabel.topAnchor, constant: -padding).isActive = true
        departureDateOutPutLabel.leadingAnchor.constraint(equalTo: departureDateLabel.leadingAnchor).isActive = true
        
        checkInCountLabel.bottomAnchor.constraint(equalTo: checkIncountOutPutLabel.topAnchor, constant:  -padding).isActive = true
        checkInCountLabel.leadingAnchor.constraint(equalTo: boardingPassView.centerXAnchor, constant: padding * 4).isActive = true
        
        checkIncountOutPutLabel.bottomAnchor.constraint(equalTo: leadTimeLabel.topAnchor, constant: -padding).isActive = true
        checkIncountOutPutLabel.leadingAnchor.constraint(equalTo: checkInCountLabel.leadingAnchor).isActive = true
        
        procedureLabel.bottomAnchor.constraint(equalTo: leadTimeOutPutLabel.topAnchor, constant: -padding).isActive = true
        procedureLabel.leadingAnchor.constraint(equalTo: departureDateLabel.leadingAnchor).isActive = true
        
        procedureButton.bottomAnchor.constraint(equalTo: clickLabel.topAnchor, constant: padding * 1.5 ).isActive = true
        procedureButton.leadingAnchor.constraint(equalTo: procedureLabel.leadingAnchor).isActive = true
        
        gateLabel.bottomAnchor.constraint(equalTo: leadTimeOutPutLabel.topAnchor, constant: -padding).isActive = true
        gateLabel.leadingAnchor.constraint(equalTo: boardingPassView.centerXAnchor, constant: -padding * 2).isActive = true
        
        gateOutPutLabel.bottomAnchor.constraint(equalTo: clickLabel.topAnchor, constant: padding).isActive = true
        gateOutPutLabel.leadingAnchor.constraint(equalTo: gateLabel.leadingAnchor).isActive = true
        
        leadTimeLabel.bottomAnchor.constraint(equalTo: leadTimeOutPutLabel.topAnchor, constant: -padding).isActive = true
        leadTimeLabel.leadingAnchor.constraint(equalTo: leadTimeOutPutLabel.leadingAnchor).isActive = true
        
        leadTimeOutPutLabel.bottomAnchor.constraint(equalTo: clickLabel.topAnchor, constant: padding).isActive = true
        leadTimeOutPutLabel.trailingAnchor.constraint(equalTo: barCordImage.trailingAnchor).isActive = true
        
        clickLabel.bottomAnchor.constraint(equalTo: barCordImage.topAnchor, constant: padding).isActive = true
        clickLabel.leadingAnchor.constraint(equalTo: procedureButton.leadingAnchor).isActive = true
        
        
        barCordImage.bottomAnchor.constraint(equalTo: boardingPassView.bottomAnchor).isActive = true
        barCordImage.centerXAnchor.constraint(equalTo: boardingPassView.centerXAnchor).isActive = true
        barCordImage.widthAnchor.constraint(equalTo: boardingPassView.widthAnchor, multiplier: 0.8).isActive = true
        barCordImage.heightAnchor.constraint(equalTo: boardingPassView.heightAnchor, multiplier: 0.16).isActive = true

    }
    //MARK: Action
    @objc func procedureButtonDidTap() {
        print("보기버튼눌러")
        let procedureVC = ProcedureViewController()
        procedureVC.terno = 1
        navigationController?.pushViewController(procedureVC, animated: true)

        
    }
    func clickAni() {
        let divide: Double = 6
        let duration: Double = Double(1) / divide
        UIView.animateKeyframes(
            withDuration: 3,
            delay: 0,
            options: [.calculationModeLinear, .repeat],
            animations: {
                for index in 0..<Int(divide) {
                    UIView.addKeyframe(withRelativeStartTime: duration * Double(index),
                                       relativeDuration: duration) {
                                        if index.isMultiple(of: 2) { self.clickLabel.center.y += 8 }
                                        else { self.clickLabel.center.y -= 8 }
                    }
                }
        }
        )}
    
}
