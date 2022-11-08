//
//  UserNameViewController.swift
//  stop relation
//
//  Created by 丸井優希 on 2022/10/23.
//

import UIKit
import GoogleMobileAds
class UserNameViewController: UIViewController, UITextFieldDelegate{
var bannerView: GADBannerView!
    @IBOutlet weak var text1: UITextField!
  
    
    @IBOutlet weak var Label1: UILabel!
    @IBOutlet weak var text2: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Label1.lineBreakMode = .byWordWrapping
        //delegateの定義
        text1.delegate = self
        text2.delegate = self
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
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var maxLength: Int = 0
        
        switch (textField.tag){
        case 1:
            maxLength = 15
        case 2:
            maxLength = 15
        default:
            break
        }
        let textFieldNumber = textField.text?.count ?? 0
        //入力された文字数
        let stringNumber = string.count
        
        return textFieldNumber + stringNumber <= maxLength
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func buttonTapped2(_ sender: Any) {
            let startViewController = self.storyboard?.instantiateViewController(withIdentifier: "StartViewController") as! StartViewController
        startViewController.username1 = self.text1.text
        startViewController.username2 = self.text2.text
        self.present(startViewController, animated: true, completion: nil)
        
        }
    }

