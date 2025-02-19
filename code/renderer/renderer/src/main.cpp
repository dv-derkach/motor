#include <iostream>

int main()
{
#ifdef MOTOR_CONFIG_DEBUG
    std::cout << "Debug" << std::endl;
#else
    std::cout << "Release" << std::endl;
#endif
    return 0;
}
