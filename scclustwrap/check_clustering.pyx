def check_clustering(np.ndarray[np.uint32_t, ndim=1, mode="c"] clustering not None,
                     dict options):

    # 1. Make scc_ClusterOptions struct with options (use defaults if key doesn't exists in 'options')
    # 2. Make scc_Clustering struct with `scc_init_existing_clustering`
    # 3. Call `scc_check_clustering`
    # 5. Free C objects
    # 6. Return bool with result of scc_check_clustering

    # For inspiration, see: https://github.com/fsavje/scclust-R/blob/master/src/utilities.c#L36

    return None
