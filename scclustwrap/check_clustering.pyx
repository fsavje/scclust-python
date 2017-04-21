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
                                      &cluster_labels,false,
                                      &clustering)

    check_error_code(ec)
    cdef sc.scc_ClusterOptions options = sc.scc_get_default_options()

    #Check if options contains a value for key and assign 

    if('options_version' in options):
        options.options_version = dict['options_version']
    if('size_constraint' in options):
        options.size_constraint = dict['size_constraint']
    if('num_types' in options):
        options.num_types = dict['num_types']
    if('type_constraints' in options):
        options.type_constraints = dict['type_constraints']
    if('len_type_labels' in options):
        options.len_type_labels = dict['len_type_labels']
    if('type_labels' in options):
        options.type_labels = dict['type_labels']
    if('seed_method' in options):
        options.seed_method = dict['seed_method']
    if('len_primary_data_points' in options):
        options.len_primary_data_points = dict['len_primary_data_points']
    if('primary_data_points' in options):
        options.primary_data_points = dict['primary_data_points']
    if('primary_unassigned_method' in options):
        options.primary_unassigned_method = dict['primary_unassigned_method']
    if('secondary_unassigned_method' in options):
        options.secondary_unassigned_method = dict['secondary_unassigned_method']
    if('seed_radius' in options):
        options.seed_radius = dict['seed_radius']
    if('seed_supplied_radius' in options):
        options.seed_supplied_radius = dict['seed_supplied_radius']
    if('primary_radius' in options):
        options.primary_radius = dict['primary_radius']
    if('secondary_radius' in options):
        options.secondary_radius = dict['secondary_radius']
    if('secondary_supplied_radius' in options):
        options.secondary_supplied_radius = dict['secondary_supplied_radius']
    if('batch_size' in options):
        options.batch_size = dict['batch_size']


    options.size_constraint = 2
    cdef bool result = false
    scc_check_clustering( &clustering, options, &result)

    sc.scc_free_clustering(&clustering)

    return result
