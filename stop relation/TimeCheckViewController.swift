//
//  TimeCheckViewController.swift
//  stop relation
//
//  Created by 丸井優希 on 2022/11/03.
//

import UIKit
import GoogleMobileAds


class TimeCheckViewController: UIViewController {
    var bannerView: GADBannerView!
    var username1: String?
    var username2: String?
    var countNumUser1 = 0
    var countNumUser2 = 0
    
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var label2: UILabel!
    
    @IBOutlet weak var label3: UILabel!
    
    @IBOutlet weak var label4: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let ms1 = countNumUser1 % 100
        let s1 = (countNumUser1 - ms1) / 100 % 60
        let m1 = (countNumUser1 - ms1 - s1) / 6000 % 100
        let ms2 = countNumUser2 % 100
        let s2 = (countNumUser2 - ms2) / 100 % 60
        let m2 = (countNumUser2 - ms2 - s2) / 6000 % 100
        label1.text = "「\(username1!)」さん"
        label1.lineBreakMode = .byWordWrapping
        label2.text = String(format:  "%02d:%02d:%02d", m1,s1,ms1)
        label3.text = "「\(username2!)」さん"
        label3.lineBreakMode = .byWordWrapping
        label4.text = String(format:  "%02d:%02d:%02d", m2,s2,ms2)
        // Do any additional setup after loading the view.

        bannerView = GADBannerView(adSize: GADAdSizeBanner)
        bannerView.adUnitID = "ca-app-pub-2313732454636490/4054779245"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        addBannerViewToView(bannerView)

        // Do any additional setup after loading the view.
        }

        func addBannerViewToView(_ bannerView: GADBannerView) {
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bannerView)
        view.addConstraints([NSLayoutConstraint(item: bannerView,
                                                attribute: .bottom,
                                                relatedBy: .equal,
                                                toItem: view.safeAreaLayoutGuide,
                                                attribute: .bottom,
                                                multiplier: 1,
                                                constant: 0),
                             NSLayoutConstraint(item: bannerView,
                                                 attribute: .centerX,
                                                 relatedBy: .equal,
                                                 toItem: view,
                                                 attribute: .centerX,
                                                 multiplier: 1,
                                                 constant: 0)])
        }

    
    
    @IBAction func backbutton(_ sender: Any) {
        let  resultViewController = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        resultViewController.username1 = self.username1
        resultViewController.username2 = self.username2
        resultViewController.countNumUser1 = self.countNumUser1
        resultViewController.countNumUser2 = self.countNumUser2
        self.present(resultViewController, animated: true)
    }
    
    
    @IBAction func nextgamebutton(_ sender: Any) {
        let userNameViewController = self.storyboard?.instantiateViewController(withIdentifier: "UserNameViewController") as! UserNameViewController
        self.present(userNameViewController, animated: true)
    }
    
    
    @IBAction func gametopbutton(_ sender: Any) {
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.present(viewController, animated: true)
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
