//
//  String+Ext.swift
//  Reminder
//
//  Created by Marcos Roberto Lemos Veloso on 10/01/25.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
