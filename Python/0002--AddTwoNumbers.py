#2. Add Two Numbers
# Definition for singly-linked list.
class ListNode(object):
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next
class Solution(object):
    def addTwoNumbers(self, l1, l2):
        """
        :type l1: ListNode
        :type l2: ListNode
        :rtype: ListNode
        """
        list1 = l1
        list2 = l2
        resultList = ListNode()
        currentNode = resultList
        carry = 0
        while (list1 or list2):
        	sum = (list1.val if list1 else 0) + (list2.val if list2 else 0) + carry
        	val = sum % 10
        	carry = sum / 10
        	print("sum", sum)
        	print("val", val)
        	print("carry", carry)
        	currentNode.next = ListNode(val)
        	list1 = list1.next if list1 else None
        	list2 = list2.next if list2 else None
        	currentNode = currentNode.next
        if (carry != 0):
        	currentNode.next = ListNode(carry)
        	currentNode = currentNode.next
        return resultList.next

list1 = ListNode(2)
currentNode = list1
currentNode.next = ListNode(4)
currentNode = currentNode.next
currentNode.next = ListNode(3)
list2 = ListNode(5)
currentNode = list2
currentNode.next = ListNode(6)
currentNode = currentNode.next
currentNode.next = ListNode(4)
resultList = Solution().addTwoNumbers(list1, list2)
currentNode = resultList
while (currentNode):
	print(currentNode.val)
	currentNode = currentNode.next
