//
//  ViewController.swift
//  HocTrucTuyen
//
//  Created by Huy Than Duc on 15/11/2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var btnStart: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
        setStyleView()
    }
    func setStyleView() {
        titleLabel.text = "HỌC \nTRỰC TUYẾN"
        btnStart.layer.cornerRadius = btnStart.frame.height/2
        self.navigationController?.isNavigationBarHidden = true
    }
    func setGradientBackground() {
        let colorTop =  UIColor(red: 63.0/255.0, green: 61.0/255.0, blue: 63.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 27.0/255.0, green: 27.0/255.0, blue: 27.0/255.0, alpha: 1.0).cgColor
                    
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0,1.0]
        gradientLayer.frame = self.view.bounds
                
        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
}

