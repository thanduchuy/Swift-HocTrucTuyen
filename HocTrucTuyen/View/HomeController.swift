//
//  HomeController.swift
//  HocTrucTuyen
//
//  Created by Huy Than Duc on 15/12/2020.
//

import UIKit

class HomeController: UIViewController {
    
    @IBOutlet weak var AdCollectionView: UICollectionView!
    
    @IBOutlet weak var courseTable: UITableView!
    @IBOutlet weak var titleView: UILabel!
    @IBOutlet weak var menuBtn: UIButton!
    var viewMenu : UIView?
    var rightConstraintMenu : NSLayoutConstraint?
    let list : [Advertisement] = [
        Advertisement(image: "https://images.pexels.com/photos/3729557/pexels-photo-3729557.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500", priceOld: 250.0, priceNew: 200.0, name: "Tiếng việt lớp 1", author: "Đức Huy"),
        Advertisement(image: "https://images.pexels.com/photos/2954199/pexels-photo-2954199.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500", priceOld: 150.0, priceNew: 140.0, name: "Toán lớp 2", author: "Đức Huy"),
        Advertisement(image: "https://images.pexels.com/photos/1059383/pexels-photo-1059383.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500", priceOld: 150.0, priceNew: 120.0, name: "Tin học lớp 3", author: "Đức Huy"),
        Advertisement(image: "https://images.pexels.com/photos/1059380/pexels-photo-1059380.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500", priceOld: 50.0, priceNew: 40.5, name: "Khoa học lớp 4", author: "Đức Huy"),
        Advertisement(image: "https://images.pexels.com/photos/1029800/pexels-photo-1029800.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500", priceOld: 200.0, priceNew: 180.0, name: "Tiếng anh lớp 5", author: "Đức Huy")
    ]
    func configTable() {
        courseTable.delegate = self
        courseTable.dataSource = self
        courseTable.register(CourseTableCell.self, forCellReuseIdentifier: CourseTableCell.cellID)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollection()
        styleElement()
        configTable()
    }
    func styleElement() {
        menuBtn.configButtonMenu()
        titleView.colorTitle(title: "Trang Chủ")
    }
    func configCollection() {
        AdCollectionView.delegate = self
        AdCollectionView.dataSource = self
        AdCollectionView.register(AdvertisementCell.self, forCellWithReuseIdentifier: "ADCell")
        AdCollectionView.collectionViewLayout.invalidateLayout()
    }
}

extension HomeController: UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Danh sách khoá học"
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = courseTable.dequeueReusableCell(withIdentifier: CourseTableCell.cellID, for: indexPath) as! CourseTableCell
        cell.accessoryType = .disclosureIndicator
        cell.setValueCell(item: list[indexPath.row])
        return cell
    }
    
    
}

extension HomeController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let orientation = UIApplication.shared.statusBarOrientation
                if(orientation == .landscapeLeft || orientation == .landscapeRight)
                {
                    return CGSize(width: view.frame.width/2.5, height: 150)
                }
                else{
                    return CGSize(width: view.frame.width/1.5, height: 150)
                }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = AdCollectionView.dequeueReusableCell(withReuseIdentifier: "ADCell", for: indexPath) as! AdvertisementCell
        cell.backgroundColor = indexPath.row % 2 == 0 ? UIColor(named: "bgSelected") : UIColor(named: "black")
        cell.layer.shadowColor = indexPath.row % 2 == 0 ? UIColor(named: "black")?.cgColor : UIColor(named: "bgSelected" )?.cgColor
        cell.setStyleCell(item: list[indexPath.row],isHilighted: indexPath.row % 2 == 0)
        return cell
    }
    
}

extension UILabel {
    func colorTitle(title: String) {
        let label = NSMutableAttributedString()
        let arr = Array(title)
        for i in 0..<arr.count {
            if let yelow = UIColor(named: "bgSelected"), let black = UIColor(named: "bgMenu")  {
                label.append(NSMutableAttributedString(string: "\(arr[i])", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 40),NSAttributedString.Key.foregroundColor: i%2 == 0 ? black : yelow ]))
            }
        }
        self.attributedText = label
    }
}

extension UIButton {
    func configButtonMenu() {
        self.layer.cornerRadius = self.frame.height/2
        self.addTarget(self,action:#selector(buttonClicked),
                       for:.touchUpInside)
    }
    @objc func buttonClicked(sender:UIButton)
    {
        MenuViewController.instance.showAlert()
    }
}
