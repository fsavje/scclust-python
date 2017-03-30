cimport cython
cimport scclust_dec

import numpy as np
cimport numpy as np

from libc.stdint cimport int64_t, uint64_t, uint32_t
from libc.stdlib cimport malloc, free

import __builtin__
np.import_array()

@cython.wraparound(False)
@cython.boundscheck(False)
def sc_clustering(np.ndarray[np.npy_double, ndim=2] in_array):

    cdef uint64_t num_data_points = in_array.shape[0]
    cdef uint32_t num_dimensions = in_array.shape[1]

    #cdef np.ndarray[np.npy_int, ndim=1] cluster_labels = np.empty([num_data_points], np.int)
    cluster_labels = np.empty([num_data_points], np.int)

    for x in range(num_data_points):
        cluster_labels[x] = x + 10

    return cluster_labels
