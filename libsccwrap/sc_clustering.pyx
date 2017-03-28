cimport cython
import numpy as np
cimport numpy as np

DTYPE = np.float
ctypedef np.float_t DTYPE_t

cdef extern from "libscclust/include/scclust.h":


cdef extern from "libscclust/src/error.h":
  scc_ErrorCode iscc_make_error__(scc_ErrorCode ec,
                                const char* msg,
                                const char* file,
                                int line)


  void iscc_reset_error(void)
