import re

# handy methods from https://www.dotnetperls.com/between-before-after-python
def before(value, a):
    # Find first part and return slice before it.
    pos_a = value.find(a)
    if pos_a == -1: 
        return ""
    return value[0:pos_a]
    
def after(value, a):
    # Find and validate first part.
    pos_a = value.find(a)
    if pos_a == -1: 
        return ""
    # Returns chars after the found string.
    adjusted_pos_a = pos_a + len(a)
    if adjusted_pos_a >= len(value): 
        return ""
    return value[adjusted_pos_a:]



def is_digits (str):

    match = re.search("\D", str)
    if not match:
        return True
    else:
        return False