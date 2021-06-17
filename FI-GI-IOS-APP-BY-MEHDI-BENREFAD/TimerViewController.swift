//
//  TimerViewController.swift
//  FI-GI-IOS-APP-BY-MEHDI-BENREFAD
//
//  Created by Mehdi Benrefad on 17/06/2021.
//  Copyright © 2021 Mehdi Benrefad. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {

   var timer = Timer()
       var counter = 0
       var startStop = "stop"
       @IBOutlet weak var image: UIImageView!
       @IBOutlet weak var titre: UILabel!
       @IBOutlet weak var count: UILabel!
       override func viewDidLoad() {
           super.viewDidLoad()
           titre.text = "Animation Stoped"
           // Do any additional setup after loading the view.
       }


       @IBAction func pause(_ sender: Any) {
           if startStop == "start"{
               timer.invalidate()
               startStop = "stop"
               titre.text = "Animation Paused"
           }
       }
       
       @IBAction func start(_ sender: Any) {
           if startStop == "stop"{
               timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(change), userInfo: nil, repeats: true)
               
                  // counter = counter + 1
               startStop = "start"
               titre.text = "Animation Started"
           }
       }
       
       @IBAction func stop(_ sender: Any) {
           if startStop == "start" {
               timer.invalidate()
               counter = 0
               count.text = "0"
               startStop = "stop"
               titre.text = "Animation Stoped"
           }
           else if startStop == "stop"{
               counter = 0
               count.text = "0"
               startStop = "stop"
               titre.text = "Animation Stoped"
           }
       }
       
       @objc func change(){
           count.text = String(counter)
           if counter % 2 == 0 {
                       image.image = UIImage(named:  "evide")
                   }else{
                       image.image = UIImage(named:  "epleine")
           }
           counter += 1
           
       }

    @IBAction func onSwipe(_ sender: UISwipeGestureRecognizer) {
        if sender.state == .ended {
                   print("hello")
        self.performSegue(withIdentifier: "timerToSideMenu", sender: nil)
               }
    }
}
