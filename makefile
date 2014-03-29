all: eob_Common.a eob_Test_Common.txt

GTEST_INCLUDE_PATH=../gtest/include/
GTEST_LIB_PATH=../gtest/

eob_Test_Common.txt: eob_Test_Common
	./eob_Test_Common > eob_Test_Common.txt

eob_Test_Common: eob_Common.a test_c_main.o test_c_dummy.o
	g++ -o eob_Test_Common test_c_main.o test_c_dummy.o eob_Common.a $(GTEST_LIB_PATH)libgtest.a -lpthread

test_c_main.o: test_c_main.cpp
	g++ -I$(GTEST_INCLUDE_PATH) -c -fPIC -o test_c_main.o test_c_main.cpp

test_c_dummy.o: test_c_dummy.cpp
	g++ -I$(GTEST_INCLUDE_PATH) -c -fPIC -o test_c_dummy.o test_c_dummy.cpp

eob_Common.a: c_dummy.o
	ar rcs eob_Common.a c_dummy.o

c_dummy.o: c_dummy.cpp
	g++ -c -fPIC -o c_dummy.o c_dummy.cpp

clean:
	rm *.o
	rm eob_Common.a
	rm eob_Test_Common