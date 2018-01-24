# Given a roman numeral, convert it to an integer.
# Input is guaranteed to be within the range from 1 to 3999.
# 3999 = MMMCMXCIII
# M: 1000; D:500; C: 100; L:50; X:10; V:5; I:1
class Solution(object):
    def romanToInt(self, s):
        """
        :type s: str
        :rtype: int
        """
        dict = {"M": 1000, "D":500, "C": 100, "L":50, "X":10, "V":5, "I":1}
        sum = 0
        s = s[::-1]
        last = None
        for i in s:
            if last  and dict[i] < last:
                sum - = 2 * dict[i]
            sum + = dict[i]
            last = dict[i]
        return sum