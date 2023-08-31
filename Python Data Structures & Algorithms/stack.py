class Stack:
    def __init__(self): # constructor
        self.items  = [] # empty list
    
    def is_empty(self):
       # return len(self.items) == 0 # checking if returns empty
        return not self.items # returns false when list is empty
    
    def push(self, item):
        self.items.append(item)
    
    def pop(self):
        return self.items.pop()
    
    def peek(self):
        return self.items[-1] # returns last item
    
    def size(self):
        return len(self.items)
    
    def __str__(self): # enables print statement
        return str(self.items)


if __name__ == "__main__":
    s = Stack() # instance variable s calling stack function
    s.push(1)
    s.push(3)
    s.push(5)
    print(s)
    print("empty? ", s.is_empty())
    print("last item ", s.peek())
    print("size ", s.size())
