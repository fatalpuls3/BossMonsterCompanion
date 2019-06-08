//
//  CopyrightInfoViewController.swift
//  Boss Monster Companion
//
//  Created by Jason Miller on 6/7/19.
//  Copyright © 2019 Jason Miller. All rights reserved.
//

import UIKit

class CopyrightInfoViewController: UIViewController {
    @IBOutlet weak var popView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        popView.layer.cornerRadius = 10
        popView.layer.masksToBounds = true
    }
    @IBAction func closePopup(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
