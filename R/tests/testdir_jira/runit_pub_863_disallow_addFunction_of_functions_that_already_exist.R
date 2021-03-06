setwd(normalizePath(dirname(R.utils::commandArgs(asValues=TRUE)$"f")))
source('../findNSourceUtils.R')

test.pub_863_disallow_addFunction_of_functions_that_already_exist <- function(localH2O) {

covtype.hex <- h2o.importFile(localH2O, normalizePath(locate("smalldata/covtype/covtype.20k.data")), "cov")

covtype.local = as.data.frame(covtype.hex)

# Are we in the right universe?
expect_equal(20000, dim(covtype.local)[1])
expect_equal(55, dim(covtype.local)[2])

###########################################################
# execs
###########################################################

fun = function(x) { mean( x[,2]) }
expect_error(h2o.addFunction(object = localH2O, fun = fun, name = "mean" ))

testEnd()

}

doTest("PUB-863 disallow addFunction of functions that already exist.", test.pub_863_disallow_addFunction_of_functions_that_already_exist)

