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

class MenuController: UIViewController {


    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var bottomView: UIView!
    
    let list : [Menu] = [
        Menu(name: "Trang chủ", image: "home"),
        Menu(name: "Tìm kiếm", image: "search"),
        Menu(name: "Danh mục", image: "note")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        styleView()
        configCollection()
        viewDefault()
    }
    func viewDefault() {
        let view = self.storyboard?.instantiateViewController(identifier: "HomeVC") as? HomeController
        view?.willMove(toParent: self)
        self.topView.addSubview((view?.view)!)
        self.addChild(view!)
        view?.didMove(toParent: self)
    }
    func configCollection() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout.invalidateLayout()
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: "HomeCell")
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

extension MenuController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width-20)/3, height: 100)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! MenuCell
        cell.setStyleCell(item: list[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let view : UIViewController?
        switch indexPath.row {
        case 0:
            view = self.storyboard?.instantiateViewController(identifier: "HomeVC") as? HomeController
        case 1:
            view = self.storyboard?.instantiateViewController(identifier: "SearchVC") as? SearchController
        case 2:
            view = self.storyboard?.instantiateViewController(identifier: "CategoryVC") as? CategoryController
        default:
            view = self.storyboard?.instantiateViewController(identifier: "HomeVC") as? HomeController
        }
        for view in self.topView.subviews {
            view.removeFromSuperview()
        }
        view?.willMove(toParent: self)
        self.topView.addSubview((view?.view)!)
        self.addChild(view!)
        view?.didMove(toParent: self)
    }
}
