// Copyright (c) 2015, Raptor Developer Team, University of Illinois at Urbana-Champaign
// License: Simplified BSD, http://opensource.org/licenses/BSD-2-Clause
#ifndef RAPTOR_AGGREGATION_PAR_MIS_HPP
#define RAPTOR_AGGREGATION_PAR_MIS_HPP

#include "raptor/core/types.hpp"
#include "raptor/core/par_matrix.hpp"

namespace raptor {

int mis2(const ParCSRMatrix* A, std::vector<int>& states, 
        std::vector<int>& off_proc_states, bool tap_comm = false, 
        double* rand_vals = NULL);

}
#endif
