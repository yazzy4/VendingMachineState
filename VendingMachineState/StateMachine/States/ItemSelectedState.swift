//
//  ItemSelectedState.swift
//  VendingMachineState
//
//  Created by Yaz Burrell on 11/10/22.
//

import Foundation

class ItemSelectedState: VendingMachineState {
    
    override func isValidNextState(_ state: VendingMachineState) -> Bool {
        switch state {
        case is ItemDispensedState, is InactiveState:
            return true
        default:
            print("DEBUG: Wrong action. You can only cancel action")
            return false
        }
    }
    
    override func willExit(to state: VendingMachineState) {
        if (state is ItemDispensedState) {
            print("DEBUG: Item has been dispensed")
        } else if (state is InactiveState) {
            print("DEBUG: Done")
        }
    }
}
