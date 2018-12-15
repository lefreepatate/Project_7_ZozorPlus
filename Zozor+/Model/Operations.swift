//
//  operations.swift
//  CountOnMe
//
//  Created by Carlos Garcia-Muskat on 14/12/2018.
//  Copyright © 2018 Ambroise Collon. All rights reserved.
//

import Foundation

class Operations {
   // MARK: - PROPERTIES
   var stringNumbers: [String] = [String()]
   var operators: [String] = ["+"]
   var index = 0
   // MARK: - METHODS
   func calculateTotal() -> Float {
      var total: Float = 0
      for (nmbr, stringNumber) in stringNumbers.enumerated() {
         if let number = Float(stringNumber) {
            if operators[nmbr] == "+" {
               total += number
            } else if operators[nmbr] == "-" {
               total -= number
            } else if operators[nmbr] == "÷" {
               total /= number
            } else if operators[nmbr] == "×" {
               total *= number
            }
         }
      }
      clear()
      return total
   }
   func addNewNumber(_ newNumber: Int) -> String {
      if let stringNumber = stringNumbers.last {
         var stringNumberMutable = stringNumber
         stringNumberMutable += "\(newNumber)"
         stringNumbers[stringNumbers.count-1] = stringNumberMutable
      }
      return "\(updateDisplay())"
   }
   func updateDisplay() -> String {
      var text = ""
      for (nmbr, stringNumber) in stringNumbers.enumerated() {
         // Add operator
         if nmbr > 0 {
            text += operators[nmbr]
         }
         // Add number
         text += stringNumber
      }
      return text
   }
   func clear() {
      stringNumbers = [String()]
      operators = ["+"]
      index = 0
   }
}
