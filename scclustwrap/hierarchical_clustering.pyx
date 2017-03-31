def hierarchical_clustering(np.ndarray[np.double_t, ndim=2, mode="c"] data_array not None,
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

    return None
