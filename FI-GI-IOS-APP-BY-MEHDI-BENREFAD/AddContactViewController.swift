//
//  AddContactViewController.swift
//  FI-GI-IOS-APP-BY-MEHDI-BENREFAD
//
//  Created by Mehdi Benrefad on 20/06/2021.
//  Copyright © 2021 Mehdi Benrefad. All rights reserved.
//

import UIKit

class AddContactViewController: UIViewController {

    @IBOutlet weak var nom: UITextField!
    @IBOutlet weak var prenom: UITextField!
    @IBOutlet weak var tel: UITextField!
    @IBOutlet weak var boutonAjouter: UIButton!
    
    //@IBOutlet weak var boutonAjouter: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        boutonAjouter.layer.cornerRadius=25.0    }
    
    
    @IBAction func ajouter(_ sender: Any) {
        //On fait appel au contexte
        let contact=Contact(context: AppDelegate.viewContext)
        //On remplis lw Contexte
        contact.nom = nom.text
        contact.prenom = prenom.text
        contact.tel = tel.text
        //sauvegarder le contexte
        try? AppDelegate.viewContext.save()
       
        //revenir en arriere
        //dismiss(animated: true, completion: nil)
        
        
    }
    
    @IBAction func dismiss(_ sender: Any) {
        nom.resignFirstResponder()
        prenom.resignFirstResponder()
        tel.resignFirstResponder()
    }


}
