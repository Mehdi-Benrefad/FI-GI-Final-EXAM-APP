//
//  TextEditorResultViewController.swift
//  FI-GI-IOS-APP-BY-MEHDI-BENREFAD
//
//  Created by Mehdi Benrefad on 17/06/2021.
//  Copyright © 2021 Mehdi Benrefad. All rights reserved.
//

import UIKit

class TextEditorResultViewController: UIViewController {
    var message:String?
       var mcolor:UIColor?
       var mtextfont:UIFont?
       var condund:Bool?

       override func viewDidLoad() {
           
           super.viewDidLoad()
           
         

       }
       
       override func viewWillAppear(_ animated: Bool) {
           T2.text = message!
           
         
           
           T2.textColor = self.mcolor
           T2.font = self.mtextfont
           
           if condund == true {
               
               T2.attributedText = NSAttributedString(string: message!, attributes:
                      [.underlineStyle: NSUnderlineStyle.single.rawValue])
               
           }
          
           
       }
       

       
       @IBOutlet weak var T2: UILabel!

}
