//
//  CalculatorVC.swift
//  CalculatorApp
//
//  Created by Elif Karakolcu on 20.08.2023.
//

import UIKit

class CalculatorVC: UIViewController {

    @IBOutlet weak var screenLabel: UILabel!
    @IBOutlet var buttons: [UIButton]!
    var type: OperationType?
    
    var firstValue = 0.0
    var result = ""
    var screenValue = 0.0
    var opValue = 0
   
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func equal(){
        let value = self.screenLabel.text ?? "0"
        let secondValue = Double(value) ?? 0.0
        switch self.type {
        case .Add:
            let add = Double(self.firstValue + secondValue)
            self.result = intOrDouble(add)
        case .Subtract:
            let sub = Double(self.firstValue - secondValue)
            self.result = intOrDouble(sub)
        case .Multiply:
            let mult = Double(self.firstValue * secondValue)
            self.result = intOrDouble(mult)
        case .Divide:
            let div = Double(self.firstValue/secondValue)
            self.result = intOrDouble(div)
        case .Percent:
            let per = Double((self.firstValue*secondValue)/100)
            self.result = intOrDouble(per)
        case .AddSub:
            let addSub = Double(self.firstValue + secondValue)
            self.result = intOrDouble(addSub)
        case .Clear:
            self.screenLabel.text = "0"
        case .none:
            break
        case .some(_):
            break
            
        }
        self.screenLabel.text = self.result
    }
    func setButtonColor(tag: Int){
        for i in 0..<buttons.count{
            if buttons[i].tag == tag{
                buttons[i].alpha = 0.7
            }else{
                buttons[i].alpha = 1
            }
        }
    }
}
//MARK: - Button Actions
extension CalculatorVC{
    
    @IBAction func numberButttonTapped(_ sender: UIButton) {
        self.setButtonColor(tag: sender.tag)
        if self.type == .Decimal {
            self.screenLabel.text = (self.screenLabel.text ?? "") + String(sender.tag)
            self.firstValue = Double(self.screenLabel.text ?? "0.0") ?? 0.0
        }else{
            self.screenValue = Double(self.screenLabel.text ?? "0.0") ?? 0.0
            if self.screenValue == 0  || self.opValue == 1 {
                if sender.tag >= 0 && sender.tag <= 9{
                    self.screenLabel.text = String(sender.tag)
                    self.opValue = 0
                }
                
            }else{
                self.screenLabel.text = (self.screenLabel.text ?? "") + String(sender.tag)
            }
            
        }
    }
    
    @IBAction func operationButtonTapped(_ sender: UIButton) {
        self.setButtonColor(tag: sender.tag)
        let value = self.screenLabel.text ?? "0.0"
        switch sender.titleLabel?.text{
        case OperationType.Add.rawValue:
            self.type = .Add
            self.firstValue = Double(value) ?? 0.0
            self.opValue = 1
        case OperationType.Subtract.rawValue:
            self.type = .Subtract
            self.firstValue = Double(value) ?? 0.0
            self.opValue = 1
        case OperationType.Multiply.rawValue:
            self.type = .Multiply
            self.firstValue = Double(value) ?? 0.0
            self.opValue = 1
        case OperationType.Divide.rawValue:
            self.type = .Divide
            self.firstValue = Double(value) ?? 0.0
            self.opValue = 1
        case OperationType.Percent.rawValue:
            self.type = .Percent
            self.firstValue = Double(value) ?? 0.0
            self.opValue = 1
        case OperationType.AddSub.rawValue:
            self.type = .AddSub
            self.firstValue = (-1)*(Double(value) ?? 0.0)
            self.screenLabel.text = intOrDouble(self.firstValue)
            self.opValue = 1
        case OperationType.Clear.rawValue:
            self.screenLabel.text = "0"
        case OperationType.Equal.rawValue:
            self.equal()
            self.opValue = 1
        case OperationType.Decimal.rawValue:
            self.type = .Decimal
            self.firstValue = Double(value) ?? 0.0
            self.screenLabel.text = value + "."
            self.opValue = 0
        case .none:
            break
        case .some(_):
            break
        }
    }
    
}
