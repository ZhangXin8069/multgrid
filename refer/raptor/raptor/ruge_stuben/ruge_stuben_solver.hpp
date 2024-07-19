// Copyright (c) 2015-2017, RAPtor Developer Team
// License: Simplified BSD, http://opensource.org/licenses/BSD-2-Clause
#ifndef RAPTOR_RUGE_STUBEN_SOLVER_HPP
#define RAPTOR_RUGE_STUBEN_SOLVER_HPP

#include "raptor/multilevel/multilevel.hpp"
#include "cf_splitting.hpp"
#include "interpolation.hpp"

namespace raptor
{
    class RugeStubenSolver : public Multilevel
    {
      public:
        RugeStubenSolver(double _strong_threshold = 0.0, coarsen_t _coarsen_type = RS, 
                interp_t _interp_type = Direct, strength_t _strength_type = Classical,
                relax_t _relax_type = SOR) 
            : Multilevel(_strong_threshold, _strength_type, _relax_type)
        {
            coarsen_type = _coarsen_type;
            interp_type = _interp_type;
            variables = NULL;
            num_variables = 1;
        }

        ~RugeStubenSolver()
        {

        }

        void setup(CSRMatrix *Af)
        {
            if (num_variables > 1 && variables == NULL) 
            {
                form_variable_list(Af, num_variables);
            }

            setup_helper(Af);

            delete[] variables;
            variables = NULL;
        }
       
        void form_variable_list(const CSRMatrix* A, const int num_var)
        {
            if (A->n_rows == 0 || num_var <= 1) return;

            variables = new int[A->n_rows];
            for (int i = 0; i < A->n_rows; i++)
            {
                variables[i] = i % num_var;
            }
        }

        void extend_hierarchy()
        {
            int level_ctr = levels.size() - 1;
            CSRMatrix* A = levels[level_ctr]->A;
            CSRMatrix* S;
            CSRMatrix* P = NULL;
            CSRMatrix* AP;
            CSCMatrix* P_csc;
            std::vector<int> states;

            // Form Strength Matrix
            S = A->strength(strength_type, strong_threshold, num_variables, variables);

            // Form Coarsening (CF Splitting)
            switch (coarsen_type)
            {
                case RS:
                    split_rs(S, states);
                    break;
                case CLJP:
                    split_cljp(S, states);
                    break;
                case Falgout:
                    split_rs(S, states);
                    break;
                case PMIS:
                    split_pmis(S, states);
                    break;
                case HMIS:
                    split_pmis(S, states);
                    break;
                default:
                    split_rs(S, states);
                    break;
            }
            
            // Form interpolation
            switch (interp_type)
            {
                case Direct:
                    P = direct_interpolation(A, S, states);
                    break;
                case ModClassical:
                    P = mod_classical_interpolation(A, S, states, num_variables, variables);
                    break;
                case Extended:
                    P = extended_interpolation(A, S, states, num_variables, variables);
                    break;
                default:
                    P = direct_interpolation(A, S, states);
                    break;
            }
            levels[level_ctr]->P = P;

            if (num_variables > 1)
            {
                int ctr = 0;
                for (int i = 0; i < A->n_rows; i++)
                {
                    if (states[i] == 1)
                    {
                        variables[ctr++] = variables[i];
                    }
                }
            }

            // Form coarse-grid operator
            levels.emplace_back(new Level());
            AP = A->mult(P);
            P_csc = P->to_CSC();
            A = AP->mult_T(P_csc);
            A->sort();
            A->move_diag();

            level_ctr++;
            levels[level_ctr]->A = A;
            levels[level_ctr]->x.resize(A->n_rows);
            levels[level_ctr]->b.resize(A->n_rows);
            levels[level_ctr]->tmp.resize(A->n_rows);
            levels[level_ctr]->P = NULL;

            delete AP;
            delete P_csc;
            delete S;
        }
    

        coarsen_t coarsen_type;
        interp_t interp_type;

        int num_variables;
        int* variables;

    };
}
   

#endif

