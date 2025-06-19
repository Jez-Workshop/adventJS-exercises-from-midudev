import sys
from typing import Callable

import examples.ex_0 as ADVENT_EX

ExerciseFunction = Callable[[], None]

def getFunc2Execute( num: int ) -> ExerciseFunction | None:

    if ( num == 0 ): return ADVENT_EX.example_0
    # elif ( num == 1 ) : return 
    else: None
    