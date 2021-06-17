//
//  HomeViewController.swift
//  FI-GI-IOS-APP-BY-MEHDI-BENREFAD
//
//  Created by Mehdi Benrefad on 16/06/2021.
//  Copyright © 2021 Mehdi Benrefad. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

   
    @IBAction func showSideMenu(_ sender: Any) {
        self.performSegue(withIdentifier: "showSideMenu", sender: nil)
    }
    
    @IBAction func onSwipe(_ sender: UISwipeGestureRecognizer) {
        if sender.state == .ended {
                   print("hello")
        self.performSegue(withIdentifier: "showSideMenu", sender: nil)
               }
    }
    
}
