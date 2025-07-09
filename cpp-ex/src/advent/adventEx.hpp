#pragma once

using adventExPtr = int(*)();

namespace ad_ex
{
    int ex_0();

    adventExPtr getEx( int );
}