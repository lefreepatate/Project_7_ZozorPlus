//
//  OperationsTestCase.swift
//  CountOnMeTests
//
//  Created by Carlos Garcia-Muskat on 15/12/2018.
//  Copyright © 2018 Ambroise Collon. All rights reserved.
//

import XCTest
@testable import CountOnMe

class OperationsTestCase: XCTestCase {
   var operations: Operations!
   var text = ""
   override func setUp() {
      super.setUp()
      operations = Operations()
   }
   func setNewNumber(_ newNumber: Int) {
      text = "\(operations.addNewNumber(newNumber))"
   }
   func setOperatorValue(_ operatorSymbol: String) {
      operations.operators.append(operatorSymbol)
      operations.stringNumbers.append("")
      text = operations.updateDisplay()
   }
   func setCalculateTotal() {
      text = "\(operations.calculateTotal())"
   }
   // MARK: - TEST DDB
   func testGivenTextIsNull_WhenIncrementingNumber5_ThenTextIs5() {
      text = ""
      // When
      setNewNumber(5)
      // Then
      XCTAssertEqual(text, "5")
   }
   func testGivenTextIs5_WhenIncrementingOperatorX_ThenTextIs5X() {
      setNewNumber(5)
      //When
      setOperatorValue("×")
      // Then
      XCTAssertEqual(text, "5×")
   }
   func testGivenTextIs5_WhenIncrementingX5_ThenTextIs5X5() {
      setNewNumber(5)
      //When
      setOperatorValue("×")
      setNewNumber(5)
      // Then
      XCTAssertEqual(text, "5×5")
   }
   func testGivenTextIs5X5_WhenIncrementingTotal_ThenTextIs25() {
      setNewNumber(5)
      //When
      setOperatorValue("×")
      setNewNumber(5)
      // Then
      XCTAssertEqual(operations.calculateTotal(), 25)
   }
}
