def sc_clustering(np.ndarray[np.double_t, ndim=2, mode="c"] data_array not None, uint32_t numclusters,
                  dict options):

    # 1. Make scc_ClusterOptions struct with options (use defaults if key doesn't exists in 'options')
    # 2. Make scc_DataSet struct
    # 3. Make output cluster labels as numpy array
    # 4. Make scc_Clustering struct with `scc_init_empty_clustering`
    # 5. Call `scc_sc_clustering`
    # 6. Get number of clusters with `scc_get_clustering_info` (qs about the num_clusters were getting versus
    #num_clusters after
    # 7. Free C objects
    # 8. Return a python tuple with two items: (numpy array with cluster labels, number of clusters)

    # For inspiration, see: https://github.com/fsavje/scclust-R/blob/master/src/sc_clustering.c

    cdef sc.scc_ClusterOptions options = sc.scc_get_default_options()
    cdef sc.scc_DataSet data_set
    cdef np.ndarray[np.uint32_t, ndim=1, mode="c"] output_labels
    cdef uint32_t num_data_points = data_array.shape[0][0]
    cdef sc.scc_Clustering* clustering
    cdef sc.scc_ErrorCode ec
    ec = sc.scc_init_existing_clustering(num_data_points, num_clusters,
                                      &cluster_labels,false,
                                      &clustering)
    check_error_code(ec)
    ec = sc.scc_sc_clustering(data_set, *options, &clustering)
    cdef uint64 out_num_clusters
    scc_ErrorCode scc_get_clustering_info(&clustering,
                                          num_data_points,
                                          out_num_clusters)
    #Need to clean this up, fix num_cluster issues
    sc.scc_free_clustering(&clustering)
    sc.scc_free_clustering(&dataset)
    return None
