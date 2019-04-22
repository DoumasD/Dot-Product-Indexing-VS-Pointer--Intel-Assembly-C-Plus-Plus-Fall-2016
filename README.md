# Demetrios Doumas Fall 2016

# Project Name: Performance between Indexing and Pointer Arithmetic implementations of Dot product. Take home test 3 Assignment, computer organization class.

# Description:

Determine which implementation of Dot Product is faster, using pointer or indexing. I created two separate projects. The first project consisted of two C++ files, where one is the main file and the other is a function that does the dot product using indexing implementation. The latter project uses the pointer implementation. It was required to get the assembly code listing for each function in both projects and run them with their main C++ file. Then optimize each assembly listing code. Finally, time the compiled vs optimized assembly code. In this repo, I attached my report. Please look through it for more information about this assignment. I am using this repo to demonstrate how to combine C++ and assembly languages. Also, to show that compilers don't always generate the most optimized assembly code. This can be seen in the report as well. There are more objectives to this assignment, however this repo is focusing on just the Dot Product implementation.

# Instructions:

Running Assembly code with C++:
1.) Use Visual Studio 2017. 
2.) Download the files from a folder and open them in a new project, empty project visual C++.
3.) Make sure to add MASM to your build by right clicking on the solution and going to build dependencies.
4.) Go to Build Customization and select MASM.
5.) Click the .asm file, and go to its properties.
6.) Under Configuration Properties\General; put No for Excluded From Build, put Yes for Content, and select Microsoft Macro Assembler.
7.) Build the solution.
8.) Click run.

Note: The files in DotProductIndex and DotProductPointer have only C++ files.

Generate Assembly Code:
1.) Right click properties of the project.
2.) Go to All Options from Configuration Properties under C/C++
3.) Look at option called Assembler Output and select Assembly-Only Listing (/FA)
4.) Click run.
5.) You should see the .asm file of the function in the debug folder within your project folder, which you can find by going to your Visual Studio 2017 workspace.

# Learned:

1.) Generated compiler assembly code from a function called Dot product in a separate file, written in C++.
2.) Know how to build projects with .asm files and C++ files.
3.) Optimized compiler assembly code. 
4.) Pointer implementation is faster, as expected.
