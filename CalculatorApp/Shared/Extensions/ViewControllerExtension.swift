//
//  ViewControllerExtension.swift
//  CalculatorApp
//
//
//

import Foundation
import UIKit

extension UIViewController{
    // return int type string or double type string
    func intOrDouble(_ value: Double) -> String {
        let roundedValue = round(value * 1000000000) / 1000000000   // trouble shooting
        if roundedValue - Double(Int(roundedValue)) == 0 {
            return String(Int(roundedValue))
        } else {
            return String(roundedValue)
        }
    }

}
