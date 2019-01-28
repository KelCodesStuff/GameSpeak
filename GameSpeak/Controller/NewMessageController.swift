//
//  NewMessageController.swift
//  GameSpeak
//
//  Created by Kelvin Reid on 1/26/19.
//  Copyright © 2019 KReid. All rights reserved.
//

import UIKit
import Firebase

class NewMessageController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleBack))
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    @objc func handleBack() {
        let newMessagesController = MessagesController()
        let navController = UINavigationController(rootViewController: newMessagesController)
        present(navController, animated: true, completion: nil)
    }
}
