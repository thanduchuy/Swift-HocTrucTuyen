//
//  CategoryController.swift
//  HocTrucTuyen
//
//  Created by Huy Than Duc on 15/12/2020.
//

import UIKit

class CategoryController: UIViewController {

    @IBOutlet weak var btnMenu: UIButton!
    @IBOutlet weak var titleView: UILabel!
    @IBOutlet weak var categoryCollection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        btnMenu.configButtonMenu()
        titleView.colorTitle(title: "Danh Mục")
    }
    

}
