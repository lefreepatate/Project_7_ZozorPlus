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
   func testGivenTextIs5_WhenIncrementingMultiply5_ThenTextIs5X5() {
      setNewNumber(5)
      //When
      setOperatorValue("×")
      setNewNumber(5)
      // Then
      XCTAssertEqual(text, "5×5")
   }
   func testGivenTextIs50_WhenIncrementingPlus45_ThenTotalIs95() {
      setNewNumber(5)
      setNewNumber(0)
      //When
      setOperatorValue("+")
      setNewNumber(45)
      // Then
      XCTAssertEqual(operations.calculateTotal(), 95)
   }
   func testGivenTextIs4_WhenIncrementingMinus5_ThenTotalIsNegative1() {
      setNewNumber(4)
      //When
      setOperatorValue("-")
      setNewNumber(5)
      // Then
      XCTAssertEqual(operations.calculateTotal(), -1)
   }
   func testGivenTextIs5_WhenIncrementingMultiply5_ThenTotalIs25() {
      setNewNumber(5)
      //When
      setOperatorValue("×")
      setNewNumber(5)
      // Then
      XCTAssertEqual(operations.calculateTotal(), 25)
   }
   func testGivenTextIs30_WhenIncrementingDivide5_ThenTotalIs6() {
      setNewNumber(3)
      setNewNumber(0)
      //When
      setOperatorValue("÷")
      setNewNumber(5)
      // Then
      XCTAssertEqual(operations.calculateTotal(), 6)
   }
   func testGivenTextIs50_WhenIncrementingDivide63_ThenTotalIsFloat() {
      setNewNumber(5)
      setNewNumber(0)
      //When
      setOperatorValue("÷")
      setNewNumber(63)
      // Then
      XCTAssertEqual(operations.calculateTotal(), 0.7936508)
   }

}
