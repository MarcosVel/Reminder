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
    // MARK: - init
    public init() {
    }
    
    // MARK - startFlow
    func start() -> UINavigationController? {
        let startViewController = SplashViewController(flowDelegate: self)
        self.navigationController = UINavigationController(rootViewController: startViewController)
        return navigationController
    }
}

// MARK - Login
extension FlowController: LoginBSFlowDelegate {
    func navigateToHome() {
        self.navigationController?.dismiss(animated: true)
        let viewController = UIViewController()
        viewController.view.backgroundColor = .red
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: - Splash
extension FlowController: SplashFlowDelegate {
    func openLoginBottomSheet() {
        let loginBottomSheet = LoginBSViewController(flowDelegate: self)
        loginBottomSheet.modalPresentationStyle = .overCurrentContext
        loginBottomSheet.modalTransitionStyle = .crossDissolve
        navigationController?.present(loginBottomSheet, animated: false) {
            loginBottomSheet.animateShow()
        }

    }
}
