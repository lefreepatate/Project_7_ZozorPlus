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
   @IBOutlet var operatorButtons: [UIButton]!
   // MARK: - Action
   // Adding number on display to calculate
   @IBAction func tappedNumberButton(_ sender: UIButton) {
      for (nmbr, numberButton) in numberButtons.enumerated() where sender == numberButton {
         textView.text += "\(operations.addNewNumber(nmbr))"
         updateDisplay()
      }
   }
   // Adding operators
   @IBAction func plus(_ sender: UIButton) {
      operation(operatorSymbol: "+", on: sender)
   }
   @IBAction func minus(_ sender: UIButton) {
      operation(operatorSymbol: "-", on: sender)
   }
   // Calculate operators
   @IBAction func equal(_ sender: UIButton) {
      do {
         try operations.isExpressionCorrect()
         textView.text = "\(try operations.calculateTotal())"
      } catch Operations.AlertErrors.newCalcul {
         alert(with: "Zéro!", message: "Démarrez un nouveau calcul !")
      } catch {
         alert(with: "Zéro!", message: "Entrez une expression correcte !")
      }
   }
   // Reset display to 0
   @IBAction func reset(_ sender: UIButton) {
      operations.clear()
      textView.text = "0"
   }
   // MARK: - Methods
   func operation(operatorSymbol: String, on button: UIButton) {
      do {
         textView.text = "\(try operations.addOperator(operatorSymbol))"
         updateDisplay()
      } catch {
         alert(with: "Zéro!", message: "Expression incorrecte !")
      }
   }
   // Alert general function
   func alert(with title: String, message: String) {
      let alertVC = UIAlertController(title: title, message: message,
                                      preferredStyle: .alert)
      alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
      self.present(alertVC, animated: true, completion: nil)
   }
   // Getting string to update the calculator display
   func updateDisplay() {
      var text = ""
      for (ind, stringNumber) in operations.stringNumbers.enumerated() {
         // Add operator
         if ind > 0 {
            text += operations.operators[ind]
         }
         // Add number
         text += stringNumber
      }
      textView.text = text
   }
}
