//
//  AddContactViewController.swift
//  FI-GI-IOS-APP-BY-MEHDI-BENREFAD
//
//  Created by Mehdi Benrefad on 20/06/2021.
//  Copyright © 2021 Mehdi Benrefad. All rights reserved.
//

import UIKit

class AddContactViewController: UIViewController, UIImagePickerControllerDelegate , UINavigationControllerDelegate {

    @IBOutlet weak var nom: UITextField!
    @IBOutlet weak var prenom: UITextField!
    @IBOutlet weak var tel: UITextField!
    @IBOutlet weak var boutonAjouter: UIButton!
    @IBOutlet weak var image: UIImageView!
    
    let imagePicker = UIImagePickerController()
    //@IBOutlet weak var boutonAjouter: UIButton!
    
    var imageData = Data()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        boutonAjouter.layer.cornerRadius=25.0
        imagePicker.delegate = self
        //definir la source de l'image
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //on verifie si l'utilisateur a selectionne une image correctement
         if let userPickerImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                    image.image = userPickerImage
            imageData = userPickerImage.pngData()!
            //Detect(image: ciimage)
        }
         imagePicker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func ajouter(_ sender: Any) {
        //On fait appel au contexte
        let contact=Contact(context: AppDelegate.viewContext)
        //On remplis lw Contexte
        contact.nom = nom.text
        contact.prenom = prenom.text
        contact.tel = tel.text
        contact.photo = imageData
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

    
    @IBAction func btnImage(_ sender: Any) {
        imagePicker.modalPresentationStyle = .fullScreen
        present(imagePicker,animated: true,completion: nil)
    }
}
