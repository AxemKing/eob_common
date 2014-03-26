#include "gtest/gtest.h"
#include "c_dummy.h"

namespace EOB
{
	namespace Test
	{
		TEST(DUMMY, CAN_BE_CREATED)
		{
			DummyClass l_dummy;
		}

		TEST(DUMMY, CAN_MATH)
		{
			DummyClass l_dummy;
			EXPECT_EQ(9, l_dummy.Add(5, 4));
		}
	}
}