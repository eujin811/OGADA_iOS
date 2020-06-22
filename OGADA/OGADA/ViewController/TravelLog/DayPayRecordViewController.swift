//
//  DayPayRecordViewController.swift
//  OGADA
//
//  Created by YoujinMac on 2020/03/10.
//  Copyright © 2020 didwndckd. All rights reserved.
//

import UIKit

class DayPayRecordViewController: UIViewController {
    
    private let tableView = UITableView(frame: .zero)
    private lazy var headerView = DayPayRecordHeaderView(day: day, date: date)
    private let createButton = UIButton()
    
    
    private lazy var exchangeType:String = SelectedTravel.shared!.foreign.rawValue

    // Header
    let day:Int = 1
    let date:String = "2020.01.03"
    
    // Footer
    let foreignCash: Int = 320
    let krwCash:Int = 320000
    let foreignCard:Int = 235
    let krwCard:Int = 235000
    lazy var foreignTotal: Int = foreignCash + foreignCard
    lazy var krwTotal: Int = krwCash + krwCard
    
    // cell dummy Data
    let cellCount = 5
    private let titleImageString = "DayPayRecord"
    private let categoryImageString = "cafe"
    private let payTypeImageString = "card&cash"
    private let cellTitle = "팁싸마이 "
    private let cellComment = "오렌지 주스 존맛탱구리~~"
    private let cellAmount = 21
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        
        setUI()
        setConstraint()
    }
    
    
//MARK: - UI
    private func setUI() {
        tableView.separatorStyle = .none
        tableView.dataSource = self
        
        headerView.delegate = self
        
        tableView.register(DayPayRecordTableViewCell.self, forCellReuseIdentifier: DayPayRecordTableViewCell.identifier)
                
        tableView.tableFooterView = DayPayRecordFooterView(foreignCash: foreignCash, krwCash: krwCash, foreignCard: foreignCard, krwCard: krwCard, foreignTotal: foreignTotal, krwTotal: krwTotal, exchnageType: exchangeType)
        
        createButton.setImage(UIImage(named: "plus_White"), for: .normal)
        createButton.backgroundColor = .theme
        createButton.imageView?.contentMode = .scaleAspectFit
        createButton.layer.cornerRadius = 30
        createButton.addTarget(self, action: #selector(didTabCreateButton(sender:)), for: .touchUpInside)
        
        
        view.addSubview(tableView)
        view.addSubview(headerView)
        view.addSubview(createButton)
        view.bringSubviewToFront(createButton)
    }
    
    private func setConstraint() {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        createButton.translatesAutoresizingMaskIntoConstraints = false
        
        let margin: CGFloat = 24
        let padding: CGFloat = 16
        
        let headerHeight: CGFloat = ((view.frame.width) / 2 - (margin * 3))
        let buttonSize: CGFloat = 60
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: headerHeight),

            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            createButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -margin),
            createButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin),
            createButton.heightAnchor.constraint(equalToConstant: buttonSize),
            createButton.widthAnchor.constraint(equalToConstant: buttonSize)
        ])
    }
    
    
    
    //MARK: - Action
    @objc private func didTabCreateButton(sender: UIButton) {
        let createVC = CreateDayPayRecordViewController()
        createVC.modalPresentationStyle = .fullScreen
        
        present(createVC, animated:  true)
       
        
    }

}

// UIImage(named: DayPayRecord)

//MARK: - TableViewDataSource
extension DayPayRecordViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellCount
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: DayPayRecordTableViewCell.identifier, for: indexPath) as! DayPayRecordTableViewCell
        
        cell.configure(titleImage: UIImage(named: titleImageString)!, categoryImage: UIImage(named: categoryImageString)!, title: cellTitle, comment: cellComment, payTypeImage: UIImage(named: payTypeImageString)!, amount: cellAmount, exchangeType: exchangeType)
        
        return cell
    }
    
    
}



//MARKL - DayPayRecord Delegate
extension DayPayRecordViewController: DayPayRecordHeaderDelegate {
    func backFunc() {
        dismiss(animated: true, completion: nil)
    }
    
    
}
