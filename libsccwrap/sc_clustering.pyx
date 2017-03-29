cimport cython
import numpy as np
cimport numpy as np

from libc.stdint cimport uint8_t, uint16_t, uint32_t
from libc.stdint cimport int64_t, uint64_t
from libc.stdlib cimport malloc, free
from cpython.ref cimport PyObject
from cpython.object cimport PyObject
from cpython.type cimport type

import __builtin__
np.import_array()

cdef extern from "scclust.h":
    cdef struct scc_DataSet
    cdef struct scc_ErrorCode
    cdef struct scc_Clustering
    ctypedef int scc_Clabel
    cdef struct scc_ClusterOptions

    scc_ErrorCode scc_init_data_set(uint64_t num_data_points,
                                    uint32_t num_dimensions,
                                    size_t len_data_matrix,
                                    const double data_matrix[],
                                    scc_DataSet** out_data_set)

    scc_ErrorCode scc_init_empty_clustering(uint64_t num_data_points,
                                            scc_Clabel external_cluster_labels[],
                                            scc_Clustering** out_clustering)

    scc_ClusterOptions scc_get_default_options()

    scc_ErrorCode scc_sc_clustering(void* data_set,
                                    const scc_ClusterOptions* options,
                                    scc_Clustering* out_clustering)

    void scc_free_clustering(scc_Clustering** clustering)

    void scc_free_data_set(scc_DataSet** data_set)


@cython.wraparound(False)
@cython.boundscheck(False)
def sccw_sc_clustering(np.ndarray[np.npy_double, ndim=2] in_array):

    cdef uint64_t num_data_points = in_array.shape[0]
    cdef uint32_t num_dimensions = in_array.shape[1]

    #cdef np.ndarray[np.npy_int, ndim=1] cluster_labels = np.empty([num_data_points], np.int)
    cluster_labels = np.empty([num_data_points], np.int)

    for x in range(num_data_points):
        cluster_labels[x] = x + 10

    return cluster_labels
