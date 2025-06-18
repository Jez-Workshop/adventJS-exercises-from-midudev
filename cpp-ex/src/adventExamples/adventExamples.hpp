#pragma once

using AdventEx_Ptr2Func = int (*)();

// Inside this namespace write all headers for examples
namespace ad_ex
{
    int ex_0();


   AdventEx_Ptr2Func getExample2Execute( int );
}
