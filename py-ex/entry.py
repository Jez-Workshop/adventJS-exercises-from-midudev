import sys
from dotenv import load_dotenv

# from examples.ex_0 import ex_0
from helpers.getExample import getExample

def main():

    if( len(sys.argv) < 3 ):
        print('Usage: python3 main.py <example_number>')
        exit(1)

    value = int(sys.argv[1])
    func = getExample( value )

    if( func == None ):
        print('Invalid Example Number')
        exit(1)

    load_dotenv(dotenv_path="../.env")
    func( sys.argv[2] )