//
//  ContentView.swift
//  TCA_SwiftUI
//
//  Created by Marcos Kilmer Pereira de Aquino on 30/07/22.
//

import SwiftUI
import ComposableArchitecture


// MARK: - State
struct CounterState: Equatable {
    var count: Int
}

// MARK: -  Action
enum CounterAction: Equatable {
    case increment, decrement
}

// MARK: - Reducer
let counterReducer = Reducer<CounterState, CounterAction, Void> { state, action, _ in
    switch action {
    case .increment:
        state.count += 1
    case .decrement:
        if state.count != 0 { state.count -= 1 }
    }

    return .none
}

struct ContentView: View {
    let store: Store<CounterState, CounterAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                Spacer()

                Text("\(viewStore.count)")
                    .font(.largeTitle)
                    .padding()

                Spacer()
                HStack {
                    Button(action: {
                        viewStore.send(.increment)
                    }, label: {
                        Image(systemName: "plus")
                            .tint(.white)
                            .frame(width: 50, height: 50, alignment: .center)
                            .background(Color.blue)
                    })
                        .cornerRadius(12)


                    Spacer()

                    Button(action: {
                        viewStore.send(.decrement)
                    }, label: {
                        Image(systemName: "minus")
                            .tint(.white)
                            .frame(width: 50, height: 50, alignment: .center)
                            .background(Color.red)
                    })
                        .cornerRadius(12)


                }
                .padding()
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: Store(initialState: CounterState(count: 0), reducer: counterReducer, environment: ()))
    }
}
