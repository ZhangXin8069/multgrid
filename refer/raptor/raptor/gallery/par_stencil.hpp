// Copyright (c) 2015-2017, RAPtor Developer Team
// License: Simplified BSD, http://opensource.org/licenses/BSD-2-Clause

#ifndef PARSTENCIL_HPP
#define PARSTENCIL_HPP

#include <float.h>
#include <cmath>
#include <stdlib.h>

#include "raptor/core/types.hpp"
#include "raptor/core/par_matrix.hpp"

namespace raptor {

ParCSRMatrix* par_stencil_grid(data_t* stencil, int* grid, int dim);

}
#endif
