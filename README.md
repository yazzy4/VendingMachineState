# VendingMachineState

 **Problem description:**
 Design a vending machine.

 **Clarify:**
 - No more restrictions, just design a general vending machine we are familiar with.

 **Use case list:**
 - select item and get price
 - accept bills/coins
 - dispense items purchased and return change
 - refund when cancelling the request
 - Possible exceptions:

 **Sold out**
 - Not fully paid
 - Not enough changes
-----

## Vending Machine States & Events

 **States**
 - A. Inactive
 - B. Wating
 - C. Ready to dispense
 - D. Item selected
 
 **Events**
 1. Active
 2. Cash collected
 3. Dispense item
 4. Return change

 
```swift 
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
 ```

**References**
- Creating a state machine in Swift: https://rderik.com/blog/creating-a-state-machine-in-swift/
- Vending Machine design -- A State design pattern approach: https://medium.com/swlh/vending-machine-design-a-state-design-pattern-approach-5b7e1a026cd2
