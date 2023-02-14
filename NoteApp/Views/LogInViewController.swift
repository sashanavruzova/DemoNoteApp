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
  
  private var viewModel = LogInViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setUpElements()
  }
  
  func setUpElements() {
    errorLabel.alpha = 0
    
    Utilities.styleTextField(emailTextField)
    Utilities.styleTextField(passwordTextField)
    Utilities.styleFilledButton(logInButton)
  }

  func showError(_ message: String) {
    errorLabel.text = message
    errorLabel.alpha = 1
  }

  @IBAction func logInTaped(_ sender: Any) {
    viewModel.email = emailTextField.text?.trimmed ?? ""
    viewModel.password = passwordTextField.text?.trimmed ?? ""
    
    viewModel.signIn { [weak self] result in
      guard let self = self else { return }
      switch result {
      case .success:
        self.transitionToHome()
      case .failure(let error):
        self.showError(error.localizedDescription)
      }
    }
  }
  
  func transitionToHome() {
    let homeViewController = storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homeViewController) as? HomeViewController
    view.window?.rootViewController = homeViewController
    view.window?.makeKeyAndVisible()
  }
}
