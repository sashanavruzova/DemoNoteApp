//
//  LogInViewModel.swift
//  NoteApp
//
//  Created by aleksandranavruzova on 09.02.2023.
//

import Foundation
import Firebase
import FirebaseAuth

class LogInViewModel {
  var email = ""
  var password = ""
  var errorMessage: String?
  var onSuccessLogin: (() -> Void)?
  
  func validateFields() -> String? {
    let fields = [password, email]
    if fields.contains("") {
      return "Please, fill in all the fields"
    }
    return nil
  }
  
  func signIn(completion: @escaping (Result<Void, Error>) -> Void) {
    guard let error = validateFields() else {
      Auth.auth().signIn(withEmail: email, password: password) { [weak self] (result, error) in
        guard let self = self else { return }
        if let error {
          self.errorMessage = error.localizedDescription
          completion(.failure(error))
        } else {
          completion(.success(()))
        }
      }
      return
    }
    self.errorMessage = error
    completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: error])))
  }
}

