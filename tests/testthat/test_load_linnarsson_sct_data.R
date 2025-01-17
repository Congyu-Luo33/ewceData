# test load.linnarsson.sct.data
test_that("loading of linnarsson dataset", {
    # from vignette
    #increase timeout time so doesn't fail
    options(timeout=1000)
    download.file("https://goo.gl/r5Y24y",
        destfile = "expression_mRNA_17-Aug-2014.txt"
    )

    path <- "expression_mRNA_17-Aug-2014.txt"

    cortex_mrna_load <- ewceData::load.linnarsson.sct.data(path)

    # remove folder once tested
    unlink("expression_mRNA_17-Aug-2014.txt")

    # fail if data didn't load correctly
    expect_equal(
        all(
            length(cortex_mrna_load) == 2,
            # class(cortex_mrna_load$exp)[1] =="matrix",
            is(cortex_mrna_load$exp)[1] == "matrix",
            nrow(cortex_mrna_load$exp) > 1,
            is(cortex_mrna_load$annot)[1] == "data.frame",
            nrow(cortex_mrna_load$annot) > 1
        ),
        TRUE
    )
})
