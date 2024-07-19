#include "external/mfem_wrapper.hpp"

using namespace mfem;

// Create MFEM Laplacian System and convert to RAPtor format
raptor::ParCSRMatrix* mfem_laplacian(raptor::ParVector& x_raptor, 
        raptor::ParVector& b_raptor, const char* mesh_file, 
        const int order, const int seq_n_refines, const int par_n_refines,
        const RAPtor_MPI_Comm comm)
{
    int rank, num_procs;
    RAPtor_MPI_Comm_rank(comm, &rank);
    RAPtor_MPI_Comm_size(comm, &num_procs);

    int mesh_dim;
    int par_mesh_n;
    int boundary_n;

    Mesh* mesh;
    ParMesh* par_mesh;
    FiniteElementCollection* collection;
    ParFiniteElementSpace* space;

    mesh = new Mesh(mesh_file, 1, 1);
    mesh_dim = mesh->Dimension();

    // Uniform refinement on serial mesh
    for (int i = 0; i < seq_n_refines; i++)
    {
        mesh->UniformRefinement();
    }

    // Uniform refinement on parallel mesh
    par_mesh = new ParMesh(comm, *mesh);
    delete mesh;
    for (int i = 0; i < par_n_refines; i++)
    {
        par_mesh->UniformRefinement();
    }

    // Get dims
    par_mesh_n = par_mesh->attributes.Max();
    boundary_n = par_mesh->bdr_attributes.Max();

    // Form finite element collection / space
    collection = new H1_FECollection(order, mesh_dim);
    space = new ParFiniteElementSpace(par_mesh, collection);

    Array<int> dofs;
    if (par_mesh->bdr_attributes.Size())
    {
        Array<int> bdry(boundary_n);
        bdry = 1;
        space->GetEssentialTrueDofs(bdry, dofs);
    }

    ParLinearForm *b = new ParLinearForm(space);
    ConstantCoefficient one(1.0);
    b->AddDomainIntegrator(new DomainLFIntegrator(one));
    b->Assemble();

    ParGridFunction x(space);
    x = 0.0;

    ParBilinearForm *a = new ParBilinearForm(space);
    a->AddDomainIntegrator(new DiffusionIntegrator(one));
    a->Assemble();

    HypreParMatrix A;
    mfem::Vector B, X;
    a->FormLinearSystem(dofs, x, *b, A, X, B);
    A.SetOwnerFlags(-1, -1, -1);
    hypre_ParCSRMatrix* A_hypre = A.StealData();

    raptor::ParCSRMatrix* A_raptor = convert(A_hypre, comm);
    x_raptor.resize(A_raptor->global_num_rows, A_raptor->local_num_rows);
    b_raptor.resize(A_raptor->global_num_rows, A_raptor->local_num_rows);
    double* x_data = X.GetData();
    double* b_data = B.GetData();
    for (int i = 0; i < A_raptor->local_num_rows; i++)
    {
        x_raptor[i] = x_data[i];
        b_raptor[i] = b_data[i];
    }

    delete a;
    delete b;
    delete space;
    delete collection;
    delete par_mesh;

    return A_raptor;
}
