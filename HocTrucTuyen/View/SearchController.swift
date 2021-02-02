//
//  SearchController.swift
//  HocTrucTuyen
//
//  Created by Huy Than Duc on 15/12/2020.
//

import UIKit

class SearchController: UIViewController {

    @IBOutlet weak var titleView: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        titleView.colorTitle(title: "Tìm Kiếm")
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
