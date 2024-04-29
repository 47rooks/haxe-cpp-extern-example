#include <iostream>

#include "hello.h"

/*
 * This is the implementation of the Hello class methods defined in hello.h.
 *
 */
void Hello::sayHello()
{
    std::cout << "Hello saying \"Hello!\" \n";
}

void Hello::sayGoodbye()
{
    std::cout << "Hello saying \"Goodbye!\" " << std::endl;
}
