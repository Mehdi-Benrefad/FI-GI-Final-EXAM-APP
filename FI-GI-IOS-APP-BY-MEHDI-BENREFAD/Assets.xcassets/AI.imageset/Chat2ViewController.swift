//
//  Chat2ViewController.swift
//  FI-GI-IOS-APP-BY-MEHDI-BENREFAD
//
//  Created by Mehdi Benrefad on 29/06/2021.
//  Copyright © 2021 Mehdi Benrefad. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class Chat2ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{
    var ref = DatabaseReference.init()
    @IBOutlet weak var message: UITextField!

    @IBOutlet weak var ChatList: UITableView!
    
    var username = String()
    var chatMessages = [Chat]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        logInAnnony()
        self.ref = Database.database().reference()
        ChatList.delegate = self
        ChatList.dataSource = self
        loadChatRoom()
    }
    
    func logInAnnony(){
        Auth.auth().signInAnonymously(completion: nil)
    }
    
    func loadChatRoom(){
        self.ref.child("chat").queryOrdered(byChild: "postDate").observe(.value, with: {
            (snapshot) in
            self.chatMessages.removeAll()
            if let snapshot = snapshot.children.allObjects as? [DataSnapshot]{
                for snap in snapshot{
                    if let postData = snap.value as? [String:AnyObject]{
                        let username = postData["name"] as?String
                        let text = postData["text"] as?String
                        var postDate:CLong?
                        if let postDateInt = postData["postDate"] as? CLong{
                            postDate = postDateInt
                        }
                        self.chatMessages.append(Chat(username: username ?? "" , text: text ?? "", DatePost: "\(postDate)"))
                    }
                }
                self.ChatList.reloadData()
                if self.chatMessages.count > 0 {
                    let lastMessageIndex = IndexPath(row: self.chatMessages.count-1 , section: 0)
                    self.ChatList.scrollToRow(at: lastMessageIndex, at: .bottom, animated: true)
                }
            }
        })
    }
    
    @IBAction func send(_ sender: UIButton) {
        let dic = ["text" : message.text ?? "" ,
                   "name" : username ?? "" ,
                   "postDate" : ServerValue.timestamp()] as [String : Any]
        self.ref.child("chat").childByAutoId().setValue(dic)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.chatMessages.count
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TVCChat = tableView.dequeueReusableCell(withIdentifier: "cellChat", for: indexPath) as! TVCChat
        cell.setChat(chat: self.chatMessages[indexPath.row])
        return cell
    }

}
