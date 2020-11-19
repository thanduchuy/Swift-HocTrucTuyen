//
//  HomeController.swift
//  HocTrucTuyen
//
//  Created by Huy Than Duc on 15/11/2020.
//

import UIKit

struct Menu {
    let name : String
    let image : String
}

class HomeController: UIViewController {


    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var bottomView: UIView!
    
    let list : [Menu] = [
        Menu(name: "Trang chủ", image: "homepage"),
        Menu(name: "Tìm kiếm", image: "loupe"),
        Menu(name: "Lịch học", image: "group")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        styleView()
        configCollection()
    }
    func configCollection() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout.invalidateLayout()
        collectionView.register(HomeCollectionCell.self, forCellWithReuseIdentifier: "HomeCell")
        collectionView.selectItem(at: IndexPath(row: 0, section: 0), animated: true, scrollPosition: .centeredHorizontally)
    }
    func styleView() {
        topView.clipsToBounds = true
        topView.layer.cornerRadius = 50
        topView.layer.maskedCorners = [.layerMinXMaxYCorner]
        bottomView.clipsToBounds = true
        bottomView.layer.cornerRadius = 50
        bottomView.layer.maskedCorners = [.layerMaxXMinYCorner]
    }
}

extension HomeController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width-20)/3, height: 100)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCollectionCell
        cell.setStyleCell(item: list[indexPath.row])
        return cell
    }
    
}

class HomeCollectionCell : UICollectionViewCell {
    let imageView : UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.backgroundColor = UIColor(named: "bgItem")
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    let label : UILabel = {
        let lb = UILabel()
        lb.textColor = UIColor(named: "bgItem")
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(named: "bgMenu")
    }
    override var isSelected: Bool {
        didSet {
            if isSelected {
                self.backgroundColor = UIColor(named: "bgSelected")
                self.label.textColor = UIColor(named: "black")
            } else {
                self.backgroundColor = UIColor(named: "bgMenu")
                self.label.textColor = UIColor(named: "bgItem")
            }
        }
    }
    func setStyleCell(item:Menu) {
         
        layer.cornerRadius = 20
        addSubview(imageView)
        addSubview(label)
        
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 25
        imageView.image = UIImage(named: item.image)
        imageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        
        label.text = item.name
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10).isActive = true
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
