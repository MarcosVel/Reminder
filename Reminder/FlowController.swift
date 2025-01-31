//
//  ReminderFlowController.swift
//  Reminder
//
//  Created by Marcos Roberto Lemos Veloso on 20/01/25.
//

import Foundation
import UIKit

class FlowController {
    // MARK: - Properties
    private var navigationController: UINavigationController?
//    private let viewControllerFactory
    // MARK: - Splash
    // MARK: - Login
    // MARK: - init
    public init() {
    }
    
    // MARK - startFlow
    func start() -> UINavigationController? {
        let startViewController = SplashViewController()
        self.navigationController = UINavigationController(rootViewController: startViewController)
        return navigationController
    }
}
