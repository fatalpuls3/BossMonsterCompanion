//
//  SecondViewController.swift
//  Boss Monster Companion
//
//  Created by Jason Miller on 5/24/19.
//  Copyright © 2019 Jason Miller. All rights reserved.
//

import UIKit

class PlayersViewController: UIViewController {

    @IBOutlet weak var playerOne: UITextField!
    
    @IBOutlet weak var playerTwo: UITextField!
    
    @IBOutlet weak var playerThree: UITextField!
    
    
    @IBAction func resetGame(_ sender: Any) {
    }
    
    @IBOutlet weak var playerFour: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard(_:)))
        self.view.addGestureRecognizer(tapGesture)
        // Do any additional setup after loading the view.
    }
    @objc func dismissKeyboard (_ sender: UITapGestureRecognizer){
        playerOne.resignFirstResponder()
        playerTwo.resignFirstResponder()
        playerThree.resignFirstResponder()
        playerFour.resignFirstResponder()

    }


}

