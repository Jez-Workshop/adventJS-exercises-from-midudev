from typing import Callable
from examples.ex_0 import ex_0

Func2Ex = Callable[ [str], None ]

def getExample( value: int ) -> Func2Ex | None :
    if( value == 0 ): return ex_0
    else: None
