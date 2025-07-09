#include "adventEx.hpp"

adventExPtr ad_ex::getEx( int exId ){

    switch (exId)
    {
    case 0: return ad_ex::ex_0;

    default:
        return nullptr;
    }

}