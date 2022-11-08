//
//  StartViewController.swift
//  stop relation
//
//  Created by 丸井優希 on 2022/10/23.
//

import UIKit
import GoogleMobileAds

class StartViewController: UIViewController {
    var bannerView: GADBannerView!
    @IBOutlet weak var label1: UILabel!
    var username1: String?
    var username2: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label1.text = "「\(username1!)」さんからだよ！目をつぶって10秒だと思ったタイミングで画面をタップしてね！"
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

        
        
        @IBAction func buttontapped3(_ sender: Any) {
            let gameViewController = self.storyboard?.instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
            gameViewController.username1 = self.username1
            gameViewController.username2 = self.username2
            self.present(gameViewController, animated: true)
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
    
