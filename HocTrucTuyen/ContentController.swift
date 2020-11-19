//
//  ContentController.swift
//  HocTrucTuyen
//
//  Created by Huy Than Duc on 16/11/2020.
//

import UIKit

struct Advertisement {
    let image : String
    let priceOld : Double
    let priceNew : Double
    let name : String
    let author : String
}

class ContentController: UIViewController {

    @IBOutlet weak var avatarUser: UIImageView!
    @IBOutlet weak var ADCollectionView: UICollectionView!
    
    let list : [Advertisement] = [
        Advertisement(image: "https://lh3.googleusercontent.com/H_mZW7mOxi0KcV_7tVX_RCCDKgaMylGdRrd17Vx6egi6tIWtlUG_TS5xaeTOTc-rrgyQZAYSq_tMEXhpNqXb5K_q5Q5ZmCl8jPbSbxkb3z4kzOQ3KD9yk9YFY2dG9B0hnuUsU5LklqDgyAW-dmMHVGe-Beib1ilbuNQkrvwgcaBnYnhUvGZLsIk8df-DnBStl2CdXXujMlXqdOrEU1eqHs87nzaaiMuml6Q4LAp5yN3dWddYHFWB68Te2cPUQKARsHFCm_8ttiIbytNC3uQahBXW2vv9xwIXZ95eC9ZdCP3D5PRpMkr8G3PBT3S_rzXLf18Tl_dZ5sV518X1e94z17vpaJS27cx7vqbukuvXbhQDEqMHxflVYXsmyOtqO3aR3EBLbRWOePkrKY9Pecf930US0a_4Ue5TrT3hPpTvh-Ob0yVHQbe2w9MXp6IWKOFezqTwZHrFesAZn6Hg88CwbGXP0jKwgaP8Xm0Crt4okC3WGREyiSrSZ0Zll6y2SH30On9Sp9V7uNPxoMhW1q0liLgj04onlngU51KUCUSj45uWhi7M1DbI-OBj4upkDD1W3ldIXBG8o2evfV4JXopQ-tCrW4WNfq84w2j7gc7KLbqaJCRMdSxqyswi3WV9SoJunf5VaflVtZF7vtd5fHaI9isX1srRXa4rljICnoPiLSTjMMSWrBKXRuGCRh1w=s220-no?authuser=0", priceOld: 250.0, priceNew: 200.0, name: "Tiếng việt lớp 1", author: "Đức Huy"),
        Advertisement(image: "https://lh3.googleusercontent.com/Dnko55PFFrnjP0Wu2ElZf1fWSuqbu3CKoBSUGw8wHWS5y8H-MHbejBRByYNHDrjsaiV3oJ-GFnG7r77fQzyIgaHvlmS5wu_g9QAeG_kdlBKyvuFWQCZTZ8rBMEvf1A4BzrjJQSIVgCMOQ6ko0KnTUHB-OAIW3srjQROvJsFCei-O9rA1G8e1mLWOybdFLahTV5rdpO4Sl3CtqldEYAVLwkZkBd01Mv5vbF0zRVGY1Mu1JozQsArrkdM33PZ5e60epGrstu0v9RGf_SonmTC87894bYmSig0w7WjtrjxobgQu-RnedxUv2nJcFrQVQMQkMnceT6E3h4uewX1U-gtn7lArMRghyyETYyojPxYyVjG5_QtffU7V6t3xAkhG9QYjVd2DCvTRopvMOhFtCxH-_IQ35DsraSlD98QuGKeAd5EiadNK8aKAx9vmByYbczZASH9G-KuI7OxGXyqiWbNc-4SstV3OKdFdau5JssqK8z3mEb8mxNx9PKcUVvQwFk0Ffuj45hSP6XXZFkGsnWOdlMovCKYn-YZ9-pPYDxAPISwygoSDmmOcxp4fCZfC3eUKrDbXw9jNYMnwxYN-JZXRhPFd0zHlxrmSEFXSWcrNbfbCTJxMfvbkULDibByxGznjBIEFyFMw4NZYCxLSZZJRnooreXjrrYDix4QPNtNnGPwj9CFMhiC36vCM3mtm=s225-no?authuser=0", priceOld: 150.0, priceNew: 140.0, name: "Toán lớp 2", author: "Đức Huy"),
        Advertisement(image: "https://lh3.googleusercontent.com/pw/ACtC-3eE82Y3vOnsvZpUi-xDSuqBt7v_2vXwZuNJZchA4lklWljyjAOAP_GutrhIBhT7v1gP5ZIx8ilFXIRiyGr8NSsdT8J1mvNs4pflOYJCPw34m8ofP7H49rgZl5dWImgGVQueCh0utZUUVDSVS5iGoNqprgdxXQoxr6wyEBGPh1-EtgZaF3IRCtkzQbtZcHlXGL-Bu8VhgK-a2qzKJBTdZ8gW1WggiqigN0fI340wTBNHbsUWy0dMJsrfyyxey1upInwD66yPGbt-L1LjfrfN5UAQePJqwo6ZwVBryvrZzAlrERrU6L1YBj_CGpF1WkANcwyiGIl7aDZpng-2BUbCU4L-M4QlfktfWu9_kBwth7iDJBZaydvVEjHs-Hc-U6I5XHxVzZ9xoDkrEPIGl6aof78I_d3E6I6KUHqt7D3IQFpgCx0KjmofHKKbwTE0IMAnllkXEqieyDq4ORLAa_4Od6twRt2JiK67TISX1MZd4gRV8tgzk8uXc8U0z6tgSxHm2XhrhVdNgO1qzbPI-MKBPiuTAk13AEQEyIr4-t4bQXqvxv1RoyHtPAkCSuSlRXW6n3eFANX4xK-UhqlYuY0_5Q6VBzevSyQa14ALdOfdKPs6-_YLJJrUgAMS1OrBundfr41XU43omq8oT_fYS_UpfBCKV3Fq01gvJqPKxWwqGAeo_dZ5nmq43vkhHX0LMSZmGjr08tEX3UQ2mPiv4mg=s225-no?authuser=0", priceOld: 150.0, priceNew: 120.0, name: "Tin học lớp 3", author: "Đức Huy"),
        Advertisement(image: "https://lh3.googleusercontent.com/pw/ACtC-3cxJktp6wz6CcBOkqQ5ntAxc8VmQOV7CunLZq4k2CL2gHUizWtlSxTvDU-Upfl4z_77dsU4zXcVfYuZBoYB3z1pyaYCmhXEO6h5Bv1sJbzpROGtSwySAQoFckeAJ4FA9NOYERYlWTmcbZiAFWsoki2OWW-EaOmRnsYk7WqQe-EBZnHjpsybjqU3TUY3VjfZCmqlc9nRwrc8gLdC3E-KEyNwe39poFv6680mOJpSqMyUDaShaloC3Oifpq1OTLMqObjd0xiZxg9xODjcQfrGkCgzxodFmQOTyrwUYf5OOZhD2MhCVytOUgQTHEVMlIeg3oLyJbyk-uIjflJfuIVW819upSvckFl1wbrFNXkqn_IVABb8Eo_hrxp7KE-HKm2VtMkS9QSPWOUm2l7m39ulzFxGuXJIp0ApstnkNKlnDnXGg-DLg-5ZhTvfPvtrJBX8eqOYV6a8f-6rPHCvstOG1LT2nRciM8c8IY7es1yq5K5I_gPJo0Oob3oFtcAhbk7FLlCsiC3GX1Lya2d_0LGK5_Q3ksjfnqYMyw86wCOCBkgr6Tkf8ZbIZszcnIPBdnNF0yFAh9QHI2CabFZBSrCgmNUDCcYDCULjxsxc1P-n_6eZ4_sSVq4NZ8-vh0Tr6FNUor_T3tF1pEaGXyi4F0yy8dOZgsF9GNbDDDZxQLRLRTBJ0f7qQE6h_SzADuuBY8Rf70fm2nNvdGrpSLpXPjE=w213-h236-no?authuser=0", priceOld: 50.0, priceNew: 40.5, name: "Khoa học lớp 4", author: "Đức Huy"),
        Advertisement(image: "https://lh3.googleusercontent.com/pw/ACtC-3dTAZeOOTsS9-uK9KZ-do2apjv1Mtknvbaas5nQXH3OBSNoPUM2aiYueDrss46E52o-8yGyQ93ZP1Vj-mZF2r8OUwP49e8n4HGJdlvKccSua90naK0oPXgL5jb3BxUtWkrHE0mUz2-HhemHGVWfTzjBfwdLDjm6FKbi1PM6V6E_Go35ppOYzqsBamx4G7YarNYHdQmEzwhTNPFTD5cNYh9NroWR3UwJ4ldfvD_UbCr3gc-cPmNPOZBw44FMFwlPlKP-w7XoUgelL61VrGx-bTzJEJZZjfSSPzYvE6na-yjYDFOFsh4NFVmVv4gg9y5b0TtMpVabp3AWJTw1baO30Q9pZ7DxB9VVqXfrFbxwrup5x1PNQh8NE9WCGr82zdESGWYRgLfAdJYo0kV-N04r-iOzdnKfuA4Ur43xBeML7mYa6aCfsiYkVYUQiOPL62CKsn5bsOg0JXMBUh6aYAeZLTKKKRucxXgl40uQBasq4ovgJ8DigalkihzK9sHwYlHA4G5vcf5mw1WjcY-oJuKJreWL4ZkLo6sdJm16JU03taoFBQ1WxBoc-0-nIgINRjqrM4YSXPVlziFluqIq5kFH8RPys23I9XVUSrUA9DApesoInbQkv1LxYSiz99CN4IvX9iNbaAqKcGAFliJim7QWfYNMLhh7DnHTpdcD0JN06pVFbzNO6-NgJ-8uKjtaPq2Qvq8JQufKkNH6arPaxic=s225-no?authuser=0", priceOld: 200.0, priceNew: 180.0, name: "Tiếng anh lớp 5", author: "Đức Huy")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        avatarUser.layer.cornerRadius = avatarUser.frame.height/2
        configCollection()
    }
    func configCollection() {
        ADCollectionView.delegate = self
        ADCollectionView.dataSource = self
        ADCollectionView.register(AdvertisementCell.self, forCellWithReuseIdentifier: "ADCell")
        ADCollectionView.collectionViewLayout.invalidateLayout()
    }
}

extension ContentController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width/1.5, height: 150)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = ADCollectionView.dequeueReusableCell(withReuseIdentifier: "ADCell", for: indexPath) as! AdvertisementCell
        cell.backgroundColor = indexPath.row % 2 == 0 ? UIColor(named: "bgSelected") : UIColor(named: "black")
        cell.setStyleCell(item: list[indexPath.row],isHilighted: indexPath.row % 2 == 0)
        return cell
    }
    
}

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
}
extension UIImageView {
    func getImageFromURL(imgURL:String) {
        let url = URL(string: imgURL)
        let data = try? Data(contentsOf: url!)
        self.image = UIImage(data: data!)
    }
}
