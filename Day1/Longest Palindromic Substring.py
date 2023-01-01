class Solution:

    def checkPalindrome(self, s:str) -> str:
        return s == s[::-1]

    def longestPalindrome(self, s: str) -> str:
        str_len = len(s)
        if self.checkPalindrome(s):
            return(s)
        else:    
            test = ""
            for i in reversed(range(1, str_len)):
                # print("i: ",i)
                steps = str_len - i + 1
                # print("steps: ", steps)
                for j in range(1,(steps//2)+1):
                    test = s[j-1:i+j-1]
                    # print("string_front: ",test)
                    if self.checkPalindrome(test):
                        return(test)
                    test = s[str_len-j+1-i:str_len-j+1]
                    # print("string_back: ",test)
                    if self.checkPalindrome(test):
                        return(test)
                if (str_len - i + 1) % 2 != 0 :
                    test = s[(steps//2):i+(steps//2)]
                    # print("string_extra: ",test)
                    if self.checkPalindrome(test):
                        return(test)

s = input("Enter a string: ")
print("The longest Palindrome Substring is:", Solution().longestPalindrome(s))