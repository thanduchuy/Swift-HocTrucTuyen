//
//  MenuViewController.swift
//  HocTrucTuyen
//
//  Created by Huy Than Duc on 18/12/2020.
//

import UIKit

class MenuViewController: UIView {
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var menuView: UIView!
    
    @IBOutlet weak var lectureStack: UIStackView!
    @IBOutlet weak var more: UIStackView!
    @IBOutlet weak var leadingStack: NSLayoutConstraint!
    var checkMore = true
    static let instance = MenuViewController()
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    func loadView() {
       Bundle.main.loadNibNamed("MenuView", owner: self, options: nil)
        setStyle()
        self.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action:  #selector (self.offAlert (_:)))
        self.parentView.addGestureRecognizer(gesture)
    }
    @objc func offAlert(_ sender:UITapGestureRecognizer){
        parentView.removeFromSuperview()
    }
    func setStyle() {
        parentView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        parentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        more.layer.cornerRadius = 5
        setUpMenuView()
        eventLecture()
    }
    func eventLecture() {
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction))
        self.lectureStack.addGestureRecognizer(gesture)
    }
    @objc func checkAction(sender : UITapGestureRecognizer) {
        leadingStack.constant = checkMore ? -(more.frame.width+5) : -30
        UIView.animate(withDuration: 2,
                       delay: 1,
                       options: [],
                       animations: { [weak self] in
                        self!.layoutIfNeeded()
          }, completion: nil)
        checkMore.toggle()
    }
    func setUpMenuView() {
        menuView.layer.cornerRadius = 10
        menuView.layer.borderColor = UIColor.black.cgColor
        menuView.layer.borderWidth = 1
        bringSubviewToFront(menuView)
    }
    func showAlert() {
        loadView()
        let keyWindow = UIApplication.shared.connectedScenes
                .lazy
                .filter { $0.activationState == .foregroundActive }
                .compactMap { $0 as? UIWindowScene }
                .first?
                .windows
                .first { $0.isKeyWindow }
        keyWindow?.addSubview(parentView)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

