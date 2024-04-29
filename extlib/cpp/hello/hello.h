#pragma once
/*
 * A Hello class instance can say hello and goodbye.
 * Note the __declspec(dllexport) directive. This is required so that the library
 * exports the class interfaces. Without this you will not be able to link to the
 * library. Notably it won't produce a hello.lib file, but only the dll.
 */
class __declspec(dllexport) Hello
{
	public:
		void sayHello(void);
		void sayGoodbye(void);
};
