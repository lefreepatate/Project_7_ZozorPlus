//
//  operations.swift
//  CountOnMe
//
//  Created by Carlos Garcia-Muskat on 14/12/2018.
//  Copyright © 2018 Ambroise Collon. All rights reserved.
//

import Foundation
class Operations {
   var stringNumbers: [String] = [String()]
   var operators: [String] = ["+"]
   var index = 0
   
   func calculateTotal() {
      var total:Float = 0
      for (i, stringNumber) in stringNumbers.enumerated() {
         if let number = Float(stringNumber) {
            if operators[i] == "+" {
               total += number
            } else if operators[i] == "-" {
               total -= number
            } else if operators[i] == "÷" {
               total /= number
            } else if operators[i] == "×" {
               total *= number
            }
         }
      }
      clear()
   }
   
   func addNewNumber(_ newNumber: Int) -> String {
      if let stringNumber = stringNumbers.last {
         var stringNumberMutable = stringNumber
         stringNumberMutable += "\(newNumber)"
         stringNumbers[stringNumbers.count-1] = stringNumberMutable
      }
      return updateDisplay()
   }
   
   func updateDisplay() -> String {
      var text = ""
      for (i, stringNumber) in stringNumbers.enumerated() {
         // Add operator
         if i > 0 {
            text += operators[i]
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
