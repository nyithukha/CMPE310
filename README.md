# Lab 5
## Navigation (If message "No such file or directory" appears)
cd 'Lab_5(NyiThuKha)'

## Part IA — Basic Assembly Output
### Compile
gcc -O0 -S -m32 helloworld.c

## Part IB — Optimized Assembly
### Compile
gcc -O4 -S -m32 helloworld.c -o helloworld_O4.s

## Part II — C vs C++ Hello World
### Compile C version
gcc -O0 -S helloworld.c -o helloworld_c.s
### Compile C++ version
g++ -O0 -S helloworldcpp.cpp -o helloworld_cpp.s
### Check line counts
wc -l helloworld_c.s helloworld_cpp.s
### Check file sizes
ls -l helloworld_c.s helloworld_cpp.s
### Find relevant C++ print code
grep -n "greet\|cout\|Hello\|main\|call" helloworld_cpp.s | head -40

## Part III — While Loop + Max Array
### Compile
gcc -O0 -S whileloop.c -o whileloop.s
