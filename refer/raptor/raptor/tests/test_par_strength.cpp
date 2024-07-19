// EXPECT_EQ and ASSERT_EQ are macros
// EXPECT_EQ test execution and continues even if there is a failure
// ASSERT_EQ test execution and aborts if there is a failure
// The ASSERT_* variants abort the program execution if an assertion fails 
// while EXPECT_* variants continue with the run.


#include "gtest/gtest.h"
#include "raptor/raptor.hpp"
#include "par_compare.hpp"

using namespace raptor;

int main(int argc, char** argv)
{
    MPI_Init(&argc, &argv);
    ::testing::InitGoogleTest(&argc, argv);
    int temp=RUN_ALL_TESTS();
    MPI_Finalize();
    return temp;
} // end of main() //

TEST(ParStrengthTest, TestsInTests)
{
    int rank, num_procs;
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &num_procs);

    ParCSRMatrix* A;
    ParCSRMatrix* S;
    ParCSRMatrix* S_rap;

    const char* A0_fn = "../../../test_data/aniso.pm";
    const char* S0_fn = "../../../test_data/aniso_S.pm";
    const char* SS0_fn = "../../../test_data/aniso_SS.pm";
    const char* A1_fn = "../../../test_data/laplacian.pm";
    const char* S1_fn = "../../../test_data/laplacian_S.pm";
    const char* SS1_fn = "../../../test_data/laplacian_SS.pm";

    A = readParMatrix(A0_fn);
    S = readParMatrix(S0_fn);
    S_rap = A->strength(Classical, 0.25);
    remove_empty_cols(S_rap);
    compare_pattern(S, S_rap);
    delete A;
    delete S;
    delete S_rap;

    A = readParMatrix(A1_fn);
    S = readParMatrix(S1_fn);
    S_rap = A->strength(Classical, 0.25);
    remove_empty_cols(S_rap);
    compare_pattern(S, S_rap);
    delete A;
    delete S;
    delete S_rap;


    A = readParMatrix(A0_fn);
    S = readParMatrix(SS0_fn);
    S_rap = A->strength(Symmetric, 0.25);
    remove_empty_cols(S_rap);
    compare_pattern(S, S_rap);
    delete A;
    delete S;
    delete S_rap;

    A = readParMatrix(A1_fn);
    S = readParMatrix(SS1_fn);
    S_rap = A->strength(Symmetric, 0.25);
    remove_empty_cols(S_rap);
    compare_pattern(S, S_rap);
    delete A;
    delete S;
    delete S_rap;

} // end of  TEST(ParStrengthTest, TestsInTests) //
