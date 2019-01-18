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
   var style = AlertErrors.newCalcul
   var stringNumbers: [String] = [""]
   var operators = ["+"]
   var index: Int = 0
   var lastResult: Float = 0
   var canAddOperator: Bool {
      if let stringNumber = stringNumbers.last {
         if stringNumber.isEmpty {
            return false
         }
      }
      return true
   }
   // Enum ERRORS
   enum AlertErrors: Error {
      case newCalcul, enterCorrectExpression, wrongExpression
   }
   // MARK: - METHODS
   // operations
   func calculateTotal() throws -> Float {
      var total: Float = 0
      for (ind, stringNumber) in stringNumbers.enumerated() {
         if let number = Float(stringNumber) {
            if operators[ind] == "+" {
               total += number
            }
            if operators[ind] == "-" {
               total -= number
            }
         }
      }
      return total
   }
   // Adding new number to the operant
   func addNewNumber(_ newNumber: Int) -> Int {
      if let stringNumber = stringNumbers.last {
         var stringNumberMutable = stringNumber
         stringNumberMutable += "\(newNumber)"
         stringNumbers[stringNumbers.count-1] = stringNumberMutable
      }
      return newNumber
   }
   // Adding new operator
   func addOperator(_ newOperator: String) throws -> String {
      // Checking if there is no 2 or more operators tapped 
      guard canAddOperator else {
         throw AlertErrors.wrongExpression
      }
      operators.append(newOperator)
      stringNumbers.append("")
      return newOperator
   }
   // Checking if there is no errors such like 8 x = or = at the beginning
   func isExpressionCorrect() throws {
      if let stringNumber = stringNumbers.last {
         if stringNumber.isEmpty {
            if stringNumbers.count == 1 {
               throw AlertErrors.newCalcul
            } else {
               throw AlertErrors.enterCorrectExpression
            }
         }
      }
      return
   }
   // Clearing the display
   func clear() {
      stringNumbers = [String()]
      operators = ["+"]
      index = 0
   }
}
