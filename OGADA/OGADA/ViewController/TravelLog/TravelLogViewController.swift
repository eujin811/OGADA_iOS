//
//  TravelLogViewController.swift
//  OGADA
//
//  Created by 양중창 on 2020/03/04.
//  Copyright © 2020 didwndckd. All rights reserved.
//

import UIKit

class TravelLogViewController: UIViewController/*BaseViewController*/ {
    
    private let shared = SelectedTravel.shared!
    private var dateArr = DateWorker().getDateLevel(start: SelectedTravel.shared!.departureDate, end: SelectedTravel.shared!.arrivalDate)
    
    private lazy var totalBudget: Int = self.shared.totalBudget //(SelectedTravel.shared?.totalBudget)!

    // 오늘 환율
    private var todayExchange: Double = 0
    private var inputKRWCash: Int = 0
    private var inputForeignCash: Int = 0
    
    private var krwCashBalance: Int = 600000
    private var krwCardBalance: Int = 400000
    private var foreignCashBalance: Int = 503
    private var foreignCardBalance: Int = 335
    private lazy var exchangeType: String = self.shared.foreign.rawValue
    
    // post it 관련
    // 여러개 들어오 예정
//    private let day: Int = 1
    
    private let date: String = "2020.01.01"
    private var foreignCash: Int = 100
    private let krwCash: Int = 120000
    private let foreignCard: Int = 210
    private let krwCard: Int = 252000
    private let foreignTotal: Int = 210
    private let krwtotal: Int = 372000
        
    private let flowLayout = UICollectionViewFlowLayout()
    private lazy var collectionView = UICollectionView(frame: .zero
        , collectionViewLayout: flowLayout)
    
    private lazy var budgetView = BudgetView(totalBudget: totalBudget, krwCash: krwCashBalance, krwCard: krwCardBalance, foreignCash: foreignCashBalance, foreignCard: foreignCardBalance, exchangeType: exchangeType)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("------------- [ ExchangeAPI ] --------------")
        
        ExchangeAPI().tempRequest(tempForeign: exchangeType) { (result) in
          
            self.todayExchange = result

            
            print("todayExchange \(self.todayExchange)")
            
        }
        

        view.backgroundColor = .background
        
//        let dates = DateWorker.getDateLevel(<#T##self: DateWorker##DateWorker#>)
//        print("------------/n seletedTravel")
//        print(SelectedTravel.shared)
//
//        print(shared.departureDate, "type -> ", type(of: shared.departureDate))
//        print(shared.arrivalDate, "type -> ", type(of: shared.arrivalDate))
//
//        print(dateArr)
        
        setUI()
        setConstraint()
        
       
    }
    
    
    // MARK: - UI
    private func setUI() {
        
        budgetView.delegate = self
        
        setFlowLaytou()
        
        
//        backButton.tintColor = .lightGray
        
        collectionView.register(PostItCollectionViewCell.self, forCellWithReuseIdentifier: PostItCollectionViewCell.identifier)
        collectionView.backgroundColor = .background
        collectionView.delegate = self
        collectionView.dataSource = self
        
//        navigationItem.backBarButtonItem?.tintColor = .white
//        navigationController?.navigationItem.backBarButtonItem?.tintColor = .white
        
        navigationController?.navigationBar.tintColor = .lightGray
        
        view.addSubview(budgetView)
        view.addSubview(collectionView)
//        view.bringSubviewToFront(backButton)

        
    }
    
    private func setConstraint() {
        budgetView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        let budgetViewHeight: CGFloat = (view.safeAreaLayoutGuide.layoutFrame.height) / 3
        
        // 예산 View
        NSLayoutConstraint.activate([
            budgetView.topAnchor.constraint(equalTo: view.topAnchor),
            budgetView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            budgetView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            budgetView.heightAnchor.constraint(equalToConstant: budgetViewHeight)
            
        ])
        
        // post-it CollectionView
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: budgetView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setFlowLaytou() {
        
        let itemInLine: CGFloat = 2
        
        let spacing: CGFloat = 15
        let insets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        let collectionViewWidth = view.bounds.width
        
        let contentSize = collectionViewWidth - insets.left - insets.right - (spacing * (itemInLine - 1))
        
        let itemsSize = (contentSize / itemInLine).rounded(.down)
        
        flowLayout.minimumLineSpacing = spacing
        flowLayout.minimumInteritemSpacing = spacing
        flowLayout.sectionInset = insets
        flowLayout.itemSize = CGSize(width: itemsSize, height: itemsSize)

    }
   
    //MARK: - Action
    
    // 현금 추가 alert
    private func addCashAlert() {
        //오늘 환율
        let viewTodayExchange = String(format: "%.2f", todayExchange)

        let addAlert = UIAlertController(title: "오늘의 환율", message: "1 \(exchangeType) = \(viewTodayExchange) KRW", preferredStyle: .alert)
        
        let addCashButton = UIAlertAction(title: "추가", style: .default) { _ in
            var addValue: Double = 0
            if let textField = addAlert.textFields?.first, let inputValue = textField.text, let cash = Double(inputValue) {
                
                // 외화
                self.inputForeignCash = Int(cash)
                // 외화 -> krw
                addValue = cash * self.todayExchange
            }
            self.inputKRWCash += Int(addValue)
            print("addCashButton Click ->/n addValue = \(addValue) inputKRWCash = \(self.inputKRWCash)")
            print("inputForeignCash \(self.inputForeignCash)")
            
            // MARK: - alert에서 입력받은 돈 cash에 추가.
            self.krwCashBalance += self.inputKRWCash
            self.foreignCashBalance += self.inputForeignCash
            
            
            self.budgetView.set(foreignCashBalanceLabelText: String(self.foreignCashBalance),krwCashBalanceLabelText:  String(self.krwCashBalance))
        }
        
        addAlert.addAction(addCashButton)
        
        let cancelButton = UIAlertAction(title: "취소", style: .cancel)
        addAlert.addAction(cancelButton)
        
        addAlert.addTextField {
            $0.placeholder = "추가할 현금을 입력해주세요. \(self.exchangeType)"
        }
        
        present(addAlert, animated: true)
    }
    
}


//MARK: - Datasource: CollectionView
extension TravelLogViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dateArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostItCollectionViewCell.identifier, for: indexPath) as! PostItCollectionViewCell
        
        cell.backgroundColor = .background
        
        cell.configure(day: indexPath.row + 1, date: date, foreignType: exchangeType, foreignCash: foreignCash, krwCash: krwCash, foreignCard: foreignCard, krwCard: krwCard, foreignTotal: foreignTotal, krwTotal: krwtotal, backgroundImage: UIImage(named: "post it")!)
        
        return cell
    }
    
    
}


//MARK: - Delegate: CollectionView

//extension TravelLogViewController: UICollectionViewDelegate {
extension TravelLogViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let dayPayRecordVC = DayPayRecordViewController()
        
//        let dayPayRecordVC = UINavigationController(rootViewController: DayPayRecordViewController())
        
        dayPayRecordVC.modalPresentationStyle = .fullScreen
        present(dayPayRecordVC, animated: true)
    }
}

//MARK: - Delegate: BudgetView
extension TravelLogViewController: BudgetViewDelegate {
    
    func didTabAddCashButton() {
        addCashAlert()
    }
    
    
}
