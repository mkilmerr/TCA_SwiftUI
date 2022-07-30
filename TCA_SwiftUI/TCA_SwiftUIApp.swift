//
//  TCA_SwiftUIApp.swift
//  TCA_SwiftUI
//
//  Created by Marcos Kilmer Pereira de Aquino on 30/07/22.
//

import SwiftUI
import ComposableArchitecture

@main
struct TCA_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(store: Store(initialState: CounterState(count: 0), reducer: counterReducer, environment: ()))
        }
    }
}
