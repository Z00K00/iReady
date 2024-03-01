//
//  Helpers.swift
//  iReady
//
//  Created by Krajg Larson on 2/25/24.
//

import Foundation
import UIKit


func showAlert(title: String, message: String) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    // Present the alert controller in your view controller
}

// Add more helper functions as needed
