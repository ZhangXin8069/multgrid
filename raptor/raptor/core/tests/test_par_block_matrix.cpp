// Copyright (c) 2015-2017, RAPtor Developer Team
// License: Simplified BSD, http://opensource.org/licenses/BSD-2-Clause

#include "gtest/gtest.h"
#include "raptor/raptor.hpp"

using namespace raptor;

void compare_vals(CSRMatrix* A, BSRMatrix* B)
{
    A->sort();
    B->sort();
    int ctr = 0;
    for (int i = 0; i < B->n_rows; i++)
    {
        for (int k = 0; k < B->b_rows; k++)
        {
            for (int j = B->idx1[i]; j < B->idx1[i+1]; j++)
            {
                double* val = B->block_vals[j];
                for (int l = 0; l < B->b_cols; l++)
                {
                    if (fabs(val[(k*B->b_cols) + l]) > zero_tol)
                    {
                        ASSERT_NEAR(val[k*B->b_cols + l], A->vals[ctr++], 1e-10);
                    }
                }
            }
        }
    }

}

int main(int argc, char** argv)
{
    MPI_Init(&argc, &argv);
    ::testing::InitGoogleTest(&argc, argv);
    int temp=RUN_ALL_TESTS();
    MPI_Finalize();
    return temp;

} // end of main() //

TEST(ParBlockMatrixTest, TestsInCore)
{
    int rank, num_procs;
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &num_procs);

    setenv("PPN", "4", 1);

    // Form standard anisotropic matrix
    double eps = 0.001;
    double theta = M_PI / 8.0;
    int block_n = 2;
    std::vector<int> grid(2, num_procs*block_n);
    double* stencil = diffusion_stencil_2d(eps, theta);
    ParCSRMatrix* A = par_stencil_grid(stencil, grid.data(), 2);
    ParBSRMatrix* A_bsr = A->to_ParBSR(block_n, block_n);

    ParVector x(A->global_num_rows, A->local_num_rows);
    ParVector b(A->global_num_rows, A->local_num_rows);
    ParVector tmp(A->global_num_rows, A->local_num_rows);
    x.set_const_value(1.0);

    // Test Blocked Communication
    std::vector<double> std;
    std::vector<double> blocked;
    std = A->comm->communicate(x);
    blocked = A_bsr->comm->communicate(x, A_bsr->off_proc->b_cols);
    ASSERT_EQ(std.size(), blocked.size());
    int n = std.size();
    for (int i = 0; i < n; i++)
        ASSERT_NEAR(std[i], blocked[i], 1e-10);

    // Test Blocked SpMV
    A->mult(x, b);
    A_bsr->mult(x, tmp);
    for (int i = 0; i < A->local_num_rows; i++)
        ASSERT_NEAR(tmp[i], b[i], 1e-10);

    // Test Blocked Transpose Communication
    A->comm->communicate_T(*x.local.storage, *b.local.storage);
    A_bsr->comm->communicate_T(*x.local.storage, *tmp.local.storage, A_bsr->off_proc->b_cols);
    ASSERT_EQ(std.size(), blocked.size());
    for (int i = 0; i < n; i++)
        ASSERT_NEAR(b[i], tmp[i], 1e-10);

    // Test Blocked Transpose SpMV
    A->mult_T(x, b);
    A_bsr->mult_T(x, tmp);
    for (int i = 0; i < A->local_num_rows; i++)
        ASSERT_NEAR(tmp[i], b[i], 1e-10);

    // Test Blocked TAPSpMVs
    A->tap_comm = new TAPComm(A->partition, A->off_proc_column_map);
    A_bsr->tap_comm = new TAPComm(A_bsr->partition, A_bsr->off_proc_column_map);
    std = A->tap_comm->communicate(x);
    blocked = A_bsr->tap_comm->communicate(x, A_bsr->off_proc->b_cols);
    ASSERT_EQ(std.size(), blocked.size());

    A->tap_mult(x, b);
    A_bsr->tap_mult(x, tmp);
    for (int i = 0; i < A->local_num_rows; i++)
        ASSERT_NEAR(b[i], tmp[i], 1e-10);

    // Test Blocked Transpose TAPSpMVs
    A->tap_comm->communicate_T(*x.local.storage, *b.local.storage);
    A_bsr->comm->communicate_T(*x.local.storage, *tmp.local.storage, A_bsr->off_proc->b_cols);
    ASSERT_EQ(std.size(), blocked.size());
    for (int i = 0; i < n; i++)
        ASSERT_NEAR(b[i], tmp[i], 1e-10);

    // Test Blocked Transpose TAPSpMV
    A->tap_mult_T(x, b);
    A_bsr->tap_mult_T(x, tmp);
    for (int i = 0; i < A->local_num_rows; i++)
        ASSERT_NEAR(tmp[i], b[i], 1e-10);

    // Test Blocked Matrix Communication
    CSRMatrix* C = A->comm->communicate(A);
    BSRMatrix* C_bsr = (BSRMatrix*) A_bsr->comm->communicate(A_bsr);
    C->sort();
    C_bsr->sort();
    ASSERT_EQ(C->n_rows, C_bsr->n_rows * C_bsr->b_rows);
    compare_vals(C, C_bsr);
    delete C;
    delete C_bsr;

    delete A;
    delete A_bsr;

    setenv("PPN", "16", 1);


} // end of TEST(MatrixTest, TestsInCore) //
