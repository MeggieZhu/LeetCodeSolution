"""
if num1 is known, then num2 can be found from num1 to the end of nums array
"""
class Solution1(object):
    def twoSum(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: List[int]
        """
        lengthOfNums = len(nums)
        for i in range(lengthOfNums):
            for j in range(i + 1, lengthOfNums):
                if nums[i] + nums[j] == target:
                    return [i, j]



"""
hash map
"""
class Solution2(object):
    def twoSum(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: List[int]
        """
        hashmap = {}
        for i in range(len(nums)):
            matchnum = target - nums[i]
            if (matchnum in hashmap):
                return [hashmap.get(matchnum), i]
            else:
                hashmap[nums[i]] = i

nums = [2, 7, 11, 15]
target = 9
result1 = Solution1().twoSum(nums, target)
result2 = Solution2().twoSum(nums, target)
print(result1)
print(result2)