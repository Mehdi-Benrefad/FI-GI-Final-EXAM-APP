//
//  ChatViewController.swift
//  FI-GI-IOS-APP-BY-MEHDI-BENREFAD
//
//  Created by Mehdi Benrefad on 29/06/2021.
//  Copyright © 2021 Mehdi Benrefad. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ChatViewController: UIViewController {
    @IBOutlet weak var username: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //logInAnnony()
    }
    
    func logInAnnony(){
        Auth.auth().signInAnonymously(completion: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "LoginToChat"{
            //recuperer le controlleur de destination
            var chat = segue.destination as! Chat2ViewController
            chat.username = self.username.text ?? ""
         
            //ce segue sera lance dans la methode valider en haut
        }
    }
}
