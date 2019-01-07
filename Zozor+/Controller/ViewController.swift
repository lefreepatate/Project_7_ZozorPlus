//
//  ViewController.swift
//  CountOnMe
//
//  Created by Ambroise COLLON on 30/08/2016.
//  Copyright © 2016 Ambroise Collon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   // MARK: - Properties
   // Calling the model
   var operations = Operations()
   // MARK: - Outlets
   @IBOutlet weak var textView: UITextView!
   @IBOutlet var numberButtons: [UIButton]!
   // MARK: - Action
   // Adding number on display to calculate
   @IBAction func tappedNumberButton(_ sender: UIButton) {
      for (nmbr, numberButton) in numberButtons.enumerated() where sender == numberButton {
         textView.text = "\(operations.addNewNumber(nmbr))"
      }
   }
   // Adding operators
   @IBAction func plus(_ sender: UIButton) {
      operation(operatorSymbol: "+", on: sender)
   }
   @IBAction func minus(_ sender: UIButton) {
      operation(operatorSymbol: "-", on: sender)
   }
   @IBAction func divide(_ sender: UIButton) {
      operation(operatorSymbol: "÷", on: sender)
   }
   @IBAction func mutliply(_ sender: UIButton) {
      operation(operatorSymbol: "×", on: sender)
   }
   // Reset display to 0
   @IBAction func reset(_ sender: UIButton) {
      textView.text = "0"
   }
   // Calculate operators
   @IBAction func equal(_ sender: UIButton) {
      if !isExpressionCorrect {
         return
      }
      textView.text = "\(operations.calculateTotal())"
   }
   // MARK: - Methods
   func operation(operatorSymbol: String, on button: UIButton) {
      if canAddOperator {
         operations.operators.append(operatorSymbol)
         operations.stringNumbers.append("")
         textView.text = "\(operations.updateDisplay())"
      }
   }
}

extension ViewController {
   // Allerts properties
   var isExpressionCorrect: Bool {
      if let stringNumber = operations.stringNumbers.last {
         if stringNumber.isEmpty {
            if operations.stringNumbers.count == 1 {
               let alertVC = UIAlertController(title: "Zéro!", message: "Démarrez un nouveau calcul !",
                                               preferredStyle: .alert)
               alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
               self.present(alertVC, animated: true, completion: nil)
            } else {
               let alertVC = UIAlertController(title: "Zéro!", message: "Entrez une expression correcte !",
                                               preferredStyle: .alert)
               alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
               self.present(alertVC, animated: true, completion: nil)
            }
            return false
         }
      }
      return true
   }
   var canAddOperator: Bool {
      if let stringNumber = operations.stringNumbers.last {
         if stringNumber.isEmpty {
            let alertVC = UIAlertController(title: "Zéro!", message: "Expression incorrecte !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
            return false
         }
      }
      return true
   }
}
