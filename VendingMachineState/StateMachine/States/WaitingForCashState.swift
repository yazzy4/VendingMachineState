//
//  WaitingForCash.swift
//  VendingMachineState
//
//  Created by Yaz Burrell on 11/10/22.
//

import UIKit

/*
 +-----------------------+------------+---------------+-----------------+-----------+
 |  State / Event        |1. Active   |2. Add $$      |3. Item Selected |4. Dispense |
 +----------------------------------------------------------------------------------+
 | A. Inactive           |    B        |     B        |                |            |
 +----------------------------------------------------------------------------------+
 | B. Waiting for $$     |             |      C       |                |            |
 +----------------------------------------------------------------------------------+
 | C. Ready to for code  |             |              |       D         |      D     |
 +----------------------------------------------------------------------------------+
 | D. Receive Item       |             |             |                |        A    |
 +----------------------------------------------------------------------------------+
 */

class WaitingForCashState: VendingMachineState {
    
    // add cancel state, maybe just refactor active and inactive it exit and enter
    override func isValidNextState(_ state: VendingMachineState) -> Bool {
        switch state {
        case is ReadyForCodeState, is InactiveState:
            return true
        default:
            print("DEBUG: Wrong action you can only add more money or cancel")
            return false
        }
    }
    
    override func willExit(to state: VendingMachineState) {
        if state is ReadyForCodeState {
            print("DEBUG: ready for vending code")
        } else if (state is InactiveState) {
            print("DEBUG: returning funds")
        }
    }
    
}
