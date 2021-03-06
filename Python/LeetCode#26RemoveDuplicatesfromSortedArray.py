#Given a sorted array, remove the duplicates in-place such that each element appear only once
# and return the new length.
# Do not allocate extra space for another array, you must do this by modifying the input array
# in-place with O(1) extra memory.
# Example:
# Given nums = [1,1,2],
# Your function should return length = 2, with the first two elements of nums being 1 and
# 2 respectively.
# It doesn't matter what you leave beyond the new length.


class Solution(object):
    def removeDuplicates(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        if len(nums) == 0:
            return 0
        else:
            j = 0
            for i in range(len(nums)):
                if nums[i] != nums[j]:
                    nums[i], nums[j+1] = nums[j+1], nums[i]
                    j = j + 1
            return j + 1
