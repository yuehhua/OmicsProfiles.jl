@testset "io" begin
    data_path = joinpath(TEST_PATH, "data")
    mtx_filename = joinpath(data_path, "test.mtx")
    genes1 = OmicsProfiles.read_genes(joinpath(data_path, "genes.tsv"))
    cells1 = OmicsProfiles.read_cells(joinpath(data_path, "cells.tsv"))
    mtx = OmicsProfiles.read_mtx(mtx_filename)

    genes2 = OmicsProfiles.read_genes(joinpath(data_path, "genes.tsv.gz"))
    cells2 = OmicsProfiles.read_cells(joinpath(data_path, "cells.tsv.gz"))

    @test genes1 == genes2
    @test cells1 == cells2
    @test mtx == sparse(
        [5, 4, 1, 2, 6],
        [1, 5, 1, 4, 7],
        [1, 1, 1, 1, 1],
        11, 12
    )

    pbmc3k_path = SnowyOwl.Dataset.pbmc3k_folder()
    prof = OmicsProfiles.read_10x(pbmc3k_path, varindex=:ensembleid)
end
