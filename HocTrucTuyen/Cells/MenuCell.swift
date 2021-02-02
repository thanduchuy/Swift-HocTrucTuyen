//
//  MenuCell.swift
//  HocTrucTuyen
//
//  Created by Huy Than Duc on 15/12/2020.
//

import UIKit

class MenuCell : UICollectionViewCell {
    let imageView : UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.tintColor = UIColor(named: "bgSelected")
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    let label : UILabel = {
        let lb = UILabel()
        lb.textColor = UIColor(named: "bgSelected")
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
                self.imageView.tintColor = UIColor(named: "black")
                self.backgroundColor = UIColor(named: "bgSelected")
                self.label.textColor = UIColor(named: "black")
            } else {
                self.imageView.tintColor = UIColor(named: "bgSelected")
                self.backgroundColor = UIColor(named: "bgMenu")
                self.label.textColor = UIColor(named: "bgSelected")
            }
        }
    }
    func setStyleCell(item:Menu) {
         
        layer.cornerRadius = 20
        addSubview(imageView)
        addSubview(label)
        
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: item.image)?.withRenderingMode(.alwaysTemplate)
        imageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        label.text = item.name
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10).isActive = true
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
