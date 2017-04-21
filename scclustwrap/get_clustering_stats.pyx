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
    stats = {}
    stas['num_data_points'] = out_stats.num_data_points
    stas['num_assigned'] = out_stats.num_assigned
    stas['num_clusters'] = out_stats.num_clusters
    stas['num_data_points'] = out_stats.num_populated_clusters
    stas['min_cluster_size'] = out_stats.min_cluster_size
    stas['max_cluster_size'] = out_stats.max_cluster_size
    stas['avg_cluster_size'] = out_stats.avg_cluster_size
    stas['sum_dists'] = out_stats.sum_dists
    stas['min_dist'] = out_stats.min_dist
    stas['max_dist'] = out_stats.avg_max_dist
    stas['num_data_points'] = out_stats.num_data_points
    stas['avg_dist_weighted'] = out_stats.avg_dist_weighted
    stas['avg_dist_unweighted'] = out_stats.avg_dist_unweighted

    sc.scc_free_clustering(&clustering)
    return stats
