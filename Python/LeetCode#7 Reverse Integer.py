# Given a 32-bit signed integer, reverse digits of an integer.
# # Example 1:
# # Input: 123
# Output:  321
# # Example 2:
# # Input: -123
# Output: -321
# # Example 3:
# # Input: 120
# Output: 21
# # Note:
# Assume we are dealing with an environment which could only hold integers within the 32-bit signed integer range.
# For the purpose of this problem, assume that your function returns 0 when the reversed integer overflows.

class Solution(object):
    def reverse(self, x):
        """
        :type x: int
        :rtype: int
        """
        x_max=2**31
        x_min=-2**31
        if x<0:
            y=-1*int(str(0-x)[::-1])
        else:
            y=int(str(x)[::-1])
        if y >= x_max or y <= x_min:
            y = 0
        return y