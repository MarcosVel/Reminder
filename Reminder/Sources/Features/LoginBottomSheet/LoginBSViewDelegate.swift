//
//  LoginBSViewDelegate.swift
//  Reminder
//
//  Created by Marcos Roberto Lemos Veloso on 14/01/25.
//

import Foundation
import UIKit

protocol LoginBSViewDelegate: AnyObject {
    func sendLoginData(user: String, password: String)
}
