cimport cython
from libc.stdint cimport int32_t, uint32_t, uint64_t
from libcpp cimport bool


cdef extern from "scclust.h":

    ctypedef int scc_PointIndex
    ctypedef int scc_Clabel
    ctypedef int scc_TypeLabel

    cdef enum scc_ErrorCode:
        SCC_ER_OK
        SCC_ER_UNKNOWN_ERROR
        SCC_ER_INVALID_INPUT
        SCC_ER_NO_MEMORY
        SCC_ER_NO_SOLUTION
        SCC_ER_TOO_LARGE_PROBLEM
        SCC_ER_DIST_SEARCH_ERROR
        SCC_ER_NOT_IMPLEMENTED

    cdef enum scc_SeedMethod:
        SCC_SM_LEXICAL
        SCC_SM_BATCHES
        SCC_SM_INWARDS_ORDER
        SCC_SM_INWARDS_UPDATING
        SCC_SM_EXCLUSION_ORDER
        SCC_SM_EXCLUSION_UPDATING

    cdef enum scc_UnassignedMethod:
        SCC_UM_IGNORE
        SCC_UM_ANY_NEIGHBOR
        SCC_UM_CLOSEST_ASSIGNED
        SCC_UM_CLOSEST_SEED

    cdef enum scc_RadiusMethod:
        SCC_RM_NO_RADIUS
        SCC_RM_USE_SUPPLIED
        SCC_RM_USE_SEED_RADIUS
        SCC_RM_USE_ESTIMATED

    ctypedef struct scc_DataSet:
        pass

    ctypedef struct scc_Clustering:
        pass

    cdef struct scc_ClusterOptions:
        int32_t options_version
        uint32_t size_constraint
        uint32_t num_types
        const uint32_t* type_constraints
        size_t len_type_labels
        const scc_TypeLabel* type_labels
        scc_SeedMethod seed_method
        size_t len_primary_data_points
        const scc_PointIndex* primary_data_points
        scc_UnassignedMethod primary_unassigned_method
        scc_UnassignedMethod secondary_unassigned_method
        scc_RadiusMethod seed_radius
        double seed_supplied_radius
        scc_RadiusMethod primary_radius
        double primary_supplied_radius
        scc_RadiusMethod secondary_radius
        double secondary_supplied_radius
        uint32_t batch_size

    cdef struct scc_ClusteringStats:
        uint64_t num_data_points
        uint64_t num_assigned
        uint64_t num_clusters
        uint64_t num_populated_clusters
        uint64_t min_cluster_size
        uint64_t max_cluster_size
        double avg_cluster_size
        double sum_dists
        double min_dist
        double max_dist
        double avg_min_dist
        double avg_max_dist
        double avg_dist_weighted
        double avg_dist_unweighted

    bool scc_get_latest_error(size_t len_error_message_buffer,
                              char error_message_buffer[])

    scc_ErrorCode scc_init_data_set(uint64_t num_data_points,
                                    uint32_t num_dimensions,
                                    size_t len_data_matrix,
                                    const double data_matrix[],
                                    scc_DataSet** out_data_set)

    void scc_free_data_set(scc_DataSet** data_set)

    scc_ErrorCode scc_init_empty_clustering(uint64_t num_data_points,
                                            scc_Clabel external_cluster_labels[],
                                            scc_Clustering** out_clustering)

    scc_ErrorCode scc_init_existing_clustering(uint64_t num_data_points,
                                               uint64_t num_clusters,
                                               scc_Clabel current_cluster_labels[],
                                               bool deep_label_copy,
                                               scc_Clustering** out_clustering)

    void scc_free_clustering(scc_Clustering** clustering)

    scc_ErrorCode scc_get_clustering_info(const scc_Clustering* clustering,
                                          uint64_t* out_num_data_points,
                                          uint64_t* out_num_clusters)

    scc_ClusterOptions scc_get_default_options()

    scc_ErrorCode scc_sc_clustering(void* data_set,
                                    const scc_ClusterOptions* options,
                                    scc_Clustering* out_clustering)

    scc_ErrorCode scc_hierarchical_clustering(void* data_set,
                                              uint32_t size_constraint,
                                              bool batch_assign,
                                              scc_Clustering* out_clustering)

    scc_ErrorCode scc_check_clustering(const scc_Clustering* clustering,
                                       const scc_ClusterOptions* options,
                                       bool* out_is_OK)

    scc_ErrorCode scc_get_clustering_stats(void* data_set,
                                           const scc_Clustering* clustering,
                                           scc_ClusteringStats* out_stats)
