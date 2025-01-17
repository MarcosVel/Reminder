//
//  LoginBSViewModel.swift
//  Reminder
//
//  Created by Marcos Roberto Lemos Veloso on 17/01/25.
//

import Foundation
import Firebase

class LoginBSViewModel {
    func doAuth(userEmail: String, password: String) {
        Auth.auth().signIn(withEmail: userEmail, password: password) { [weak self] authResult, error in
            if let error = error {
                print("Auth Error: \(error)")
                return
            } else {
                print(authResult, "Auth Success")
            }
        }
    }
}
