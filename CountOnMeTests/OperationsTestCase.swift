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
   var text = " "
   override func setUp() {
      super.setUp()
      operations = Operations()
   }
   func testGivenTextIsNull_WhenIncrementingNumber5_ThenTextIs5() {
      text = "\(operations.addNewNumber(5))"
      text = "\(operations.updateDisplay())"
      // Then
      XCTAssert(text == "5")
   }
   func testGivenTextIs5_WhenIncrementingOperatorX_ThenTextIs5X() {
      text = "5"
      // When
      text = "\(operations.operators = ["×"])"
      text = "\(operations.updateDisplay())"
      // Then
      XCTAssert(text == "5×")
   }
}
