//
//  ViewController.swift
//  FI-GI-IOS-APP-BY-MEHDI-BENREFAD
//
//  Created by Mehdi Benrefad on 16/06/2021.
//  Copyright © 2021 Mehdi Benrefad. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate{

    var list = ["Home","Guessing Game","Timer","IMC Calculator","Text Editor","Object Recognition","Map Location"]
    
    @IBOutlet weak var tableViewSideMenu: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellule = list[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuCell", for: indexPath) as? SideMenuCell else {
                   return UITableViewCell()
               }
          cell.configure(img: UIImage(), text: cellule)
                return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           switch list[indexPath.row]{
               case "Home" :
                   print("hellooo")
                   let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                   let newViewController = storyBoard.instantiateViewController(withIdentifier: "Homevc") as! UINavigationController
                   newViewController.modalPresentationStyle = .fullScreen
                   self.present(newViewController, animated: true, completion: nil)
               
               case "Guessing Game":
                   let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                   let newViewController = storyBoard.instantiateViewController(withIdentifier: "Devinette") as! UINavigationController
                   newViewController.modalPresentationStyle = .fullScreen
                   self.present(newViewController, animated: true, completion: nil)
               
               case "Timer":
                   let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                   let newViewController = storyBoard.instantiateViewController(withIdentifier: "Timer") as! UINavigationController
                   newViewController.modalPresentationStyle = .fullScreen
                   self.present(newViewController, animated: true, completion: nil)
               
               case "IMC Calculator":
                   let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                   let newViewController = storyBoard.instantiateViewController(withIdentifier: "IMC Calculator") as! UINavigationController
                   newViewController.modalPresentationStyle = .fullScreen
                   self.present(newViewController, animated: true, completion: nil)
            
            //Map Location
                case "Map Location":
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let newViewController = storyBoard.instantiateViewController(withIdentifier: "Map Location") as! UINavigationController
                    newViewController.modalPresentationStyle = .fullScreen
                    self.present(newViewController, animated: true, completion: nil)
            
            //TextEditor
                case "Text Editor":
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let newViewController = storyBoard.instantiateViewController(withIdentifier: "TextEditor") as! UINavigationController
                    newViewController.modalPresentationStyle = .fullScreen
                    self.present(newViewController, animated: true, completion: nil)
            
            //ObjectRecognition
                case "Object Recognition":
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let newViewController = storyBoard.instantiateViewController(withIdentifier: "ObjectRecognition") as! UINavigationController
                    newViewController.modalPresentationStyle = .fullScreen
                    self.present(newViewController, animated: true, completion: nil)
            
           default:
               print("other")
           }
    }
    
}

