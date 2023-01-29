//
//  LogInViewController.swift
//  NoteApp
//
//  Created by Александра Наврузова on 15.01.2023.
//

import UIKit

class LogInViewController: UIViewController {

  @IBOutlet weak var firstNameTextField: UITextField!
  @IBOutlet weak var lastNameTextField: UITextField!
  @IBOutlet weak var logInButton: UIButton!
  @IBOutlet weak var errorLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setUpElements()
  }
  
  func setUpElements() {
    errorLabel.alpha = 0
    
    Utilities.styleTextField(firstNameTextField)
    Utilities.styleTextField(lastNameTextField)
    Utilities.styleFilledButton(logInButton)
  }


  @IBAction func logInTaped(_ sender: Any) {
  }
}
