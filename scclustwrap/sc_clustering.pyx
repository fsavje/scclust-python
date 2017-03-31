def sc_clustering(np.ndarray[np.double_t, ndim=2, mode="c"] data_array not None,
                  dict options):

    # 1. Make scc_ClusterOptions struct with options (use defaults if key doesn't exists in 'options')
    # 2. Make scc_DataSet struct
    # 3. Make output cluster labels as numpy array
    # 4. Make scc_Clustering struct with `scc_init_empty_clustering`
    # 5. Call `scc_sc_clustering`
    # 6. Get number of clusters with `scc_get_clustering_info`
    # 7. Free C objects
    # 8. Return a python tuple with two items: (numpy array with cluster labels, number of clusters)

    # For inspiration, see: https://github.com/fsavje/scclust-R/blob/master/src/sc_clustering.c

    return None
