#!/usr/bin/eng python 3

import argparse

def parse_args():
# make an object of class ArgumentParser.
    parser = argparse.ArgumentParser(prog="addten", description="Add 10 to a number")
# so you run like python3 script.py --number=3
    parser.add_argument("--number", help="number to add 10 to", type=int, required=True)
    args = vars(parser.parse_args())
    return args

# The main() function in Python is the starting point of a program.
# called main is due to a convention borrowed from other
#  languages like C, where execution of a program begins
#  from a function named main.

def main():
    args = parse_args()
    x = args["number"]
    print(x+  10)


# a common Python idiom. __name__ is a special variable that's 
# set to "__main__" when the script is run directly (not imported as a module)
if __name__ == "__main__":
    main()