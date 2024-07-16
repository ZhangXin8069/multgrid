// Copyright (c) 2015-2017, RAPtor Developer Team
// License: Simplified BSD, http://opensource.org/licenses/BSD-2-Clause
#include <mpi.h>
#include <math.h>
#include <stdlib.h>
#include <assert.h>
#include <iostream>

#include "clear_cache.hpp"

#include "core/par_matrix.hpp"
#include "core/par_vector.hpp"
#include "core/types.hpp"
#include "gallery/par_stencil.hpp"
#include "gallery/laplacian27pt.hpp"
#include "gallery/diffusion.hpp"
#include "gallery/par_matrix_IO.hpp"

#ifdef USING_MFEM
#include "external/mfem_wrapper.hpp"
#endif

using namespace raptor;
int main(int argc, char *argv[])
{
    MPI_Init(&argc, &argv);
    int rank, num_procs;
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &num_procs);

    int dim=0;
    int n = 5;
    int system = 0;

    if (argc > 1)
    {
        system = atoi(argv[1]);
    }

    ParCSRMatrix* A=nullptr;

    double t0, tfinal;

    int cache_len = 10000;
    int num_tests = 2;

    std::vector<double> cache_array(cache_len);

    if (system < 2)
    {
        double* stencil = NULL;
        std::vector<int> grid;
        if (argc > 2)
        {
            n = atoi(argv[2]);
        }

        if (system == 0)
        {
            dim = 3;
            grid.resize(dim, n);
            stencil = laplace_stencil_27pt();
        }
        else if (system == 1)
        {
            dim = 2;
            grid.resize(dim, n);
            double eps = 0.001;
            double theta = M_PI/8.0;
            if (argc > 3)
            {
                eps = atof(argv[3]);
                if (argc > 4)
                {
                    theta = atof(argv[4]);
                }
            }
            stencil = diffusion_stencil_2d(eps, theta);
        }
        A = par_stencil_grid(stencil, grid.data(), dim);
        delete[] stencil;
    }
#ifdef USING_MFEM
    else if (system == 2)
    {
        char* mesh_file = argv[2];
        int num_elements = 2;
        int order = 3;
        if (argc > 3)
        {
            num_elements = atoi(argv[3]);
            if (argc > 4)
            {
                order = atoi(argv[4]);
            }
        }
        ParVector x;
        ParVector b;
        int num_variables = 1;
        A = mfem_linear_elasticity(x, b, &num_variables, mesh_file, num_elements, order);
    }
#endif
    else if (system == 3)
    {
        const char* file = "../../test_data/rss_A0.pm";

        if (argc > 2)
        {
            file = argv[2];




        }
        A = readParMatrix(file);
    }

    for (int i = 0; i < num_tests; i++)
    {
        clear_cache(cache_array);
        MPI_Barrier(MPI_COMM_WORLD);
        t0 = MPI_Wtime();
        ParCSRMatrix* A2 = A->mult(A);
        tfinal = MPI_Wtime() - t0;
        delete A2;

        MPI_Reduce(&tfinal, &t0, 1, MPI_DOUBLE, MPI_MAX, 0, MPI_COMM_WORLD);
        if (rank == 0) printf("Test %d Max A^2 Time: %e\n", i, t0);
    }

    delete A;

    MPI_Finalize();

    return 0;
}


