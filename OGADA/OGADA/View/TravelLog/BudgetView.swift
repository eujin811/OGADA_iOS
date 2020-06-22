//
//  TravelLogView.swift
//  OGADA
//
//  Created by 양중창 on 2020/03/07.
//  Copyright © 2020 didwndckd. All rights reserved.
//

import UIKit


protocol BudgetViewDelegate: class {
    func didTabAddCashButton() -> ()
//    func didReloadBalance() -> ()
}

class BudgetView: UIView {
    
    weak var delegate: BudgetViewDelegate?
    
    var totalBudget: Int
    var krwCashBalance: Int
    var krwCardBalance: Int
    var foreignCashBalance: Int
    var foreignCardBalance: Int
    let exchangeType: String
    
    private let totalTextLabel = UILabel()
    private let balanceTextLabel = UILabel()
    private let moneyImage = UIImageView()
    private let cardImage = UIImageView()
    private let moneyCardImage = UIImageView()
    
    private let totalBudgetLabel = UILabel()
    private let krwCashBalanceLabel = UILabel()
    private let krwCardBalanceLabel = UILabel()
    private let foreignCashBalanceLabel = UILabel()
    private let foreignCardBalanceLabel = UILabel()
    //2안 남은돈 총 얼마인가.
    private let krwTotalBalanceLabel = UILabel()
    private let foreignTotalBalanceLabel = UILabel()
    
    let addCashButton = UIButton()
    
    
    
    init(totalBudget: Int, krwCash krwCashBalance: Int, krwCard krwCardBalance: Int, foreignCash foreignCashBalance: Int, foreignCard foreignCardBalance: Int, exchangeType: String) {
        
        self.totalBudget = totalBudget
        self.krwCashBalance = krwCashBalance
        self.krwCardBalance = krwCardBalance
        self.foreignCashBalance = foreignCashBalance
        self.foreignCardBalance = foreignCardBalance
        self.exchangeType = exchangeType
        
        super.init(frame: .zero)

        
        setUI()
        setConstraint()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - UI
    private func setUI() {
        
        let hardUITintColor = CGColor(srgbRed: 146, green: 146, blue: 146, alpha: 1)
        let mainTextColor: UIColor = .white
        let subTextColor: UIColor = .lightGray
        
        let fixedTextSize: CGFloat = 16
        let totalBudgetTextSize: CGFloat = 28
        let foreignText:CGFloat = 17            // 기본 textsize
        let krwText:CGFloat = 14
        
        backgroundColor = .text
        
        
        // hard
        totalTextLabel.text = "총예산"
        totalTextLabel.textColor = subTextColor
        totalTextLabel.font = .boldSystemFont(ofSize: fixedTextSize)
        
        balanceTextLabel.text = "남은 금액"
        balanceTextLabel.textColor = subTextColor
        balanceTextLabel.font = .boldSystemFont(ofSize: fixedTextSize)
        
        moneyImage.image = UIImage(named: "money")
        moneyImage.contentMode = .scaleAspectFill
//        moneyImage.contentMode = .scaleAspectFit
        
        cardImage.image = UIImage(named: "card")
        cardImage.contentMode = .scaleAspectFill
        
        addCashButton.setImage(UIImage(systemName: "plus.circle"), for: .normal)
        addCashButton.tintColor = .init(cgColor: hardUITintColor)
        addCashButton.contentMode = .scaleAspectFill
        addCashButton.addTarget(self, action: #selector(didTabAddCashButton(sender:)), for: .touchUpInside)
        
        // 총예산
        totalBudgetLabel.text = "\(totalBudget) KRW"
        totalBudgetLabel.textColor = mainTextColor
        totalBudgetLabel.font = .boldSystemFont(ofSize: totalBudgetTextSize)
        
        // 남은예산
        foreignCashBalanceLabel.text = "\(foreignCashBalance) \(exchangeType)"
        foreignCashBalanceLabel.textColor = mainTextColor
        foreignCashBalanceLabel.font = .boldSystemFont(ofSize: foreignText)
        
        krwCashBalanceLabel.text = "\(krwCashBalance) KRW"
        krwCashBalanceLabel.textColor = subTextColor
        krwCashBalanceLabel.font = .systemFont(ofSize: krwText)
        
        foreignCardBalanceLabel.text = "\(foreignCardBalance) \(exchangeType)"
        foreignCardBalanceLabel.textColor = mainTextColor
        foreignCardBalanceLabel.font = .boldSystemFont(ofSize: foreignText)
        
        krwCardBalanceLabel.text = "\(krwCardBalance) KRW"
        krwCardBalanceLabel.textColor = subTextColor
        krwCardBalanceLabel.font = .systemFont(ofSize: krwText)
        
        
        //2안
        moneyCardImage.image = UIImage(named: "card&cash")
        moneyCardImage.contentMode = .scaleAspectFill
        
//        foreignTotalBalanceLabel.text = "\(foreignCardBalance + foreignCashBalance) \(exchangeType)"
//        foreignTotalBalanceLabel.textColor = mainTextColor
        
//        krwTotalBalanceLabel.text = "\(krwCardBalance + krwCashBalance) KRW"
//        krwTotalBalanceLabel.textColor = subTextColor
        
       
        
        addSubview(totalTextLabel)
        addSubview(balanceTextLabel)
        addSubview(cardImage)
        addSubview(moneyImage)
//
        addSubview(totalBudgetLabel)
        addSubview(krwCashBalanceLabel)
        addSubview(krwCardBalanceLabel)
        addSubview(foreignCashBalanceLabel)
        addSubview(foreignCardBalanceLabel)
        addSubview(addCashButton)
        
//        // 2안
//        addSubview(moneyCardImage)
//        addSubview(krwTotalBalanceLabel)
//        addSubview(foreignTotalBalanceLabel)
        
    }
    
    private func setConstraint() {
        totalTextLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceTextLabel.translatesAutoresizingMaskIntoConstraints = false
        cardImage.translatesAutoresizingMaskIntoConstraints = false
        moneyImage.translatesAutoresizingMaskIntoConstraints = false
        
        totalBudgetLabel.translatesAutoresizingMaskIntoConstraints = false
        krwCashBalanceLabel.translatesAutoresizingMaskIntoConstraints = false
        krwCardBalanceLabel.translatesAutoresizingMaskIntoConstraints = false
        foreignCashBalanceLabel.translatesAutoresizingMaskIntoConstraints = false
        foreignCardBalanceLabel.translatesAutoresizingMaskIntoConstraints = false
        addCashButton.translatesAutoresizingMaskIntoConstraints = false
        
        // 2안
//        moneyCardImage.translatesAutoresizingMaskIntoConstraints = false
//        krwTotalBalanceLabel.translatesAutoresizingMaskIntoConstraints = false
//        foreignTotalBalanceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let margin:CGFloat = 24  /*32*/
        let padding:CGFloat = 8
        let textPadding:CGFloat = 4
        
        let imageHeight:CGFloat = 28
        let moneyImageHeight:CGFloat = 36
        let addButtonHeight:CGFloat = 40
        
        
        // 고정
        NSLayoutConstraint.activate([
            totalTextLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            totalTextLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: margin)
,
            
            balanceTextLabel.topAnchor.constraint(equalTo: totalTextLabel.bottomAnchor, constant: margin),
            balanceTextLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: margin),
            
            moneyImage.topAnchor.constraint(equalTo: balanceTextLabel.bottomAnchor),
            moneyImage.leadingAnchor.constraint(equalTo: balanceTextLabel.trailingAnchor, constant: margin),
            moneyImage.heightAnchor.constraint(equalToConstant: moneyImageHeight /*imageHeight*/),
            moneyImage.widthAnchor.constraint(equalToConstant: moneyImageHeight /*imageHeight*/),

            cardImage.topAnchor.constraint(equalTo: moneyImage.bottomAnchor, constant: margin),
            cardImage.leadingAnchor.constraint(equalTo: moneyImage.leadingAnchor),
            cardImage.heightAnchor.constraint(equalToConstant: imageHeight),
            cardImage.widthAnchor.constraint(equalToConstant: imageHeight),
            
        ])
        
        // 유동적
        NSLayoutConstraint.activate([
            totalBudgetLabel.centerYAnchor.constraint(equalTo: totalTextLabel.centerYAnchor),
//            totalBudgetLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: padding),
            totalBudgetLabel.leadingAnchor.constraint(equalTo: totalTextLabel.trailingAnchor, constant: margin * 2),
            
            foreignCashBalanceLabel.topAnchor.constraint(equalTo: moneyImage.topAnchor),
            foreignCashBalanceLabel.leadingAnchor.constraint(equalTo: moneyImage.trailingAnchor, constant: margin),
            
            krwCashBalanceLabel.topAnchor.constraint(equalTo: foreignCashBalanceLabel.bottomAnchor, constant: textPadding /*padding*/),
            krwCashBalanceLabel.leadingAnchor.constraint(equalTo: foreignCashBalanceLabel.leadingAnchor),

            foreignCardBalanceLabel.topAnchor.constraint(equalTo: cardImage.topAnchor),
            foreignCardBalanceLabel.leadingAnchor.constraint(equalTo: foreignCashBalanceLabel.leadingAnchor),
            
            krwCardBalanceLabel.topAnchor.constraint(equalTo: foreignCardBalanceLabel.bottomAnchor, constant: textPadding /*padding*/),
            krwCardBalanceLabel.leadingAnchor.constraint(equalTo: foreignCardBalanceLabel.leadingAnchor)
            

        ])

        
        // MARK: - Button constraint
        NSLayoutConstraint.activate([
            
            addCashButton.centerYAnchor.constraint(equalTo: foreignCashBalanceLabel.bottomAnchor, constant: (textPadding / 2) ),
            addCashButton.leadingAnchor.constraint(equalTo: foreignCashBalanceLabel.trailingAnchor, constant: margin * 2),
            addCashButton.heightAnchor.constraint(equalToConstant: addButtonHeight),
            addCashButton.widthAnchor.constraint(equalToConstant: addButtonHeight)
            
        ])
        
        // 2안
        NSLayoutConstraint.activate([
//            krwTotalBalanceLabel.topAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutYAxisAnchor>#>, constant: <#T##CGFloat#>)
            
//            foreignTotalBalanceLabel.topAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutYAxisAnchor>#>, constant: <#T##CGFloat#>)
            
//            moneyCardImage.topAnchor.constraint(equalTo: cardImage.bottomAnchor, constant: margin),
//            moneyCardImage.leadingAnchor.constraint(equalTo: moneyImage.leadingAnchor),
//            moneyCardImage.heightAnchor.constraint(equalToConstant: imageHeight),
//            moneyCardImage.widthAnchor.constraint(equalToConstant: imageHeight)
        ])
        
    }
    
    
    
    // MARK: - action
    
    @objc private func didTabAddCashButton(sender: UIButton) {
        // 환율 + 환전 추가금액 alert창
        delegate?.didTabAddCashButton()
        
    }
    
    func set(foreignCashBalanceLabelText: String, krwCashBalanceLabelText: String) {
        foreignCashBalanceLabel.text = foreignCashBalanceLabelText + " " + exchangeType

        krwCashBalanceLabel.text = krwCashBalanceLabelText + " KRW"
    }
}
