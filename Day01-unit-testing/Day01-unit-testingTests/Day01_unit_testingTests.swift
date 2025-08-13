//
//  Day01_unit_testingTests.swift
//  Day01-unit-testingTests
//
//  Created by cs_ios on 11/08/25.
//

import XCTest
@testable import Day01_unit_testing

final class CounterViewModelTests: XCTestCase {

    func testIncrement() {
        let viewModel = CounterViewModel()
        viewModel.increment()
        XCTAssertEqual(viewModel.count, 1, "Count should be 1 after one increment")
    }
    
    func testReset() {
        let viewModel = CounterViewModel()
        viewModel.increment()
        viewModel.increment()
        viewModel.reset()
        XCTAssertEqual(viewModel.count, 0, "Count should be 0 after reset")
    }
}

