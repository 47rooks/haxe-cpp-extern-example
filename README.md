# Simple CPP Extern

Like the Hashlink extension, this is mostly notes for my own benefit. See the references section below for resources I used while getting this built.

My goal was to link to a DLL and in that so far at least I have failed. But I have now got a library statically linking to Haxe.

## Steps

   1. First create a project directory which will contain
      1. the C++ extension
         1. `<PROJECT_DIR>\extlib\cpp\`
      2. its Haxe wrapper module
         1. `<PROJECT_DIR>\extlib`
      3. the test code - in this code that is just a Main.hx to demo simple functions
         1. `<PROJECT_DIR>\src`
   2. Open up Visual Studio (the big one not VSCode) 
        For reference I am using Microsoft Visual Studio Community 2022 (64-bit) Version 17.0.4
      1. Create a new project
         1. File -> New Project...
         2. Select the Empty Project template and click Next
         3. Project Name: The name of the extension - here `hello`
         4. Location: the `<PROJECT_DIR>\extlib\cpp\` you created in the very first step above
         5. Solution: Create new solution
         6. Leave solution name blank
         7. Check "Place solution and project in the same directory"
         8. Hit Create
      2. In the Solution Explorer you should see the project (the VS project that is) directory.
         1. Right click on that and select Properties at the bottom of the context menu
            1. Make sure the Configuration Platform: is Active(x64).
            2. Under Configuration Properties
               1. Select the General tab, and
                  1. Make the Configuration Type `Dynamic Library (.dll)`
      3. In the Solution Explorer right click on the Source Files directory
         1. New Item...
         2. C++ File
         3. and name is whatever you like, here `hello.cpp`
      4. Follow reference [1] in creating the code you need.
      5. And then build the solution
         1. if all goes well you will have an hdll undex `\x64\Debug` in your VS project
   3. Now in the `extlib` directory
      2. Create a Haxe module in it like `Hello.hx`
   4. Now in the overall project directory create a
      1. build.hxml containing this, or similar
        ```
        -cp src
        -cp extlib
        -main Main
        -cpp export/cpp
        -D analyzer-optimize
        -dce full
        -D HXCPP_VERBOSE
        -D HXCPP_M64

        -cmd clear
        -cmd export/cpp/Main
        ```
      2. Main.hx
         1. This will contain the test code.


    Regarding the `build.hxml` above the following should be noted
       * extlib is added as a classpath so that the `Hello.hx` library wrapper class can be found
       * `-D HXCPP_VERBOSE` gets hxcpp compilation and linking debug which is very helpful sometimes. It may be omitted unless you are debugging
       * `-D HXCPP_M64` is required to generate 64 compilations on Windows. There are similar flags for other platforms.
       * Currently there is a compiler bug which does not correctly handle paths that have spaces in them. This means that the `-cmd` commands do not run and the build appears to fail if you have a path with a space in it in any `-I` flag. It does actually produce an executable though.
  
## References

My thanx those who created these.

[1] https://github.com/cambiata/haxe-cpp-basic-example

This simple example from which I took the names and functions did a direct extern without creating a library. I wanted a CPP DLL extern example so I derived other pieces from this example.

[2] https://github.com/Gaikov/HaxeWithCppIntegrationExample

This example was actually a bit complex for me to figure out the pieces I need to get a simple thing going. Having gotten my own example going this makes more sense but it uses a static link library. It's a library but not a DLL.