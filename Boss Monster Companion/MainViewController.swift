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
    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var bossImage: UIImageView!
    
    // Dictionary of all phase values
    let phases = ["Beginning of Turn", "Build Phase", "Bait Phase", "Adventure Phase", "End of Turn"]
    var phaseIndex = -1
    var phaseTitle = "Set Up"
    
    var buttonTapOnce = -1
    var buttonTapTwice = -1
    
    // AVAudioPlayer class instance
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        phaseButton.setTitle(phaseTitle, for: .normal)
        heroBossImageRotate()
        
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
    
    @objc func backPhase() {
        buttonTapOnce = 0
        buttonTapTwice = 1
        setPhaseButton()
    }
    
    @objc func forwardPhase() {
        buttonTapOnce = 1
        buttonTapTwice = 0
        setPhaseButton()
    }
    
    func setPhaseButton() {
        // if block for if button is tapped once
        if buttonTapOnce == 1, buttonTapTwice == 0 {
            // if block to ensure we dont go out of range and reset to index 0
            if phaseIndex == 4 {
                phaseIndex = phases.startIndex
                phaseButton.setTitle(phases[phaseIndex], for: .normal)  // set button title
            } else {
                phaseIndex = phaseIndex + 1
                phaseButton.setTitle(phases[phaseIndex], for: .normal)
            }
            // else if block for button tapped twice
        } else if buttonTapOnce == 0, buttonTapTwice == 1 {
            //if block to ensure we dont go out of range and reset to index 4
            if phaseIndex == 0 {
                phaseIndex = 4
                phaseButton.setTitle(phases[phaseIndex], for: .normal) // set button title
            } else if phaseIndex < 0 { // ensure double tap on startup does not crash app but actually goes to end of turn
                phaseIndex = 4
                phaseButton.setTitle(phases[phaseIndex], for: .normal)
            } else {
                phaseIndex = phaseIndex - 1
                phaseButton.setTitle(phases[phaseIndex], for: .normal)
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
        // Resetting button taps and phaseIndex to start fresh on next phaseButton tap
        phaseButton.setTitle("Set Up", for: .normal)
        buttonTapOnce = -1
        buttonTapTwice = -1
        phaseIndex = -1
        
    }
    
    func heroBossImageRotate() {
        heroImage.animationDuration = 15
        heroImage.animationImages = [
            UIImage(named:"BMH1")!,
            UIImage(named:"BMH2")!,
            UIImage(named:"BMH3")! ]
            heroImage.startAnimating()
        
        bossImage.animationDuration = 15
        bossImage.animationImages = [
            UIImage(named:"BMB1.jpg")!,
            UIImage(named:"BMB2.jpg")!,
            UIImage(named:"BMB3.jpg")! ]
        bossImage.startAnimating()
    }
}

