//
//  ViewController.swift
//  ChatAppFirebase
//
//  Created by Kushal on 04/01/18.
//  Copyright © 2018 Gaurishankar. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseDatabase

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var ref = DatabaseReference.init()
    var UserName:String?

    @IBOutlet weak var tbl_chatlist: UITableView!
    @IBOutlet weak var txt_chat: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loginAnyOne()
        
        self.ref = Database.database().reference()
        tbl_chatlist.delegate=self
        tbl_chatlist.dataSource=self
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listofchatInfo.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellChat:TVCellChat = tableView.dequeueReusableCell(withIdentifier: "cellChat", for: indexPath) as! TVCellChat
        cellChat.setChat(chat: listofchatInfo[indexPath.row])
        return cellChat
    }
    
    
    
    var listofchatInfo=[Chat]()
    func loadChatRoom()
    {
        self.ref.child("chat").queryOrdered(byChild: "postDate").observe(.value, with:
            { ( snapshot ) in
                self.listofchatInfo.removeAll()
                
                if let snapshot = snapshot.children.allObjects as? [DataSnapshot]{
                    
                    for snap in snapshot
                    {
                        if let postData=snap.value as? [String:AnyObject]
                        {
                            
                            let username=postData["name"] as? String
                            let text=postData["text"] as? String
                            
                            var postDate:CLong?
                            if let postDateIn=postData["postDate"] as? CLong
                            {
                                postDate=postDateIn
                                
                            }
                            self.listofchatInfo.append(Chat(userName:  username!, text: text!, datePost: "\(String(describing: postDate))"))
                            
                            
                        }
                    }
                    self.tbl_chatlist.reloadData()
                    let indexPath = IndexPath(row: self.listofchatInfo.count-1, section: 0)
                    self.tbl_chatlist.scrollToRow(at: indexPath, at: .bottom, animated: false)
//                    let chatData:[String:AnyObject] = snapshot.
                    
                }
        })
    }
    

   

    func loginAnyOne()
    {
        
        Auth.auth().signInAnonymously { (user, error) in
            if error != nil
            {
                print("can't login")
            }
            else
            {
                print("user UID \(String(describing: user?.uid))")
                self.loadChatRoom()
            }
        }
        
    }
    
    @IBAction func btn_sendchatRoom(_ sender: Any) {
        
        let dict = ["text":txt_chat.text ?? "Default",
                    "name":UserName!,
                    "postDate":ServerValue.timestamp()
            ] as [String : Any]
        self.ref.child("chat").childByAutoId().setValue(dict)
        
        txt_chat.text=""
    }
    
    

}

