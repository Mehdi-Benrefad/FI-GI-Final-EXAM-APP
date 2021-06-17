//
//  GessingGameViewController.swift
//  FI-GI-IOS-APP-BY-MEHDI-BENREFAD
//
//  Created by Mehdi Benrefad on 16/06/2021.
//  Copyright © 2021 Mehdi Benrefad. All rights reserved.
//

import UIKit

class GessingGameViewController: UIViewController {

    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var titre: UILabel!
    @IBOutlet weak var bouton: UIButton!
    @IBOutlet weak var `switch`: UISwitch!
    @IBOutlet weak var input: UITextField!
    var random=Int()
    var entree=Int()
    var count=Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        random = Int(arc4random_uniform(10))
        // Do any additional setup after loading the view.
        bouton.layer.cornerRadius=25.0
        //**
        input.backgroundColor = UIColor.white
        //on initialise lemode et les couleurs
        initialiserMode()
        }

    //on change la couleur de background et on modifie la variable dans user default
    @IBAction func changeMode(_ sender: UISwitch) {
       changefromSwitch()
    }
    
    @IBAction func jouer(_ sender: Any) {
    
        if bouton.titleLabel?.text == "Restart" {
            
            restartGame()
            
        }else{
           
                guard let inp = Int(input.text!)  else {
                    let alertVC = UIAlertController(title: "Erreur", message: "vous devez entrer un entier", preferredStyle: .alert)
                    alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    present(alertVC, animated: true, completion: nil)
                    return
                }
                
                
                 let inp2 = Int(input.text!)!
                 guard  inp2 > -1  , inp2 < 10 else {
                               let alertVC = UIAlertController(title: "Warning", message: "vous devez entrer un entier compris entre 0 et 9", preferredStyle: .alert)
                               alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                               present(alertVC, animated: true, completion: nil)
                               return
                }
            
            
                count = count + 1
            
                if inp == random {
                    message.textColor = UIColor.green
                    message.text = "vous gagnez le jeu apres \(count) essai"
                    //**
                    restartEffet()
                    //**
                    let alertVC = UIAlertController(title: "Winner", message: "vous gagnez le jeu apres \(count) essai", preferredStyle: .alert)
                    alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    present(alertVC, animated: true, completion: nil)
                
                }
                else if inp < random {
                    message.text = "Entrez une Valeur superieur a [\(inp)]"
                    input.text=""
                    /*
                     let alertVC = UIAlertController(title: "petite", message: "la valeur est inferieur au random", preferredStyle: .alert)
                    alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    present(alertVC, animated: true, completion: nil)
                    */
                }else if inp > random {
                    message.text = "Entrez une Valeur inferieur a [\(inp)]"
                    input.text=""
                    /*
                     let alertVC = UIAlertController(title: "grande", message: "la valeur est superieur au random", preferredStyle: .alert)
                    alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    present(alertVC, animated: true, completion: nil)
                     */
                    
                }
        }
        
    }

    
    func changefromSwitch(){
        if `switch`.isOn == true{
            backgroundService.color = "black"
            view.backgroundColor = UIColor.black
            bouton.backgroundColor = UIColor.gray
            titre.textColor = UIColor.white
            label.textColor = UIColor.white
        }else{
            backgroundService.color = "white"
            view.backgroundColor = UIColor.white
            bouton.backgroundColor = UIColor.black
            bouton.titleLabel?.textColor = UIColor.white
            titre.textColor = UIColor.black
            label.textColor = UIColor.black
            
        }
        
    }
    
    func initialiserMode(){
        switch backgroundService.color {
           case "black":
               view.backgroundColor = UIColor.black
               `switch`.isOn = true
                bouton.backgroundColor = UIColor.gray
                titre.textColor = UIColor.white
                label.textColor = UIColor.white
            case "white":
               view.backgroundColor = UIColor.white
                `switch`.isOn = false
               bouton.backgroundColor = UIColor.black
               bouton.titleLabel?.textColor = UIColor.white
                titre.textColor = UIColor.black
                label.textColor = UIColor.black
        default:
               break
           }
        
    }
    
    func restartEffet(){
        //fonction qui permer de modifier le bouton en cas de succes
        bouton.backgroundColor = UIColor.green
        bouton.setTitle("Restart", for: .normal)
        
    }
    
    
    //restart game
    func restartGame(){
        bouton.setTitle("Jouer", for: .normal)
        message.text = ""
        message.textColor = UIColor.red
        initialiserMode()
        random = Int(arc4random_uniform(10))
        count = 0
        input.text=""
    }
    
    
   
    @IBAction func onSwipe(_ sender: UISwipeGestureRecognizer) {
        if sender.state == .ended {
                   print("hello")
        self.performSegue(withIdentifier: "GuessingGameToSideMenu", sender: nil)
               }
    }    
    
}
