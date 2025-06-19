# import pygame
import sys
import helpers.utils as UT_FUNC

if( len(sys.argv) < 2 ):
    print('Usage: python3 main.py <example_number>')
    exit(1)

num = int(sys.argv[1] )
fun2Exe = UT_FUNC.getFunc2Execute( num )

if( fun2Exe == None ):
    print('That example Number does not exist')
    exit(1)

fun2Exe()