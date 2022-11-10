//
//  InactiveState.swift
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
 | B. Waiting for $$     |             |      C       |      C          |            |
 +----------------------------------------------------------------------------------+
 | C. Ready to for code  |             |              |       D         |      D     |
 +----------------------------------------------------------------------------------+
 | D. Receive Item       |             |             |                |        A    |
 +----------------------------------------------------------------------------------+
 */

class InactiveState: VendingMachineState {
    
    override func isValidNextState(_ state: VendingMachineState) -> Bool {
        switch state {
        case is WaitingForCashState:
            return true
        default:
            print("DEBUG: Wrong action, you haven't made a selection yet")
            return false
        }
    }
    
    override func willExit(to state: VendingMachineState) {
        print("DEBUG: will make selection")
    }
}
