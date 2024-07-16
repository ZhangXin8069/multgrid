// Copyright (c) 2015, Raptor Developer Team, University of Illinois at Urbana-Champaign
// License: Simplified BSD, http://opensource.org/licenses/BSD-2-Clause
#include "cg.hpp"

namespace raptor {

void CG(CSRMatrix* A, Vector& x, Vector& b, std::vector<double>& res, double tol, int max_iter)
{
    Vector r;
    Vector p;
    Vector Ap;

    int iter, recompute_r;
    data_t alpha, beta;
    data_t rr_inner, next_inner, App_inner;
    double norm_r;

    if (max_iter <= 0)
    {
        max_iter = ((int)(1.3*b.size())) + 2;
    }

    // Fixed Constructors
    r.resize(b.size());
    p.resize(b.size());
    Ap.resize(b.size());

    // r0 = b - A * x0
    A->residual(x, b, r);

    // p0 = r0
    p.copy(r);

    // Find initial (r, r) and residual
    rr_inner = r.inner_product(r);
    norm_r = sqrt(rr_inner);
    res.emplace_back(norm_r);

    // Scale tolerance by norm_r
    if (norm_r != 0.0)
    {
        tol = tol * norm_r;
    }

    // How often should r be recomputed
    recompute_r = 8;
    iter = 0;

    // Main CG Loop
    while (norm_r > tol && iter < max_iter)
    {
        // alpha_i = (r_i, r_i) / (A*p_i, p_i)
        A->mult(p, Ap);
        App_inner = Ap.inner_product(p);
        if (App_inner < 0.0)
        {
            printf("Indefinite matrix detected in CG! Aborting...\n");
            exit(-1);
        }
        alpha = rr_inner / App_inner;

        x.axpy(p, alpha);

        // x_{i+1} = x_i + alpha_i * p_i
        if ((iter % recompute_r) && iter > 0)
        {
            r.axpy(Ap, -1.0*alpha);
        }
        else
        {
            A->residual(x, b, r);
        }

        // beta_i = (r_{i+1}, r_{i+1}) / (r_i, r_i)
        next_inner = r.inner_product(r);
        beta = next_inner / rr_inner;

        // p_{i+1} = r_{i+1} + beta_i * p_i
        p.scale(beta);
        p.axpy(r, 1.0);

        // Update next inner product
        rr_inner = next_inner;
        norm_r = sqrt(rr_inner);

        res.emplace_back(norm_r);

        iter++;
    }

    if (iter == max_iter)
    {
        printf("Max Iterations Reached.\n");
        printf("2 Norm of Residual: %lg\n\n", norm_r);
    }
    else
    {
        printf("%d Iteration required to converge\n", iter);
        printf("2 Norm of Residual: %lg\n\n", norm_r);
    }

    return;
}
}
