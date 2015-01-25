# ---- parent function -----------------------------------------------
# function that returns a function that constructs a function
# that has a static variable
fparent <- function() {
    statvar <- 12
    fconstructor <- function() {
        func <- function(...) {
            getstatv <- function() statvar
            setstatv <- function(x) statvar <<- x
            # your useful code that uses the static variable
            # goes here
            func <- function(...) ...
            list(
                getstatv = getstatv, 
                setstatv = setstatv,
                func = func
            )
        }
    }
}

# ---- the function to use -------------------------------------------  
myfunc <- fparent()()()

# ---- class with static variable  -----------------------------------
classEnv <- function() {
    staticv <- 12
    constructorEnv <- function(x) {
        instancev <- 42
        instance_input_param <- x
        getstaticv <- function() staticv
        setstaticv <- function(x) staticv <<- x
        getinstancev <- function() instancev
        setinstancev <- function(x) intstancev <<- x
        getinputv <- function() instance_input_param
        return(list(
            getstatv = getstaticv,
            setstatv = setstaticv,
            getinstv = getinstancev,
            setinstv = setinstancev,
            getinpv  = get
        )
        )
    }
}

# ---- class ---------------------------------------------------------
construct_my_object <- classEnv()

# ---- obj_instance1 -------------------------------------------------
obj_instance1 <- construct_my_object("obj1")

# ---- obj_instance2 -------------------------------------------------
obj_instance2 <- construct_my_object("obj2")

# ---- working directory ---------------------------------------------
getwd()

