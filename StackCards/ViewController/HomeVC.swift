//
//  HomeVC.swift
//  StackCards
//
//  Created by k2 tam on 17/11/2023.
//

import UIKit

class HomeVC: UIViewController {
    
    var vm = HomeVM()
    
    lazy var tblHome: UITableView = {
       let tbl = UITableView()
        tbl.translatesAutoresizingMaskIntoConstraints = false

        tbl.register(RatingTblCell.self, forCellReuseIdentifier: RatingTblCell.cellIdentifier)
        tbl.register(UINib(nibName: "SupportStatusTblCell", bundle: nil), forCellReuseIdentifier: SupportStatusTblCell.cellIdentifier)
        tbl.backgroundColor = UIColor(hex: "#F5F5F5")
        tbl.separatorStyle = .none
        return tbl
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubViews(tblHome)
        addConstraints()
        setupVM()
        setupTblHome()

        
    }
    
    private func setupVM(){
      
        vm.delegate = self
        vm.fetchHomeData()
       

    }
    
    private func setupTblHome(){
        tblHome.dataSource = self
        tblHome.delegate = self
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            tblHome.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            
            tblHome.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tblHome.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tblHome.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
    }
    

}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.homeTblVData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch vm.homeTblVData[indexPath.row]{
        case .supportRatingQuests(let listRatingQuest):
            if let cell = tableView.dequeueReusableCell(withIdentifier: RatingTblCell.cellIdentifier, for: indexPath) as? RatingTblCell {
                cell.configure(listRatings: listRatingQuest)
                return cell

            }
        case .supportStatus(let supportProcessModel):
            if let cell = tableView.dequeueReusableCell(withIdentifier: SupportStatusTblCell.cellIdentifier, for: indexPath) as? SupportStatusTblCell {
                
                cell.configure(supportProcessModel: supportProcessModel)
                return cell
            }
        case .dummy:
            let cell = UITableViewCell()
            cell.backgroundColor = UIColor.red
            return UITableViewCell()
        case .space:
            let cell = UITableViewCell()
            cell.backgroundColor = UIColor(hex: "#F5F5F5")
            return UITableViewCell()
        }
        
        
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch vm.homeTblVData[indexPath.row]{
            
        case .supportRatingQuests(_):
            return 250
        case .supportStatus(_):
            return 211
        case .space:
            return 16
        case .dummy:
            return 250
        }
    }
    
}

extension HomeVC: HomeVMDelegate {
    func didGetNewHomeData() {
        
        tblHome.reloadData()
    }
    
    
}
