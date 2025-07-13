from typing import Callable
from examples.ex_0 import ex_0

Func2Ex = Callable[ [], None ]

def getExample( value: int ) -> Func2Ex | None :
    if( value == 0 ): return ex_0
    # elif( value == 1 ) return ex_1
    else: None