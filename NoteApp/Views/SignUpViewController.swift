//
//  SignUpViewController.swift
//  NoteApp
//
//  Created by aleksandranavruzova on 15.01.2023.
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController {
  @IBOutlet weak var firstNameTextField: UITextField!
  @IBOutlet weak var lastNameTextField: UITextField!
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var signUpButton: UIButton!
  @IBOutlet weak var errorLabel: UILabel!
  
  private var viewModel = SignUpViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setUpElements()
  }
  
  func setUpElements() {
    errorLabel.alpha = 0

    Utilities.styleTextField(firstNameTextField)
    Utilities.styleTextField(lastNameTextField)
    Utilities.styleTextField(emailTextField)
    Utilities.styleTextField(passwordTextField)
    Utilities.styleFilledButton(signUpButton)

  }

  func showError(_ message: String) {
    errorLabel.text = message
    errorLabel.alpha = 1
  }
  
  @IBAction func signUpTapped(_ sender: Any) {
    viewModel.firstName = firstNameTextField.text?.trimmed ?? ""
    viewModel.lastName = lastNameTextField.text?.trimmed ?? ""
    viewModel.email = emailTextField.text?.trimmed ?? ""
    viewModel.password = passwordTextField.text?.trimmed ?? ""
    
    viewModel.createUser { [weak self] result in
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
