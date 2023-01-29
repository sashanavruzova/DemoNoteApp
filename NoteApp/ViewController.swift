//
//  ViewController.swift
//  NoteApp
//
//  Created by Александра Наврузова on 15.01.2023.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var signUpButton: UIButton!
  @IBOutlet weak var logInButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setUpElements()
  }

  func setUpElements() {
    Utilities.styleFilledButton(signUpButton)
    Utilities.styleHollowButton(logInButton)
  }

}

