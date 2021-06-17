//
//  TextEditorViewController.swift
//  FI-GI-IOS-APP-BY-MEHDI-BENREFAD
//
//  Created by Mehdi Benrefad on 17/06/2021.
//  Copyright © 2021 Mehdi Benrefad. All rights reserved.
//

import UIKit

class TextEditorViewController: UIViewController {

    
       @IBOutlet weak var underl: UIButton!
       @IBOutlet weak var tt1: UILabel!
       
       @IBOutlet weak var tt2: UILabel!
       
       
       @IBOutlet weak var grasText: UIButton!
       
       
       @IBOutlet weak var italiqueText: UIButton!
       
       
       @IBOutlet weak var souligneText: UIButton!
       
       @IBOutlet weak var bigtext: UIButton!
       
       
       @IBOutlet weak var smiley1: UIImageView!
       
       
       @IBOutlet weak var smiley2: UIImageView!
       
       
       @IBOutlet weak var smiley3: UIImageView!
       
       
       @IBOutlet weak var Text: UITextField!
       
       
       @IBOutlet weak var sw1: UISwitch!
       
       
       @IBOutlet weak var sw2: UISwitch!
       
       
       @IBOutlet weak var sw3: UISwitch!
       
       var colort:UIColor?
       var fontt:UIFont?
       var und:Bool = false
       
       @IBOutlet weak var tf1: UILabel!
       
       @IBOutlet weak var tf3: UILabel!
       @IBOutlet weak var tf2: UILabel!
       @IBOutlet weak var swMenu: UISwitch!
       
       @IBAction func swMenuAction(_ sender: UISwitch) {
           
           if sender.isOn == false {
               self.grasText.isHidden = false
               self.italiqueText.isHidden = false
               
               self.souligneText.isHidden = false
               
               self.bigtext.isHidden = false
               self.tt1.isHidden = false
               self.tt2.isHidden = false
               self.sw1.isHidden = false
               self.sw2.isHidden = false
               self.sw3.isHidden = false
               self.tf1.isHidden = false
               self.tf2.isHidden = false
               self.tf3.isHidden = false
               self.smiley1.isHidden = false
               self.smiley2.isHidden = false
               self.smiley3.isHidden = false
               self.underl.isHidden = false
               
               }else{
               
               self.grasText.isHidden = true
                       self.italiqueText.isHidden = true
                       
                       self.souligneText.isHidden = true
                       
                       self.bigtext.isHidden = true
                       self.tt1.isHidden = true
                       self.tt2.isHidden = true
                       self.sw1.isHidden = true
                       self.sw2.isHidden = true
                       self.sw3.isHidden = true
                       self.tf1.isHidden = true
                       self.tf2.isHidden = true
                       self.tf3.isHidden = true
                       self.smiley1.isHidden = true
                       self.smiley2.isHidden = true
                       self.smiley3.isHidden = true
               self.underl.isHidden = true

           }
           
       }
       
       override func viewDidLoad() {
           super.viewDidLoad()
          Text.textAlignment = .left
          Text.contentVerticalAlignment = .top
           smiley1.image = UIImage(named: "em1")
           smiley2.image = UIImage(named: "em2")
           smiley3.image = UIImage(named: "em3")

           let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
           smiley1.isUserInteractionEnabled = true
           smiley1.addGestureRecognizer(tapGestureRecognizer)
           
           
          let tap = UITapGestureRecognizer(target: self, action: #selector(self.tappedMe))
          smiley2.addGestureRecognizer(tap)
          smiley2.isUserInteractionEnabled = true
           
           
           let tapp = UITapGestureRecognizer(target: self, action: #selector(self.tappedMe3))
           smiley3.addGestureRecognizer(tapp)
           smiley3.isUserInteractionEnabled = true
            
           
           
           
       }

       
       @IBAction func blackAction(_ sender: UISwitch) {
           
           if sender.isOn {
               sw2.isOn = false
               sw3.isOn = false
           }
           self.Text.textColor = UIColor.black
           self.colort = UIColor.black
           
       }
       
       
       
       @IBAction func RedAction(_ sender: UISwitch) {
           if sender.isOn {
               sw1.isOn = false
               sw3.isOn = false
           }
           self.Text.textColor = UIColor.red
                   self.colort = UIColor.red

       }
       
       
       
       @IBAction func BlueAction(_ sender: UISwitch) {
           if sender.isOn {
               sw1.isOn = false
               sw2.isOn = false
           }
           self.Text.textColor = UIColor.blue
                   self.colort = UIColor.blue
       }
       
       @IBAction func GrasAction(_ sender: Any) {
           Text.font = UIFont.boldSystemFont(ofSize: 13)
           self.fontt = UIFont.boldSystemFont(ofSize: 13)
       }
       
       
       @IBAction func ItaliqueAction(_ sender: Any) {
           self.Text.font = UIFont.italicSystemFont(ofSize: 13)
           self.fontt = UIFont.italicSystemFont(ofSize: 13)

       }
       
       @IBAction func souligneAction(_ sender: Any) {
          
           self.Text.font = UIFont.boldSystemFont(ofSize: 45)
           self.fontt = UIFont.boldSystemFont(ofSize: 45)

       }
       
       
       @IBAction func underl(_ sender: Any) {
           
           self.und = true
          
       }
       
       
       
       @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
       {
           let tappedImage = tapGestureRecognizer.view as! UIImageView
           self.Text.text = Text.text! + "😂"

       }
       
       
       @objc func tappedMe(tapGestureRecognizer: UITapGestureRecognizer)
        {
            let tappedImage = tapGestureRecognizer.view as! UIImageView
           self.Text.text = Text.text! + "😲"

        }
       
       
      @objc func tappedMe3(tapGestureRecognizer: UITapGestureRecognizer)
        {
            let tappedImage = tapGestureRecognizer.view as! UIImageView
           self.Text.text = Text.text! + "😰"

        }
       
       
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "seeText" {
               
               let cs = segue.destination as! TextEditorResultViewController
               
               cs.message = self.Text.text
               cs.mcolor = self.colort
               cs.mtextfont = self.fontt
               cs.condund = self.und
               
               self.und = false
              
             
           }
       }
       
       
    @IBAction func onSwipe(_ sender: UISwipeGestureRecognizer) {
        if sender.state == .ended {
                          print("hello")
               self.performSegue(withIdentifier: "textEditorToSideMenu", sender: nil)
               }
    }
    
       

}
