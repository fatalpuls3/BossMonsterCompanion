//
//  FirstViewController.swift
//  Boss Monster Companion
//
//  Created by Jason Miller on 5/24/19.
//  Copyright © 2019 Jason Miller. All rights reserved.
//

import UIKit
import AVFoundation



class MainViewController: UIViewController {

    @IBOutlet weak var phaseButton: UIButton!
    @IBOutlet weak var enableAmbiance: UISwitch!
    @IBOutlet weak var reset: UIButton!
    @IBOutlet weak var torchLeft: UIImageView!
    @IBOutlet weak var torchRight: UIImageView!
    @IBOutlet weak var copyrightInfo: UIButton!
    
    // Dictionary of all phase values
    let phases = ["1BeginTurn", "2BuildPhase", "3BaitPhase", "4AdventurePhase", "5EndOfTurn"]
    var phaseIndex = -1
    var phaseTitle = UIImage(named: "0SetUp")
    

    
    // resetting button tap value
    var buttonTapOnce = -1
    var buttonTapTwice = -1
    
    // AVAudioPlayer class instance
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let phaseIndexValue = PhaseButtonState(context: context)
            phaseIndexValue.state = Int16(phaseIndex)
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
            print("coredata value ", phaseIndexValue.state)
        }
        
        phaseButton.layer.cornerRadius = 5
        phaseButton.clipsToBounds = true
        //phaseButton.setImage(UIImage(named: phases[phaseIndex]), for: UIControl.State.normal)
        torchFlame()
    
        // Init phase button to be Set Up image
        // phaseButton.setImage(phaseTitle, for: UIControl.State.normal)
    
        // Setup single tap gesture recognition
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(forwardPhase))
        singleTap.numberOfTapsRequired = 1
        phaseButton.addGestureRecognizer(singleTap)
    
        // Setup double tap gesture recognition
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(backPhase))
        doubleTap.numberOfTapsRequired = 2
        phaseButton.addGestureRecognizer(doubleTap)
    
        // Make single tap wait for double tap to not occur
        singleTap.require(toFail: doubleTap)
    
        // Ambiance switch target
        enableAmbiance.addTarget(self, action: #selector(ambianceToggled(_:)), for: UIControl.Event.valueChanged)
    
        // Reset button target
        reset.addTarget(self, action: #selector(resetGame(_:)), for: UIControl.Event.touchDown)
        
    }
    // double back to go back phase
    @objc func backPhase() {
        buttonTapOnce = 0
        buttonTapTwice = 1
        setPhaseButton()
    }
    
    // single tap to go forward phase
    @objc func forwardPhase() {
        buttonTapOnce = 1
        buttonTapTwice = 0
        setPhaseButton()
    }
    
    // setting phase buttons based on conditions
    func setPhaseButton() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let phaseIndexValue = PhaseButtonState(context: context)
            // if block for if button is tapped once
            if buttonTapOnce == 1, buttonTapTwice == 0 {
                // if block to ensure we dont go out of range and reset to index 0
                if phaseIndexValue.state == 4 {
                    phaseIndex = 0
                    phaseIndexValue.state = Int16(phaseIndex)
                    (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
                    print("in if for sng tap ", phaseIndexValue.state)
                    phaseButton.setImage(UIImage(named: phases[phaseIndex]), for: UIControl.State.normal)
                } else {
                    phaseIndex = phaseIndex + 1
                    phaseIndexValue.state = Int16(phaseIndex)
                    (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
                    print("in else for sng tap ",phaseIndexValue.state)
                    phaseButton.setImage(UIImage(named: phases[phaseIndex]), for: UIControl.State.normal)
                }
                // else if block for button tapped twice
            } else if buttonTapOnce == 0, buttonTapTwice == 1 {
                print("value before dbl tap if block ",phaseIndexValue.state)

                //if block to ensure we dont go out of range and reset to index 4
                if phaseIndexValue.state == 0 {
                    print("in the first if for dbl tap ",phaseIndexValue.state)
                    phaseIndex = 4
                    phaseIndexValue.state = Int16(phaseIndex)
                    (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
                    print("in the first if for dbl tap ",phaseIndexValue.state)
                    phaseButton.setImage(UIImage(named: phases[phaseIndex]), for: UIControl.State.normal)
                } else if phaseIndexValue.state < 0 { // ensure double tap on startup does not crash app but actually goes to end of turn
                    phaseIndex = 4
                    phaseIndexValue.state = Int16(phaseIndex)
                    (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
                    print("in else if for dbl tap ", phaseIndexValue.state)
                    phaseButton.setImage(UIImage(named: phases[phaseIndex]), for: UIControl.State.normal)
                } else {
                    phaseIndex = phaseIndex - 1
                    phaseIndexValue.state = Int16(phaseIndex)
                    (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
                    print("in else for double tap ",phaseIndexValue.state)
                    phaseButton.setImage(UIImage(named: phases[phaseIndex]), for: UIControl.State.normal)
                }
            }
        }
    }
    // Ambiance toggle
    @IBAction func ambianceToggled(_ sender: UISwitch) {
        ambiance()
    }
    
    // game reset button
    @IBAction func resetGame(_ sender: UIButton) {
        resetTapped()
    }
    
    // Ambiance function
    func ambiance() {
        // Ambiance Sound File
        let ambianceAudio = Bundle.main.path(forResource: "LostMine", ofType: "mp3")
        // try to get the init it with URL from above
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: ambianceAudio!))
        } catch {
            print("Unable To Find Ambiance Audio File")
        }
        
        // Audio Toggle Action IF Statement
        if enableAmbiance.isOn {
            audioPlayer.play()
        } else {
            audioPlayer.stop()
        }
    }
    
    // Game reset button tapped actions
    func resetTapped() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let phaseIndexValue = PhaseButtonState(context: context)
            // Resetting button taps and phaseIndex to start fresh on next phaseButton tap
            phaseButton.setImage(UIImage(named: "0SetUp"), for: UIControl.State.normal)
            buttonTapOnce = -1
            buttonTapTwice = -1
            phaseIndex = 0
            phaseIndexValue.state = 0
        }
    }
    
    // Heros and Boss image rotation
    func torchFlame() {
        torchLeft.animationDuration = 0.9
        torchLeft.animationImages = [
            UIImage(named:"torch1")!,
            UIImage(named:"torch2")!,
            UIImage(named:"torch3")!,
            UIImage(named:"torch4")!]
            torchLeft.startAnimating()

        torchRight.animationDuration = 0.8
        torchRight.animationImages = [
            UIImage(named:"torch1")!,
            UIImage(named:"torch2")!,
            UIImage(named:"torch3")!,
            UIImage(named:"torch4")!]
        torchRight.startAnimating()
    }
}

