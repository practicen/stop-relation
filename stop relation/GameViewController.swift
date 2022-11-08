//
//  GameViewController.swift
//  stop relation
//
//  Created by 丸井優希 on 2022/10/23.
//

import UIKit
import GoogleMobileAds

class GameViewController: UIViewController {

    
    @IBOutlet weak var timeDisplay: UILabel!
    
    var countNumUser1 = 0
    var timerRunning = false
    var timer = Timer()
    var username1: String?
    var username2: String?
    
    @IBOutlet weak var button1: ExpansionButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button1.insets = UIEdgeInsets(top: 2000, left: 2500, bottom: 2500, right: 2500)
   
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.updateDisplay), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
 
    
    @IBAction func buttonTapped5(_ sender: Any, forEvent event: UIEvent) {
        let nextUserViewController = self.storyboard?.instantiateViewController(withIdentifier: "NextUserViewController") as! NextUserViewController
        nextUserViewController.username1 = self.username1
        nextUserViewController.username2 = self.username2
        nextUserViewController.countNumUser1 = self.countNumUser1
        self.present(nextUserViewController, animated: true)
    }
    
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @objc func updateDisplay() {
        countNumUser1 += 1
        let ms = countNumUser1 % 100
        let s = (countNumUser1 - ms) / 100 % 60
        let m = (countNumUser1 - ms - s) / 6000 % 100
        timeDisplay.text = String(format: "%02d:%02d:%02d", m,s,ms)
    }
}


class ExpansionButton: UIButton {

    var insets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        var rect = bounds
        rect.origin.x -= insets.left
        rect.origin.y -= insets.top
        rect.size.width += insets.left + insets.right
        rect.size.height += insets.top + insets.bottom

        // 拡大したViewサイズがタップ領域に含まれているかどうかを返します
        return CGRectContainsPoint(rect, point)
    }
}
