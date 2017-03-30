cimport cython
from libc.stdint cimport int64_t, uint64_t, uint32_t


cdef extern from "scclust.h":
    cdef struct scc_DataSet
    cdef struct scc_ErrorCode
    cdef struct scc_Clustering
    cdef struct scc_ClusterOptions
    ctypedef int scc_Clabel
    ctypedef enum scc_SeedMethod
    ctypedef enum scc_UnassignedMethod
    ctypedef enum scc_RadiusMethod
    ctypedef struct scc_ClusterOptions
    ctypedef struct scc_ClusteringStats


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







