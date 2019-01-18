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
   // Setting number for testing Model
   func setNewNumber(_ newNumber: Int) {
      text = "\(operations.addNewNumber(newNumber))"
   }
   // Setting operator for testing Model
   func setOperatorValue(_ operatorSymbol: String) {
      operations.operators.append(operatorSymbol)
      operations.stringNumbers.append("")
   }
   // MARK: - TEST DDB
   // MARK: - OPERATIONS
   // PLUS TEST
   func testGivenTextIs50_WhenIncrementingPlus45_ThenTotalIs95() {
      //Given
      setNewNumber(5)
      setNewNumber(0)
      //When
      setOperatorValue("+")
      setNewNumber(45)
      // Then
      XCTAssertEqual(try operations.calculateTotal(), 95)
   }
   // MINUS TEST
   func testGivenTextIs4_WhenIncrementingMinus5_ThenTotalIsNegative1() {
      //Given
      setNewNumber(4)
      //When
      setOperatorValue("-")
      setNewNumber(5)
      // Then
      XCTAssertEqual(try operations.calculateTotal(), -1)
   }
   // MINUS - PLUS TEST
   func testGivenTextIs45_WhenIncrementingMinus50Plus56_ThenTotalIs51() {
      //Given
      setNewNumber(45)
      //When
      setOperatorValue("-")
      setNewNumber(50)
      setOperatorValue("+")
      setNewNumber(56)
      // Then
      XCTAssertEqual(try operations.calculateTotal(), 51)
   }
   // PLUS - MINUS TEST
   func testGivenTextIs80_WhenIncrementingPlus70Minus150_ThenTotalIsZero() {
      //Given
      setNewNumber(80)
      //When
      setOperatorValue("+")
      setNewNumber(70)
      setOperatorValue("-")
      setNewNumber(150)
      // Then
      XCTAssertEqual(try operations.calculateTotal(), 0)
   }
   // MARK: - AddOperator TEST
   // Adding +
   func testGivenTextIsNil_WhenIncrementing5Plus_ThenAddOperatorPlus() {
      //Given
      //When
      setNewNumber(5)
      // Then
      XCTAssertEqual(try operations.addOperator("+"), "+")
   }
   // AddOperator FALSE TEST
   func testGivenTextIs5_WhenIncrementingPlusPlus_ThenCanAddOperatorIsFalse() {
      //Given
      setNewNumber(5)
      //When
      setOperatorValue("+")
      setOperatorValue("+")
      // Then
      XCTAssertEqual(operations.canAddOperator, false)
   }
   // AddOperator ELSE FALSE TEST
   func testGivenTextIs5_WhenIncrementingPlusEqual_ThenCanAddOperatorIsFalse() {
      //Given
      setNewNumber(5)
      //When
      setOperatorValue("+")
      setOperatorValue("=")
      // Then
      XCTAssertEqual(operations.canAddOperator, false)
   }
   // MARK: - ERROR THROWS TESTS
   // AddOperator THROW TEST
   func testGivenTextIs5_WhenIncrementingPlusEqual_ThenThrowWrongExpression() {
      //Given
      setNewNumber(5)
      //When
      setOperatorValue("+")
      // Then
      XCTAssertThrowsError(try operations.addOperator("-")) { (error) -> Void in
         XCTAssertEqual(error as? Operations.AlertErrors,
                        Operations.AlertErrors.wrongExpression)
      }
   }
   // isExpressionCorrect THROW TEST
   func testGivenTextIsNil_WhenIncrementingEqual_ThenThrowNewCalcul() {
      //Given
      // When
      // Then
      XCTAssertThrowsError(try operations.isExpressionCorrect()) { (error) -> Void in
         XCTAssertEqual(error as? Operations.AlertErrors,
                        Operations.AlertErrors.newCalcul)
      }
   }
   // isExpressionCorrect THROW TEST
   func testGivenTextIs5_WhenIncrementingPlus_ThenThrowEnterCorrectExpression() {
      //Given
       setNewNumber(5)
      //When
      setOperatorValue("+")
      // Then
      XCTAssertThrowsError(try operations.isExpressionCorrect()) { (error) -> Void in
         XCTAssertEqual(error as? Operations.AlertErrors,
                        Operations.AlertErrors.enterCorrectExpression)
      }
   }
   // isExpression don't trhow error TEST
   func testGivenTextIs5_WhenIncrementingPlusPlus_ThenIsExpressionCorrectDontThrowError() {
      //Given
      setNewNumber(5)
      setOperatorValue("+")
      //When
      setNewNumber(5)
      // Then
      XCTAssertNoThrow(try operations.isExpressionCorrect())
   }
   // MARK: - CLEAR FUNCTION TEST
   // Clear functionTEST
   func testGivenTextIs5Plus75_WhenIncrementingEqualPlusCLEAR_ThenSetToDefault() {
      //Given
      setNewNumber(5)
      setOperatorValue("+")
      setNewNumber(5)
      //When
      setOperatorValue("=")
      operations.clear()
      // Then
      XCTAssertEqual([String()], [""], "0")
   }
}
