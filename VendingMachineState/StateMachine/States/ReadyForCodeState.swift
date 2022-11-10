//
//  ReadyForCodeState.swift
//  VendingMachineState
//
//  Created by Yaz Burrell on 11/10/22.
//

import Foundation

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

class ReadyForCodeState: VendingMachineState {
    
    override func isValidNextState(_ state: VendingMachineState) -> Bool {
        switch state {
        case is ReadyForCodeState, is ItemSelectedState, is InactiveState:
            return true
        default:
            print("DEBUG: Wrong action. You can only select an item or cancel your selection")
            return false
        }
    }
    
    override func willExit(to state: VendingMachineState) {
        if (state is ReadyForCodeState) {
            print("DEBUG: Ready to receive item selection")
        } else if (state is ItemSelectedState) {
            print("DEBUG: Selecting item")
        } else if (state is InactiveState) {
            print("DEBUG: Cancelling item")
        }
    }
}
