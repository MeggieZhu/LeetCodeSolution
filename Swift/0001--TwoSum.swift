/*
 1. Two Sum
 Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
 You may assume that each input would have exactly one solution, and you may not use the same element twice.
 You can return the answer in any order.
 Example 1:
 Input: nums = [2,7,11,15], target = 9
 Output: [0,1]
 Output: Because nums[0] + nums[1] == 9, we return [0, 1].
 Example 2:
 Input: nums = [3,2,4], target = 6
 Output: [1,2]
 Example 3:
 Input: nums = [3,3], target = 6
 Output: [0,1]
*/
/*
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var result = Array<Int>()
        var container = Set<Int>()
        for (index1, value) in nums.enumerated() {
            let match = target - value
            if container.contains(match) {
                let index2 = nums.firstIndex(of: match)!
                result.append(index1)
                result.append(index2)
                break
            }
            container.insert(value)
        }
        return result
    }
}
*/
//if num1 is known, then num2 can be found from num1 to the end of nums array
class Solution1 {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        let lengthOfNums = nums.count
        for i in 0..<lengthOfNums {
            for j in (i + 1)..<lengthOfNums {
                if (nums[i] + nums[j] == target) {
                    return [i, j]
                }
            }
        }
        return [0,0]
    }
}
//hash map
class Solution2 {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        let lengthOfNums = nums.count
        var hashmap = Dictionary<Int, Int>()
        for i in 0..<lengthOfNums {
            let matchNum = target - nums[i]
            if let j = hashmap[matchNum] {
                return [j, i]
            } else {
                hashmap[nums[i]] = i
            }
        }
        return [0, 0]
    }
}
let nums: [Int] = [3,2,4]
let target: Int = 6
let result1: [Int] = Solution1().twoSum(nums, target)
let result2: [Int] = Solution2().twoSum(nums, target)
print(result1)
print(result2)
