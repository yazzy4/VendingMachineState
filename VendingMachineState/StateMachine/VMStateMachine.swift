//
//  VMStateMachine.swift
//  VendingMachineState
//
//  Created by Yaz Burrell on 11/10/22.
//

import Foundation


public class VMStateMachine {
    
    private(set) var currentState: VendingMachineState?
    var states: [VendingMachineState]
    
    init(states: [VendingMachineState]) {
        self.states = states
        self.currentState = nil
    }
    
    func enter(_ state: VendingMachineState) -> Bool {
        if currentState == nil {
            currentState = state
            return true
        } else if !currentState!.isValidNextState(state) {
            return false
        }
        
        currentState!.willExit(to: state)
        currentState = state
        return true
    }
    
}
