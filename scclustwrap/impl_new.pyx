@cython.wraparound(False)
@cython.boundscheck(False)
def tmp_sc_clustering(np.ndarray[np.double_t, ndim=2, mode="c"] data_array not None):

    cdef uint64_t num_data_points = data_array.shape[0]
    cdef uint32_t num_dimensions = data_array.shape[1]

    # Make cluster label array
    cdef np.ndarray[np.uint32_t, ndim=1, mode="c"] cluster_labels = np.empty([num_data_points], dtype=np.uint32, order='C')
    cdef sc.scc_ErrorCode ec
    cdef sc.scc_DataSet* data_set
    ec = sc.scc_init_data_set(num_data_points,
                              num_dimensions,
                              num_data_points * num_dimensions,
                              <const double*> &data_array[0,0],
                              &data_set);
    check_error_code(ec)

    cdef sc.scc_Clustering* clustering
    ec = sc.scc_init_empty_clustering(num_data_points,
                                      &cluster_labels[0],
                                      &clustering)
    check_error_code(ec)

    cdef sc.scc_ClusterOptions options = sc.scc_get_default_options()
    options.size_constraint = 2

    ec = sc.scc_sc_clustering(data_set, &options, clustering)
    check_error_code(ec)

    sc.scc_free_clustering(&clustering)
    sc.scc_free_data_set(&data_set)

    return cluster_labels
