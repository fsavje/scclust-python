def hierarchical_clustering(np.ndarray[np.double_t, ndim=2, mode="c"] data_array not None, uint32_t numclusters,
                            uint32_t size_constraint,
                            bint batch_assign):

    # 1. Make scc_DataSet struct
    # 2. Make output cluster labels as numpy array
    # 3. Make scc_Clustering struct with `scc_init_empty_clustering`
    # 4. Call `scc_hierarchical_clustering`
    # 5. Get number of clusters with `scc_get_clustering_info`
    # 6. Free C objects
    # 7. Return a python tuple with two items: (numpy array with cluster labels, number of clusters)

    # For inspiration, see: https://github.com/fsavje/scclust-R/blob/master/src/hierarchical.c

    cdef sc.scc_DataSet data_set
    cdef np.ndarray[np.uint32_t, ndim=1, mode="c"] output_labels
    output_labels = data_array[0]
    cdef sc.scc_Clustering* clustering
    cdef sc.scc_ErrorCode ec
    ec = sc.scc_init_existing_clustering(num_data_points, num_clusters,
                                      &output_labels, false
                                      &clustering)
    scc_hierarchical_clustering(data_array, size_constraint,
                                      batch_assign, &clustering)

    cdef uint64 num_clusters
    scc_ErrorCode scc_get_clustering_info(&clustering,
                                          num_data_points,
                                          num_clusters)
    sc.scc_free_clustering(&clustering)
    sc.scc_free_clustering(&data_set)

    return (output_labels, num_clusters)
