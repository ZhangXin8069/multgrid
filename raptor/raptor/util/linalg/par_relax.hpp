// Copyright (c) 2015-2017, RAPtor Developer Team
// License: Simplified BSD, http://opensource.org/licenses/BSD-2-Clause
#ifndef RAPTOR_UTILS_LINALG_RELAX_H
#define RAPTOR_UTILS_LINALG_RELAX_H

#include <mpi.h>
#include <float.h>

#include "raptor/core/par_vector.hpp"
#include "raptor/core/par_matrix.hpp"
#include "raptor/multilevel/par_level.hpp"

namespace raptor {

void jacobi(ParCSRMatrix* A, ParVector& x, ParVector& b, ParVector& tmp, 
        int num_sweeps = 1, double omega = 1.0, bool tap = false);
void sor(ParCSRMatrix* A, ParVector& x, ParVector& b, ParVector& tmp, 
        int num_sweeps = 1, double omega = 1.0, bool tap = false);
void ssor(ParCSRMatrix* A, ParVector& x, ParVector& b, ParVector& tmp, 
        int num_sweeps = 1, double omega = 1.0, bool tap = false);

}

#endif
