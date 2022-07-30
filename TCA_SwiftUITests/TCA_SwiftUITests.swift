//
//  TCA_SwiftUITests.swift
//  TCA_SwiftUITests
//
//  Created by Marcos Kilmer Pereira de Aquino on 30/07/22.
//

import XCTest
import ComposableArchitecture
@testable import TCA_SwiftUI

class TCA_SwiftUITests: XCTestCase {
    func test_increment_one() {
        let store = TestStore(initialState: CounterState(count: 0), reducer: counterReducer, environment: ())

        store.send(.increment) { state  in
            state.count = 1
        }

        store.send(.increment) { $0.count = 2 }
    }
}
