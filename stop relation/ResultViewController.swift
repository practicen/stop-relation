//
//  ResultViewController.swift
//  stop relation
//
//  Created by 丸井優希 on 2022/10/23.
//

import UIKit
import GoogleMobileAds
import Accounts

class ResultViewController: UIViewController {
var bannerView: GADBannerView!
    var username1: String?
    var username2: String?
    var countNumUser1 = 0
    var countNumUser2 = 0
    var calculate = 0
    var endResult = 0
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculate = countNumUser1 - countNumUser2
        endResult = (1000 - abs(calculate) * 2) / 10
        if endResult == 100{
            resultLabel.lineBreakMode = NSLineBreakMode.byCharWrapping
            resultLabel.text = "\(endResult)%です！相性が完璧すぎます😲惚れ惚れするほど仲が良いですね！ここまで相性がいいと周りに自慢しても問題ないレベルです！"
            
        } else if endResult < 100 && endResult >= 90 {
            resultLabel.lineBreakMode = NSLineBreakMode.byCharWrapping
            resultLabel.text = "\(endResult)%です！非常に相性がいいですね。しかし、これ以上に相性の良い人もいるでしょう。ぜひ100%を目指してみてください！"
        
        } else if endResult < 90 && endResult >= 60 {
            resultLabel.lineBreakMode = NSLineBreakMode.byCharWrapping
            resultLabel.text = "\(endResult)%です！相性は良い方です。まだ仲良くなくてもこれから仲良くなれるはずです。たくさん話してお互いに打ち解けていきましょう！"
           
        } else if endResult < 60 && endResult >= 30 {
            resultLabel.lineBreakMode = NSLineBreakMode.byCharWrapping
            resultLabel.text =  "\(endResult)%です！相性は普通です。少しすれ違うこともあるかもしれないけれど、話し合って解決できればさらに仲は深まるはず！"
        } else if endResult < 30 {
            resultLabel.text =
            "\(endResult)%です！相性はあまり良くないかも。お互いのことを考えて行動できると仲良くできるはず！もう一度測ってみると変わるかも？"
            resultLabel.lineBreakMode = NSLineBreakMode.byCharWrapping
           
        }
     
//        if endResult <=90{
//if a <= 4 {
//        print("aは4以下")
//    } else if a >= 6 {
//        print("aは6以上")
//    } else {
//        print("aは5")
//    }

//
//        }else if {
//
//        }
        
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

    @IBAction func nextgamebutton(_ sender: Any) {
       let userNameViewController = self.storyboard?.instantiateViewController(withIdentifier: "UserNameViewController") as! UserNameViewController
        self.present(userNameViewController, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func gametopbutton(_ sender: Any) {
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.present(viewController, animated: true)
    }
    
    @IBAction func ResultCheckbutton(_ sender: Any) {
        let timeCheckViewController = self.storyboard?.instantiateViewController(withIdentifier: "TimeCheckViewController") as! TimeCheckViewController
        timeCheckViewController.username1 = self.username1
        timeCheckViewController.username2 = self.username2
        timeCheckViewController.countNumUser1 = self.countNumUser1
        timeCheckViewController.countNumUser2 = self.countNumUser2
        self.present(timeCheckViewController, animated: true)
    }
    
    
    @IBAction func sharebutton(_ sender: Any) {
        let shareText = "\(username1!)と\(username2!)の相性は\(endResult)%でした！みんなもペアマッチをダウンロードして診断結果を共有しましょう！"
           
       
        let shareImage = UIImage(named: "AppIcon")

        let activityItems = [shareText,shareImage] as [Any]

           // 初期化処理
           let activityVC = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)

           // 使用しないアクティビティタイプ
           let excludedActivityTypes = [
            UIActivity.ActivityType.postToFacebook,
            UIActivity.ActivityType.message,
            UIActivity.ActivityType.saveToCameraRoll,
            UIActivity.ActivityType.print
           ]

           activityVC.excludedActivityTypes = excludedActivityTypes

           // UIActivityViewControllerを表示
        self.present(activityVC, animated: true, completion: nil)
         }

    
    
    
}
