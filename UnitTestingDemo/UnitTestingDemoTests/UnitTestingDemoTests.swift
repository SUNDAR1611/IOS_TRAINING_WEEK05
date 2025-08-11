//
//  UnitTestingDemoTests.swift
//  UnitTestingDemoTests
//
//  Created by cs_ios on 11/08/25.
//

import XCTest
@testable import UnitTestingDemo

final class UnitTestingDemoTests: XCTestCase {
    private var sut: TodoViewModel!

    override func setUp()  {
       super.setUp()
        sut = TodoViewModel()
    }

    override func tearDown(){
       sut = nil
        super.tearDown()
    }

    func testExample() throws {
         //Arrange
        let newTodoText = "Test task"
        let initialTaskCount = sut.tasks.count
        
        //Act
        sut.addTask(name: newTodoText)
        
        //Assert
        XCTAssert(sut.tasks.count == initialTaskCount + 1)
        XCTAssert(sut.tasks.last?.name == newTodoText)   
    }
         func test_addTask_withEmptyText() {
        //Arrange
             let initialTaskCount = sut.tasks.count
             
        //Act
             sut.addTask(name: "")
        
        //Assert
             XCTAssert(sut.tasks.count == initialTaskCount)
    }
}
