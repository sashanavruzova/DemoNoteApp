//
//  LogInViewController.swift
//  NoteApp
//
//  Created by aleksandranavruzova on 15.01.2023.
//

import UIKit
import FirebaseAuth

class LogInViewController: UIViewController {

  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var logInButton: UIButton!
  @IBOutlet weak var errorLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setUpElements()
  }
  
  func setUpElements() {
    errorLabel.alpha = 0
    
    Utilities.styleTextField(emailTextField)
    Utilities.styleTextField(passwordTextField  )
    Utilities.styleFilledButton(logInButton)
  }


  @IBAction func logInTaped(_ sender: Any) {
    if let email = emailTextField.text?.trimmed,
       let password = passwordTextField.text?.trimmed {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
          guard let strongSelf = self else { return }
          
          if error != nil {
            strongSelf.errorLabel.text = error!.localizedDescription
            strongSelf.errorLabel.alpha = 1
          } else {
            let homeViewController = strongSelf.storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homeViewController) as? HomeViewController
            strongSelf.view.window?.rootViewController = homeViewController
            strongSelf.view.window?.makeKeyAndVisible()
          }
        
      }
    }
  }
}
