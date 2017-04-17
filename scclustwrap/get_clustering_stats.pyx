def get_clustering_stats(np.ndarray[np.double_t, ndim=2, mode="c"] data_array not None,
                         np.ndarray[np.uint32_t, ndim=1, mode="c"] clustering not None,
                         uint64_t num_clusters):

    # 1. Make scc_DataSet struct
    # 2. Make scc_Clustering struct with `scc_init_existing_clustering`
    # 3. Call `scc_get_clustering_stats`
    # 4. Make python dict mirroring the scc_ClusteringStats struct
    # 5. Free C objects
    # 6. Return the stats dict

    # For inspiration, see: https://github.com/fsavje/scclust-R/blob/master/src/utilities.c#L130

    cdef sc.scc_DataSet data_set
    cdef sc.scc_Clustering* cluster
    cdef sc.scc_ErrorCode ec
    cdef sc.scc_ClusteringStats* out_stats

    ec = sc.scc_init_existing_clustering(num_data_points, num_clusters,
                                      &cluster_labels,false
                                      &clustering)
    check_error_code(ec)
    sc.get_cluster_stats(&clustering, &data_array, &out_stats)

    #make python dict with out_stats

    sc.scc_free_clustering(&clustering)
    return None
