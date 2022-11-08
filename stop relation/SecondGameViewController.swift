//
//  GameViewController.swift
//  stop relation
//
//  Created by 丸井優希 on 2022/10/23.
//

import UIKit

class SecondGameViewController: UIViewController {

    @IBOutlet weak var timeDisplay: UILabel!
    
    var countNumUser2 = 0
    var countNumUser1 = 0
    var timerRunning = false
    var timer = Timer()
    var username1: String?
    var username2: String?
    
    
    @IBOutlet weak var button2: ExpansionButtons!
    override func viewDidLoad() {
        super.viewDidLoad()
        button2.insets = UIEdgeInsets(top: 2000, left: 2500, bottom: 2500, right: 2500)
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.updateDisplay), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func buttonTapped4(_ sender: Any) {
        let endViewController = self.storyboard?.instantiateViewController(withIdentifier: "EndViewController") as! EndViewController
        endViewController.username1 = self.username1
        endViewController.username2 = self.username2
        endViewController.countNumUser1 = self.countNumUser1
        endViewController.countNumUser2 = self.countNumUser2
        self.present(endViewController, animated: true)
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
        countNumUser2 += 1
        let ms = countNumUser2 % 100
        let s = (countNumUser2 - ms) / 100 % 60
        let m = (countNumUser2 - ms - s) / 6000 % 100
        timeDisplay.text = String(format: "%02d:%02d:%02d", m,s,ms)
    }
}

class ExpansionButtons: UIButton {

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


