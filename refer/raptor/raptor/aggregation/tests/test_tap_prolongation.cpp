// Copyright (c) 2015-2017, RAPtor Developer Team
// License: Simplified BSD, http://opensource.org/licenses/BSD-2-Clause
#include <iostream>
#include <fstream>

#include "gtest/gtest.h"

#include "raptor/raptor.hpp"
#include "raptor/tests/par_compare.hpp"

using namespace raptor;

int main(int argc, char** argv)
{
    MPI_Init(&argc, &argv);
    ::testing::InitGoogleTest(&argc, argv);
    int temp = RUN_ALL_TESTS();
    MPI_Finalize();
    return temp;
} // end of main() //

TEST(TestTAPProlongation, TestsInAggregation)
{ 
    int rank, num_procs;
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &num_procs);

    setenv("PPN", "16", 1);

    std::vector<int> states;
    std::vector<int> off_proc_states;

    ParCSRMatrix* A;
    ParCSRMatrix* T;

    const char* A0_fn = "../../../../test_data/sas_A0.pm";
    const char* T0_fn = "../../../../test_data/sas_T0.pm";
    const char* P0_fn = "../../../../test_data/sas_P0.pm";

    A = readParMatrix(A0_fn);
    T = readParMatrix(T0_fn);

    ParCSRMatrix* P_py = readParMatrix(P0_fn);
    ParCSRMatrix* P = jacobi_prolongation(A, T, true);

    compare(P, P_py);

    setenv("PPN", "4", 1);

    delete P;
    delete P_py;
    delete A;
    delete T;

} // end of TEST(TestParSplitting, TestsInRuge_Stuben) //





