//
//  AdventisementCell.swift
//  HocTrucTuyen
//
//  Created by Huy Than Duc on 15/12/2020.
//

import UIKit


class AdvertisementCell : UICollectionViewCell {
    let image : UIImageView = {
        let iv = UIImageView()
        iv.layer.masksToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    let labelName : UILabel = {
        let lb = UILabel()
        lb.textAlignment = .left
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    let labelPrice : UILabel = {
        let lb = UILabel()
        lb.textAlignment = .left
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    let btnBuy : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        btn.setTitle("Đăng ký ngay", for: .normal)
        return btn
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    func setStyleCell(item:Advertisement,isHilighted:Bool) {
        layer.cornerRadius = 20
        boxShadow()
        addSubview(image)
        image.getImageFromURL(imgURL: item.image)
        image.layer.cornerRadius = 5
        image.heightAnchor.constraint(equalToConstant: 90).isActive = true
        image.widthAnchor.constraint(equalToConstant: bounds.width/2.2).isActive = true
        image.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        
        addSubview(labelName)
        let attributedText = NSMutableAttributedString(string: "\(item.name)\n", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14),NSAttributedString.Key.foregroundColor: isHilighted ? UIColor(named: "black")! : UIColor(named: "bgSelected")! ])
        attributedText.append(NSMutableAttributedString(string: item.author, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12),NSAttributedString.Key.foregroundColor: isHilighted ? UIColor(named: "black")! : UIColor(named: "bgSelected")!]))
        labelName.attributedText = attributedText
        labelName.numberOfLines = 0
        labelName.lineBreakMode = .byWordWrapping
        labelName.topAnchor.constraint(equalTo: image.firstBaselineAnchor).isActive = true
        labelName.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 5).isActive = true
        
        addSubview(btnBuy)
        btnBuy.layer.cornerRadius = 5
        btnBuy.backgroundColor = isHilighted ? UIColor(named: "black")! : UIColor(named: "bgSelected")!
        btnBuy.bottomAnchor.constraint(equalTo: image.lastBaselineAnchor).isActive = true
        btnBuy.heightAnchor.constraint(equalToConstant: 40).isActive = true
        btnBuy.widthAnchor.constraint(equalToConstant: bounds.width/2.2).isActive = true
        btnBuy.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 5).isActive = true
        
        addSubview(labelPrice)
        let priceText = NSMutableAttributedString(string: "$\(item.priceOld)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13),NSAttributedString.Key.foregroundColor: UIColor.lightGray ])
        priceText.append(NSMutableAttributedString(string: "  $\(item.priceNew)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15),NSAttributedString.Key.foregroundColor: UIColor.red]))
        priceText.addAttribute(NSAttributedString.Key.strikethroughStyle,
                               value: NSUnderlineStyle.single.rawValue,
                               range: NSRange(location: 0, length: "$\(item.priceOld)".count))
        labelPrice.attributedText = priceText
        labelPrice.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 10).isActive = true
        labelPrice.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func boxShadow() {
        layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.layer.cornerRadius).cgPath
        self.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 1.0
    }
}
extension UIImageView {
    func getImageFromURL(imgURL:String) {
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            let url = URL(string: imgURL)
            let data = try? Data(contentsOf: url!)
            Instance.semaphore.wait()
            DispatchQueue.main.async { [weak self] in
                self!.image = UIImage(data: data!)
                Instance.semaphore.signal()
            }
            
        }

    }
}
