@cython.wraparound(False)
@cython.boundscheck(False)
def check_clustering(np.ndarray[np.uint32_t, ndim=1, mode="c"] clustering_labels not None, uint32_t numclusters,
                     dict options):

    # 1. Make scc_ClusterOptions struct with options (use defaults if key doesn't exists in 'options')
    # 2. Make scc_Clustering struct with `scc_init_existing_clustering`
    # 3. Call `scc_check_clustering`
    # 5. Free C objects
    # 6. Return bool with result of scc_check_clustering
    # For inspiration, see: https://github.com/fsavje/scclust-R/blob/master/src/utilities.c#L36

    cdef uint32_t num_data_points = data_array.shape[0]
    cdef sc.scc_Clustering* clustering
    cdef sc.scc_ErrorCode ec
    ec = sc.scc_init_existing_clustering(num_data_points, num_clusters,
                                      &cluster_labels,false
                                      &clustering)

    check_error_code(ec)
    cdef sc.scc_ClusterOptions options = sc.scc_get_default_options()
    #loop through dictionary to check if there's a value for key
    #https://github.com/fsavje/scclust-R/blob/master/src/libscclust/include/scclust.h
    #Need to do this

    options.size_constraint = 2
    cdef bool result = false
    scc_check_clustering( &clustering, options, &result)

    sc.scc_free_clustering(&clustering)

    return result
