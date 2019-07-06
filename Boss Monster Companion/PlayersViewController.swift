//
//  SecondViewController.swift
//  Boss Monster Companion
//
//  Created by Jason Miller on 5/24/19.
//  Copyright © 2019 Jason Miller. All rights reserved.
//

import UIKit

class PlayersViewController: UIViewController {
    //Set Player1 Variables
    //var p1Name: String?
    //var p1Souls: Int?
    //var p1Wounds: Int?
    //Set Player2 Variables
    var p2Name: String?
    var p2Souls = 0
    var p2Wounds = 0
    //Set Player3 Variables
    var p3Name: String?
    var p3Souls = 0
    var p3Wounds = 0
    //Set Player4 Variables
    var p4Name: String?
    var p4Souls = 0
    var p4Wounds = 0
    
    @IBOutlet weak var p1NameField: UITextField!
    @IBOutlet weak var p1SoulsValue: UILabel!
    @IBOutlet weak var p1WoundsValue: UILabel!
    @IBAction func p1SoulsAdd(_ sender: Any) {
        let tmpP1Souls = defaults.integer(forKey: "p1Souls")
        defaults.set((tmpP1Souls + 1), forKey: "p1Souls")
        p1SoulsValue.text = String(defaults.integer(forKey: "p1Souls"))
        savePlayer1()
    }
    @IBAction func p1SoulsMinus(_ sender: Any) {
        let tmpP1Souls = defaults.integer(forKey: "p1Souls")
        defaults.set((tmpP1Souls - 1), forKey: "p1Souls")
        p1SoulsValue.text = String(defaults.integer(forKey: "p1Souls"))
        savePlayer1()
    }
    @IBAction func p1WoundsAdd(_ sender: Any) {
        let tmpP1Wounds = defaults.integer(forKey: "p1Wounds")
        defaults.set((tmpP1Wounds + 1), forKey: "p1Wounds")
        p1WoundsValue.text = String(defaults.integer(forKey: "p1Wounds"))
        savePlayer1()
    }
    @IBAction func p1WoundsMinus(_ sender: Any) {
        let tmpP1Wounds = defaults.integer(forKey: "p1Wounds")
        defaults.set((tmpP1Wounds - 1), forKey: "p1Wounds")
        p1WoundsValue.text = String(defaults.integer(forKey: "p1Wounds"))
        savePlayer1()
    }
    
    
    @IBOutlet weak var p2NameField: UITextField!
    @IBOutlet weak var p2SoulsValue: UILabel!
    @IBOutlet weak var p2WoundsValue: UILabel!
    @IBAction func p2SoulsAdd(_ sender: Any) {
        let tmpP2Souls = defaults.integer(forKey: "p2Souls")
        defaults.set((tmpP2Souls + 1), forKey: "p2Souls")
        p2SoulsValue.text = String(defaults.integer(forKey: "p2Souls"))
        savePlayer2()
    }
    @IBAction func p2SoulsMinus(_ sender: Any) {
        let tmpP2Souls = defaults.integer(forKey: "p2Souls")
        defaults.set((tmpP2Souls - 1), forKey: "p2Souls")
        p2SoulsValue.text = String(defaults.integer(forKey: "p2Souls"))
        savePlayer2()
    }
    @IBAction func p2WoundsAdd(_ sender: Any) {
        let tmpP2Wounds = defaults.integer(forKey: "p2Wounds")
        defaults.set((tmpP2Wounds + 1), forKey: "p2Wounds")
        p2WoundsValue.text = String(defaults.integer(forKey: "p2Wounds"))
        savePlayer2()
    }
    @IBAction func p2WoundsMinus(_ sender: Any) {
        let tmpP2Wounds = defaults.integer(forKey: "p2Wounds")
        defaults.set((tmpP2Wounds - 1), forKey: "p2Wounds")
        p2WoundsValue.text = String(defaults.integer(forKey: "p2Wounds"))
        savePlayer2()
    }
    
    @IBOutlet weak var p3NameField: UITextField!
    @IBOutlet weak var p3SoulsValue: UILabel!
    @IBOutlet weak var p3WoundsValue: UILabel!
    @IBAction func p3SoulsAdd(_ sender: Any) {
        let tmpP3Souls = defaults.integer(forKey: "p3Souls")
        defaults.set((tmpP3Souls + 1), forKey: "p3Souls")
        p3SoulsValue.text = String(defaults.integer(forKey: "p3Souls"))
        savePlayer3()
    }
    @IBAction func p3SoulsMinus(_ sender: Any) {
        let tmpP3Souls = defaults.integer(forKey: "p3Souls")
        defaults.set((tmpP3Souls - 1), forKey: "p3Souls")
        p3SoulsValue.text = String(defaults.integer(forKey: "p3Souls"))
        savePlayer3()
    }
    @IBAction func p3WoundsAdd(_ sender: Any) {
        let tmpP3Wounds = defaults.integer(forKey: "p3Wounds")
        defaults.set((tmpP3Wounds + 1), forKey: "p3Wounds")
        p3WoundsValue.text = String(defaults.integer(forKey: "p3Wounds"))
        savePlayer3()
    }
    @IBAction func p3WoundsMinus(_ sender: Any) {
        let tmpP3Wounds = defaults.integer(forKey: "p3Wounds")
        defaults.set((tmpP3Wounds - 1), forKey: "p3Wounds")
        p3WoundsValue.text = String(defaults.integer(forKey: "p3Wounds"))
        savePlayer3()
    }
    
    
    @IBOutlet weak var p4NameField: UITextField!
    @IBOutlet weak var p4SoulsValue: UILabel!
    @IBOutlet weak var p4WoundsValue: UILabel!
    @IBAction func p4SoulsAdd(_ sender: Any) {
        let tmpP4Souls = defaults.integer(forKey: "p4Souls")
        defaults.set((tmpP4Souls + 1), forKey: "p4Souls")
        p4SoulsValue.text = String(defaults.integer(forKey: "p4Souls"))
        savePlayer4()
    }
    @IBAction func p4SoulsMinus(_ sender: Any) {
        let tmpP4Souls = defaults.integer(forKey: "p4Souls")
        defaults.set((tmpP4Souls - 1), forKey: "p4Souls")
        p4SoulsValue.text = String(defaults.integer(forKey: "p4Souls"))
        savePlayer4()
    }
    @IBAction func p4WoundsAdd(_ sender: Any) {
        let tmpP4Wounds = defaults.integer(forKey: "p4Wounds")
        defaults.set((tmpP4Wounds + 1), forKey: "p4Wounds")
        p4WoundsValue.text = String(defaults.integer(forKey: "p4Wounds"))
        savePlayer4()
    }
    @IBAction func p4WoundsMinus(_ sender: Any) {
        let tmpP4Wounds = defaults.integer(forKey: "p4Wounds")
        defaults.set((tmpP4Wounds - 1), forKey: "p4Wounds")
        p4WoundsValue.text = String(defaults.integer(forKey: "p4Wounds"))
        savePlayer4()
    }
    
    let defaults = UserDefaults.standard
    
    
//    @IBAction func resetGame(_ sender: Any) {
//        p1NameField.text = "Player 133"
//        p1Name = "Player 1"
//        defaults.set(p1Name, forKey: "p1Name")
//        p1Souls = 0
//        defaults.set(p1Souls, forKey: "p1Souls")
//        p1SoulsValue.text = String(p1Souls!)
//        p1Wounds = 0
//        defaults.set(p1Wounds, forKey: "p1Wounds")
//        p1WoundsValue.text = String(p1Wounds!)
    
//        p2NameField.text = "Player 2"
//        p2Name = "Player 2"
//        defaults.set(p2Name, forKey: "p2Name")
//        p2SoulsValue.text = "0"
//        p2WoundsValue.text = "0"
//
//        p3NameField.text = "Player 3"
//        p3Name = "Player 3"
//        defaults.set(p3Name, forKey: "p3Name")
//        p3SoulsValue.text = "0"
//        p3WoundsValue.text = "0"
//
//        p4NameField.text = "Player 4"
//        p4Name = "Player 4"
//        defaults.set(p4Name, forKey: "p4Name")
//        p4SoulsValue.text = "0"
//        p4WoundsValue.text = "0"
//    }
    
    @IBOutlet weak var playerFour: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard(_:)))
        self.view.addGestureRecognizer(tapGesture)

        getPlayer1()
        getPlayer2()
        getPlayer3()
        getPlayer4()
    }
    @objc func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        p1NameField.resignFirstResponder()
        let tmpP1Name = p1NameField.text
        defaults.set(tmpP1Name, forKey: "p1Name")
        
        p2NameField.resignFirstResponder()
        let tmpP2Name = p2NameField.text
        defaults.set(tmpP2Name, forKey: "p2Name")
        
        p3NameField.resignFirstResponder()
        let tmpP3Name = p3NameField.text
        defaults.set(tmpP3Name, forKey: "p3Name")

        p4NameField.resignFirstResponder()
        let tmpP4Name = p4NameField.text
        defaults.set(tmpP4Name, forKey: "p4Name")
    }

    
    // Saving Player score functions
    func savePlayer1() {
        let tmpP1Souls = defaults.integer(forKey: "p1Souls")
        let tmpP1Wounds = defaults.integer(forKey: "p1Wounds")
        defaults.set(tmpP1Souls, forKey: "p1Souls")
        defaults.set(tmpP1Wounds, forKey: "p1Wounds")
    }
    func savePlayer2() {
        let tmpP2Souls = defaults.integer(forKey: "p2Souls")
        let tmpP2Wounds = defaults.integer(forKey: "p2Wounds")
        defaults.set(tmpP2Souls, forKey: "p2Souls")
        defaults.set(tmpP2Wounds, forKey: "p2Wounds")
    }
    func savePlayer3() {
        let tmpP3Souls = defaults.integer(forKey: "p3Souls")
        let tmpP3Wounds = defaults.integer(forKey: "p3Wounds")
        defaults.set(tmpP3Souls, forKey: "p3Souls")
        defaults.set(tmpP3Wounds, forKey: "p3Wounds")
    }
    func savePlayer4() {
        let tmpP4Souls = defaults.integer(forKey: "p4Souls")
        let tmpP4Wounds = defaults.integer(forKey: "p4Wounds")
        defaults.set(tmpP4Souls, forKey: "p4Souls")
        defaults.set(tmpP4Wounds, forKey: "p4Wounds")
    }

    // Save player names
//    func savePlayerNames() {
//        let tmpP1Name = defaults.string(forKey: "p1Name")
//        let tmpP2Name = defaults.string(forKey: "p2Name")
//        let tmpP3Name = defaults.string(forKey: "p3Name")
//        let tmpP4Name = defaults.string(forKey: "p4Name")
//        defaults.set(tmpP1Name, forKey: "p1Name")
//        defaults.set(tmpP2Name, forKey: "p2Name")
//        defaults.set(tmpP3Name, forKey: "p3Name")
//        defaults.set(tmpP4Name, forKey: "p4Name")
//    }
    
    // Get Player information functions
    func getPlayer1() {
        p1NameField.text = defaults.string(forKey: "p1Name")
        p1SoulsValue.text = String(defaults.integer(forKey: "p1Souls"))
        p1WoundsValue.text = String(defaults.integer(forKey: "p1Wounds"))
    }
    func getPlayer2() {
        p2NameField.text = defaults.string(forKey: "p2Name")
        p2SoulsValue.text = String(defaults.integer(forKey: "p2Souls"))
        p2WoundsValue.text = String(defaults.integer(forKey: "p2Wounds"))
    }
    func getPlayer3() {
        p3NameField.text = defaults.string(forKey: "p3Name")
        p3SoulsValue.text = String(defaults.integer(forKey: "p3Souls"))
        p3WoundsValue.text = String(defaults.integer(forKey: "p3Wounds"))
    }
    func getPlayer4() {
        p4NameField.text = defaults.string(forKey: "p4Name")
        p4SoulsValue.text = String(defaults.integer(forKey: "p4Souls"))
        p4WoundsValue.text = String(defaults.integer(forKey: "p4Wounds"))
    }

}

