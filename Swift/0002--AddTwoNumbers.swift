/*
 2.Add Two Numbers
 You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.

 You may assume the two numbers do not contain any leading zero, except the number 0 itself.

 Example 1:
 Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
 Output: 7 -> 0 -> 8
 Explanation: 342 + 465 = 807.
 
 Example 2:
 Input: l1 = [0], l2 = [0]
 Output: [0]
 
 Example 3:
 Input: l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
 Output: [8,9,9,9,0,0,0,1]
  
 Constraints:
 The number of nodes in each linked list is in the range [1, 100].
 0 <= Node.val <= 9
 It is guaranteed that the list represents a number that does not have leading zeros.
*/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var list1: ListNode? = l1
        var list2: ListNode? = l2
        let resultList = ListNode(0)
        var currentNode: ListNode = resultList
        var carry: Int = 0
        while (list1 != nil || list2 != nil) {
            let sum: Int = (list1?.val ?? 0) + (list2?.val ?? 0) + carry
            let val: Int = sum % 10
            currentNode.next = ListNode(val)
            carry = sum / 10
            list1 = list1?.next
            list2 = list2?.next
            currentNode = currentNode.next!
        }
        if carry > 0 {
            currentNode.next = ListNode(carry)
            currentNode = currentNode.next!
        }
        return resultList.next
    }
}

let list1 = ListNode(2)
var current = list1
current.next = ListNode(4)
current = current.next!
current.next = ListNode(3)
let list2 = ListNode(5)
current = list2
current.next = ListNode(6)
current = current.next!
current.next = ListNode(4)
let result:ListNode = Solution().addTwoNumbers(list1, list2)!
var currentResult: ListNode? = result
while (currentResult != nil) {
    print(currentResult!.val)
    currentResult = currentResult?.next
}
