# import one function:
from functions import add_two

# Import whole module/script
import functions as myfxns
#then preface every function:
#myfxns.add_two()

# import tokenize: 
    # imports the entire pyparsing module into your program. use the pyparsing. prefix.
    # better practice because module is explicit, and prevents naming conflicts.
# from tokenize import *: 
    # imports all of the objects defined in the pyparsing module directly into 
    # your program's namespace. no need to use the pyparsing. prefix.


from functions import *
#bad practice; obscures where functions come from

