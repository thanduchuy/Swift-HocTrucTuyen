//
//  CourseTableCell.swift
//  HocTrucTuyen
//
//  Created by Huy Than Duc on 24/12/2020.
//

import UIKit

class CourseTableCell: UITableViewCell {

    static let cellID = "CourseTableCell"
    lazy var background : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var imageCoure : UIImageView = {
        let iv = UIImageView()
        iv.layer.masksToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.cornerRadius = 45
        return iv
    }()
    lazy var titleCourse : UILabel = {
        let lb = UILabel()
        lb.font = UIFont.boldSystemFont(ofSize: 25)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundCell()
        self.setStyleImageView()
        self.setStyleTitle()
    }
    func backgroundCell() {
        addSubview(background)
        
        NSLayoutConstraint.activate([
            background.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            background.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            background.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            background.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
        setNeedsLayout()
        layoutIfNeeded()
        background.clipsToBounds = true
        background.layer.cornerRadius = background.frame.height*1.5
        if let yellow = UIColor(named: "bgSelected"),let black = UIColor(named: "bgMenu") {
            if Bool.random() {
                titleCourse.textColor = black
                background.backgroundColor = yellow.withAlphaComponent(0.7)
            } else {
                titleCourse.textColor = yellow
                background.backgroundColor = black.withAlphaComponent(0.7)
            }
        }
    }
    func setValueCell(item: Advertisement) {
        imageCoure.getImageFromURL(imgURL: item.image)
        titleCourse.text = item.name
    }
    func setStyleTitle() {
        background.addSubview(titleCourse)
        NSLayoutConstraint.activate([
            titleCourse.leadingAnchor.constraint(equalTo: imageCoure.trailingAnchor, constant: 10),
            titleCourse.centerYAnchor.constraint(equalTo: imageCoure.centerYAnchor)
        ])
    }
    func setStyleImageView() {
        background.addSubview(imageCoure)
        NSLayoutConstraint.activate([
            imageCoure.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 5),
            imageCoure.widthAnchor.constraint(equalToConstant: 90),
            imageCoure.heightAnchor.constraint(equalToConstant: 90),
            imageCoure.centerYAnchor.constraint(equalTo: background.centerYAnchor)
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
