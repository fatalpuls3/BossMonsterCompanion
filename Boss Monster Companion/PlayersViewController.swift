//
//  SecondViewController.swift
//  Boss Monster Companion
//
//  Created by Jason Miller on 5/24/19.
//  Copyright © 2019 Jason Miller. All rights reserved.
//

import UIKit

class PlayersViewController: UIViewController {

    @IBOutlet weak var playerOneName: UITextField!
    @IBOutlet weak var playerTwoName: UITextField!
    @IBOutlet weak var playerThreeName: UITextField!
    @IBOutlet weak var playerFourName: UITextField!
    
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
        playerOneName.resignFirstResponder()
        playerTwoName.resignFirstResponder()
        playerThreeName.resignFirstResponder()
        playerFourName.resignFirstResponder()

    }


}

