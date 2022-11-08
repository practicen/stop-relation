//
//  EndViewController.swift
//  stop relation
//
//  Created by 丸井優希 on 2022/10/23.
//

import UIKit
import GoogleMobileAds

class EndViewController: UIViewController {
    var bannerView: GADBannerView!
    var username1: String?
    var username2: String?
    var countNumUser1 = 0
    var countNumUser2 = 0
    @IBOutlet weak var label1: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        label1.text = "「\(username1!)」と「\(username2!)」の相性は...？"
        label1.lineBreakMode = .byWordWrapping
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

        
        @IBAction func resultButton(_ sender: Any) {
            
            let  resultViewController = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
            resultViewController.username1 = self.username1
            resultViewController.username2 = self.username2
            resultViewController.countNumUser1 = self.countNumUser1
            resultViewController.countNumUser2 = self.countNumUser2
            self.present(resultViewController, animated: true)
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
    
