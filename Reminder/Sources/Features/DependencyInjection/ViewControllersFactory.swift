//
//  ViewControllersFactory.swift
//  Reminder
//
//  Created by Marcos Roberto Lemos Veloso on 11/02/25.
//

import Foundation
import UIKit

final class ViewControllersFactory: ViewControllersFactoryProtocol {
    func makeSplashViewController(flowDelegate: SplashFlowDelegate) -> SplashViewController {
        let viewController = SplashViewController(flowDelegate: flowDelegate)
        return viewController
    }
    
    func makeLoginBottomSheetViewController(flowDelegate: LoginBSFlowDelegate) -> LoginBSViewController {
        let contentView = LoginBottomSheetView()
        let viewController = LoginBSViewController(contentView: contentView, flowDelegate: flowDelegate)
        return viewController
    }
}
