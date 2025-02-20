//
//  LoginBSViewModel.swift
//  Reminder
//
//  Created by Marcos Roberto Lemos Veloso on 17/01/25.
//

import Foundation
import Firebase

class LoginBSViewModel {
    var successResult: ((String) -> Void)?
    var errorResult: ((String) -> Void)?

    func doAuth(userEmail: String, password: String) {
        Auth.auth().signIn(withEmail: userEmail, password: password) { [weak self] authResult, error in
            if let error = error {
                self?.errorResult?("Por favor verifique as credenciais digitadas!")
                print("Auth Error: \(error)")
                return
            } else {
                print(authResult, "Auth Success")
                self?.successResult?(userEmail)
            }
        }
    }
}
