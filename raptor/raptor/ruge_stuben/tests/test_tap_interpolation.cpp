// Copyright (c) 2015-2017, RAPtor Developer Team
// License: Simplified BSD, http://opensource.org/licenses/BSD-2-Clause
#include <iostream>
#include <fstream>

#include "gtest/gtest.h"

#include "raptor/raptor.hpp"
#include "raptor/tests/par_compare.hpp"

using namespace raptor;

// Define Private Methods
ParCSRMatrix* form_Prap(ParCSRMatrix* A, ParCSRMatrix* S, const char* filename, 
        int* first_row_ptr, int* first_col_ptr, int interp_option = 0);


ParCSRMatrix* form_Prap(ParCSRMatrix* A, ParCSRMatrix* S, const char* filename, 
        int* first_row_ptr, int* first_col_ptr, int interp_option)
{
    int rank, num_procs;
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &num_procs);

    int first_row, first_col;
    int n_items_read;
    FILE* f;
    ParCSRMatrix* P_rap = NULL;
    std::vector<int> proc_sizes(num_procs);
    std::vector<int> splitting;
    if (A->local_num_rows)
    {
        splitting.resize(A->local_num_rows);
    }
    MPI_Allgather(&A->local_num_rows, 1, MPI_INT, proc_sizes.data(), 1, MPI_INT,
            MPI_COMM_WORLD);
    first_row = 0;
    for (int i = 0; i < rank; i++)
    {
        first_row += proc_sizes[i];
    }
    f = fopen(filename, "r");
    int cf;
    for (int i = 0; i < first_row; i++)
    {
        n_items_read = fscanf(f, "%d\n", &cf);
        if (n_items_read == EOF) return NULL;
    }
    for (int i = 0; i < A->local_num_rows; i++)
    {
        n_items_read = fscanf(f, "%d\n", &splitting[i]);
        if (n_items_read == EOF) return NULL;
    }
    fclose(f);

    // Get off proc states
    S->comm->communicate(splitting.data());
    if (interp_option == 0)
    {
        P_rap = direct_interpolation(A, S, splitting, S->comm->recv_data->int_buffer);
    }
    else if (interp_option == 1)
    {
        P_rap = mod_classical_interpolation(A, S, splitting, S->comm->recv_data->int_buffer, true);
        return P_rap;
    }
    else if (interp_option == 2)
    {
        P_rap = extended_interpolation(A, S, splitting, S->comm->recv_data->int_buffer, 0.0, true);
    }
    MPI_Allgather(&P_rap->on_proc_num_cols, 1, MPI_INT, proc_sizes.data(), 1, 
                MPI_INT, MPI_COMM_WORLD);
    first_col = 0;
    for (int i = 0; i < rank; i++)
    {
        first_col += proc_sizes[i];
    }

    *first_row_ptr = first_row;
    *first_col_ptr = first_col;

    return P_rap;
}

int main(int argc, char** argv)
{
    MPI_Init(&argc, &argv);
    ::testing::InitGoogleTest(&argc, argv);
    int temp = RUN_ALL_TESTS();
    MPI_Finalize();
    return temp;
} // end of main() //


TEST(TestTAPInterpolation, TestsInRuge_Stuben)
{ 
    int rank, num_procs;
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &num_procs);

    setenv("PPN", "4", 1);

    int first_row, first_col;
    ParCSRMatrix* A;
    ParCSRMatrix* S;
    ParCSRMatrix* P;
    ParCSRMatrix* P_rap;

    const char* Aniso_fn = "../../../../test_data/aniso.pm";
    const char* Aniso_split_fn = "../../../../test_data/aniso_split.txt";
    const char* Aniso_P_d_fn = "../../../../test_data/aniso_P_direct.pm";
    const char* Aniso_P_mc_fn = "../../../../test_data/aniso_P_mod_class.pm";
    const char* Aniso_P_e_fn = "../../../../test_data/aniso_P_extend.pm";
    const char* Laplacian_fn = "../../../../test_data/laplacian.pm";
    const char* Laplacian_split_fn = "../../../../test_data/laplacian_split.txt";
    const char* Laplacian_P_d_fn = "../../../../test_data/laplacian_P_direct.pm";
    const char* Laplacian_P_mc_fn = "../../../../test_data/laplacian_P_mod_class.pm";
    const char* Laplacian_P_e_fn = "../../../../test_data/laplacian_P_extend.pm";

    // TEST LEVEL 0
    A = readParMatrix(Aniso_fn);
    A->init_tap_communicators();
    S = A->strength(Classical, 0.25);

    P_rap = form_Prap(A, S, Aniso_split_fn, &first_row, &first_col, 0);
    P = readParMatrix(Aniso_P_d_fn, P_rap->local_num_rows, P_rap->on_proc_num_cols, 
            first_row, first_col);
    compare(P, P_rap);
    delete P_rap;
    delete P;

    P_rap = form_Prap(A, S, Aniso_split_fn, &first_row, &first_col, 1);
    P = readParMatrix(Aniso_P_mc_fn, P_rap->local_num_rows, P_rap->on_proc_num_cols, 
            first_row, first_col);
    compare(P, P_rap);
    delete P;
    delete P_rap;

    P_rap = form_Prap(A, S, Aniso_split_fn, &first_row, &first_col, 2);
    P = readParMatrix(Aniso_P_e_fn, P_rap->local_num_rows, P_rap->on_proc_num_cols, 
            first_row, first_col);
    compare(P, P_rap);
    delete P;
    delete P_rap;

    delete S;
    delete A;

    // TEST LEVEL 1
    A = readParMatrix(Laplacian_fn);
    A->init_tap_communicators();
    S = A->strength(Classical, 0.25);

    P_rap = form_Prap(A, S, Laplacian_split_fn, &first_row, &first_col, 0);
    P = readParMatrix(Laplacian_P_d_fn, P_rap->local_num_rows, P_rap->on_proc_num_cols, 
            first_row, first_col);
    compare(P, P_rap);
    delete P_rap;
    delete P;

    P_rap = form_Prap(A, S, Laplacian_split_fn, &first_row, &first_col, 1);
    P = readParMatrix(Laplacian_P_mc_fn, P_rap->local_num_rows, P_rap->on_proc_num_cols, 
            first_row, first_col);
    compare(P, P_rap);
    delete P;
    delete P_rap;

    P_rap = form_Prap(A, S, Laplacian_split_fn, &first_row, &first_col, 2);
    P = readParMatrix(Laplacian_P_e_fn, P_rap->local_num_rows, P_rap->on_proc_num_cols, 
            first_row, first_col);
    compare(P, P_rap);
    delete P;
    delete P_rap;

    delete S;
    delete A;



    setenv("PPN", "16", 1);

} // end of TEST(TestParInterpolation, TestsInRuge_Stuben) //


