//
//  MainEvent.swift
//  VendingMachineState
//
//  Created by Yaz Burrell on 11/11/22.
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


class MainEvent: UIViewController {
    

    let inactiveState = InactiveState()
    let waitingForCashState = WaitingForCashState()
    let readyForCodeState = ReadyForCodeState()
    let itemSelectedState = ItemSelectedState()
    let itemDispensedState = ItemDispensedState()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcome()
        var vendingMachineStates = VMStateMachine(states: [inactiveState,waitingForCashState, readyForCodeState, itemSelectedState, itemDispensedState])
        vendingMachineStates.enter(inactiveState)
        while true {
           print("Enter your actions(1. Decide  | 2. Add $$   | 3. Enter vending code  | 4. Get item ): ", terminator: "")
            let option = readLine(strippingNewline: true)!
            
            switch option {
            case "1":
                vendingMachineStates.enter(waitingForCashState)
            case "2":
                vendingMachineStates.enter(readyForCodeState)
            case "3":
                vendingMachineStates.enter(itemSelectedState)
            case "4":
                if vendingMachineStates.currentState is WaitingForCashState {
                    vendingMachineStates.enter(itemSelectedState)
                } else if vendingMachineStates.currentState is ReadyForCodeState {
                    vendingMachineStates.enter(itemSelectedState)
                } else if vendingMachineStates.currentState is ItemSelectedState {
                    vendingMachineStates.enter(itemDispensedState)
                }
                print("Item dispensed")
            default:
                print("Invalid option")
                
            }
        }

    }
    
    func welcome() {
        print("Welcome to this random vending machine, just kinda... floating in space")
    }
    

    
}
