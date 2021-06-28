//
//  ViewController.swift
//  FI-GI-IOS-APP-BY-MEHDI-BENREFAD
//
//  Created by Mehdi Benrefad on 16/06/2021.
//  Copyright © 2021 Mehdi Benrefad. All rights reserved.
//

import UIKit

struct lst{
    var logo:UIImage
    var label:String
}

class ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate{

    //var list = [lst(logo: UIImage(named: "Home")!, label: "Home"),"Guessing Game","Timer","IMC Calculator","Text Editor","Object Recognition","Contacts App","Logo Viewer","Map Location"]
    
    var list = [lst(logo: UIImage(named: "Home")!, label: "Home"),
    lst(logo: UIImage(named: "dev2")!, label: "Guessing Game"),
    lst(logo: UIImage(named: "ep")!, label: "Timer"),
    lst(logo: UIImage(named: "health")!, label: "IMC Calculator"),
    lst(logo: UIImage(named: "texteditor")!, label: "Text Editor"),
    lst(logo: UIImage(named: "AI")!, label: "Object Recognition"),
    lst(logo: UIImage(named: "Profile")!, label: "Contacts App"),
    lst(logo: UIImage(named: "lv")!, label: "Logo Viewer"),
    lst(logo: UIImage(named: "map")!, label: "Map Location"),
    lst(logo: UIImage(named: "phone")!, label: "Chat App"),
    lst(logo: UIImage(named: "Firebase")!, label: "Firebase App")]
    
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
        cell.configure(img: cellule.logo, text: cellule.label)
                return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch list[indexPath.row].label{
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
            
            //Contacts
                case "Contacts App":
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let newViewController = storyBoard.instantiateViewController(withIdentifier: "Contacts") as! UINavigationController
                    newViewController.modalPresentationStyle = .fullScreen
                    self.present(newViewController, animated: true, completion: nil)
            //logoViewer
            case "Logo Viewer":
                               let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                               let newViewController = storyBoard.instantiateViewController(withIdentifier: "logoViewer") as! UINavigationController
                               newViewController.modalPresentationStyle = .fullScreen
                               self.present(newViewController, animated: true, completion: nil)
            //Chat App
                case "Chat App":
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let newViewController = storyBoard.instantiateViewController(withIdentifier: "Chat App") as! UINavigationController
                    newViewController.modalPresentationStyle = .fullScreen
                    self.present(newViewController, animated: true, completion: nil)
            //Firebase App
                case "Firebase App":
                       let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                       let newViewController = storyBoard.instantiateViewController(withIdentifier: "Firebase App") as! UINavigationController
                       newViewController.modalPresentationStyle = .fullScreen
                       self.present(newViewController, animated: true, completion: nil)
           default:
               print("other")
           }
        
    }
    
}

