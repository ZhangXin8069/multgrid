// Copyright (c) 2015-2017, RAPtor Developer Team
// License: Simplified BSD, http://opensource.org/licenses/BSD-2-Clause

#include <iostream>
#include <fstream>

#include "gtest/gtest.h"

#include "raptor/raptor.hpp"
#include "raptor/tests/compare.hpp"


using namespace raptor;

int main(int argc, char** argv)
{
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
} // end of main() //

TEST(TestInterpolation, TestsInRuge_Stuben)
{ 
    CSRMatrix* A;
    CSRMatrix* S;
    CSRMatrix* P;
    CSRMatrix* P_rap;
    std::vector<int> splitting;
    FILE* f;
    int n_items_read;

    const char* Aniso_fn = "../../../../test_data/aniso.pm";
    const char* Aniso_S_fn = "../../../../test_data/aniso_S.pm";
    const char* Aniso_split_fn = "../../../../test_data/aniso_split.txt";
    const char* Aniso_P_d_fn = "../../../../test_data/aniso_P_direct.pm";
    const char* Aniso_P_mc_fn = "../../../../test_data/aniso_P_mod_class.pm";
    const char* Aniso_P_e_fn = "../../../../test_data/aniso_P_extend.pm";
    const char* Laplacian_fn = "../../../../test_data/laplacian.pm";
    const char* Laplacian_S_fn = "../../../../test_data/laplacian_S.pm";
    const char* Laplacian_split_fn = "../../../../test_data/laplacian_split.txt";
    const char* Laplacian_P_d_fn = "../../../../test_data/laplacian_P_direct.pm";
    const char* Laplacian_P_mc_fn = "../../../../test_data/laplacian_P_mod_class.pm";
    const char* Laplacian_P_e_fn = "../../../../test_data/laplacian_P_extend.pm";

    // Test Anisotropic
    A = readMatrix(Aniso_fn);
    S = readMatrix(Aniso_S_fn);
    splitting.resize(A->n_rows);
    f = fopen(Aniso_split_fn, "r");
    for (int i = 0; i < A->n_rows; i++)
    {
        n_items_read = fscanf(f, "%d\n", &splitting[i]);
        ASSERT_EQ(n_items_read, 1);
    }
    fclose(f);

    // Direct Interpolation
    P = readMatrix(Aniso_P_d_fn);
    P_rap = direct_interpolation(A, S, splitting);
    compare(P, P_rap);
    delete P_rap;
    delete P;

    // ModClassical Interpolation
    P = readMatrix(Aniso_P_mc_fn);
    P_rap = mod_classical_interpolation(A, S, splitting);
    compare(P, P_rap);
    delete P_rap;
    delete P;

    // Extended Interpolation
    P = readMatrix(Aniso_P_e_fn);
    P_rap = extended_interpolation(A, S, splitting);
    compare(P, P_rap);
    delete P_rap;
    delete P;

    delete S;
    delete A;

    // Test Laplacian
    A = readMatrix(Laplacian_fn);
    S = readMatrix(Laplacian_S_fn);
    splitting.resize(A->n_rows);
    f = fopen(Laplacian_split_fn, "r");
    for (int i = 0; i < A->n_rows; i++)
    {
        n_items_read = fscanf(f, "%d\n", &splitting[i]);
        ASSERT_EQ(n_items_read, 1);
    }
    fclose(f);

    // Direct Interpolation
    P = readMatrix(Laplacian_P_d_fn);
    P_rap = direct_interpolation(A, S, splitting);
    compare(P, P_rap);
    delete P_rap;
    delete P;

    // ModClassical Interpolation
    P = readMatrix(Laplacian_P_mc_fn);
    P_rap = mod_classical_interpolation(A, S, splitting);
    compare(P, P_rap);
    delete P_rap;
    delete P;

    // Extended Interpolation
    P = readMatrix(Laplacian_P_e_fn);
    P_rap = extended_interpolation(A, S, splitting);
    compare(P, P_rap);
    delete P_rap;
    delete P;

    delete S;
    delete A;

} // end of TEST(TestInterpolation, TestsInRuge_Stuben) //

