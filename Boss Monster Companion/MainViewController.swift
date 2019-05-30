//
//  FirstViewController.swift
//  Boss Monster Companion
//
//  Created by Jason Miller on 5/24/19.
//  Copyright © 2019 Jason Miller. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var phaseButton: UIButton!
    
    // Dictionary of all phase values
    let phases = ["Beginning of Turn", "Build Phase", "Bait Phase", "Adventure Phase", "End of Turn"]
    var phaseIndex = -1
    var phaseTitle = "Set Up"
    
    var buttonTapOnce = -1
    var buttonTapTwice = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        phaseButton.setTitle(phaseTitle, for: .normal)
        
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
    
    func setPhaseButton(){
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
}

