all: eob_Common.so, eob_Test_Common

eob_Common.so: c_dummy.o
	g++ -shared -o eob_Common.so c_dummy.o

c_dummy.o: c_dummy.cpp
	g++ -c -fPIC -o c_dummy.o c_dummy.cpp

eob_Test_Common: test_c_dummy.o
	g++ -o eob_Test_Common test_c_dummy.o

test_c_dummy.o: test_c_dummy.cpp
	g++ -c -fPIC -o test_c_dummy.o test_c_dummy.cpp