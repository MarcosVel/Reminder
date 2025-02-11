//
//  ViewControllersFactory.swift
//  Reminder
//
//  Created by Marcos Roberto Lemos Veloso on 10/02/25.
//

import Foundation

protocol ViewControllersFactoryProtocol: AnyObject {
    func makeSplashViewController(flowDelegate: SplashFlowDelegate) -> SplashViewController
    func makeLoginBottomSheetViewController(flowDelegate: LoginBSFlowDelegate) -> LoginBSViewController
    
}
