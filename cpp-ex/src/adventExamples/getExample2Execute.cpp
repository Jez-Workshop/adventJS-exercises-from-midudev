#include "adventExamples.hpp"

AdventEx_Ptr2Func ad_ex::getExample2Execute(int id) {
    switch (id) {
        case 0: return ex_0;
        default: return nullptr;
    }
}