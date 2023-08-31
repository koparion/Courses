# challenge: reversing a string using stack

import stack

string = "gninraeL nIdeknil htiw tol a nraeL"
reversed_string = ""
s = stack.Stack()

# solution below

for character in string:
    s.push(character) # adding characters to stack
    
print(s) # displaying stack

while not s.is_empty():
    reversed_string += s.pop()

print(reversed_string)

