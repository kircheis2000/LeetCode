# Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid
# The brackets must close in the correct order, "()" and "()[]{}" are all valid but "(]" and "([)]" are not.

class Solution(object):
    def isValid(self, s):
        """
        :type s: str
        :rtype: bool
        """
        stack, lookup = [],{"(":")","{":"}","[":"]"}
        for parentheses in s:
            if parentheses in lookup:
                stack.append(parentheses)
            elif len(stack) == 0 or lookup[stack.pop()]!= parentheses:
                return False
        return len(stack) == 0