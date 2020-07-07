//
//  HelloViewController.swift
//  VK_Client
//
//  Created by Salavat Khalikov on 05.07.2020.
//  Copyright © 2020 Salavat Khalikov. All rights reserved.
//

import UIKit

class HelloViewController: UIViewController {
    
    @IBOutlet weak var centerText: UILabel!
    
    @IBAction func addWord (_ sender: UIBarButtonItem) {
        centerText.text = (centerText.text ?? "") + " hello"
    }
}
