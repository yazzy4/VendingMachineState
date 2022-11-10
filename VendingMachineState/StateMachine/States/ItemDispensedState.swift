//
//  ItemDispensedState.swift
//  VendingMachineState
//
//  Created by Yaz Burrell on 11/10/22.
//

import Foundation


class ItemDispensedState: VendingMachineState {
    
    override func isValidNextState(_ state: VendingMachineState) -> Bool {
        switch state {
        case is WaitingForCashState, is InactiveState:
            return true
        default:
            print("DEBUG: Wrong action. Can only add more cash after item is received or walk away")
            return false
        }
    }
    
    override func willExit(to state: VendingMachineState) {
        if (state is WaitingForCashState) {
            print("DEBUG: Please make another selection")
        } else if (state is InactiveState) {
            print("DEBUG: Maybe later")
        }
    }
}
