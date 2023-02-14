//
//  SignUpViewModel.swift
//  NoteApp
//
//  Created by aleksandranavruzova on 09.02.2023.
//

import Foundation
import Firebase
import FirebaseAuth

public class SignUpViewModel {
  var firstName = ""
  var lastName = ""
  var email = ""
  var password = ""
  var errorMessage = ""
  
  func validateFields() -> String? {
    let fields = [firstName, lastName, password, email]
    if fields.contains("") {
      return "Please, fill in all the fields"
    }
    if Utilities.isPasswordValid(password) == false {
      return "Please, make sure that your password is at least 8 characters long, contains a special chaaracter and a number."
    }
    return nil
  }
  
  func createUser(completion: @escaping (Result<Void, Error>) -> Void) {
    guard let error = validateFields() else {
      Auth.auth().createUser(withEmail: email, password: password) { [weak self] (result, error) in
        guard let self = self else { return }
        guard let result = result else { return }
        if let error {
          self.errorMessage = "Error creating a user"
          completion(.failure(error))
        } else {
          let db = Firestore.firestore()
          db.collection("users").addDocument(data: ["firstName" : self.firstName,
                                                    "lastName" : self.lastName,
                                                    "uid" : result.user.uid]) { error in
            if let error {
              self.errorMessage = "Error saving user data"
              completion(.failure(error))
            } else {
              completion(.success(()))
            }
          }
        }
      }
      return
    }
    self.errorMessage = error
    completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: error])))
  }
}
