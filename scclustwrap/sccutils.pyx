cdef int check_error_code(sc.scc_ErrorCode ec) except -1:
    if ec == sc.SCC_ER_OK:
        return 0

    cdef char msg_buffer[255]
    sc.scc_get_latest_error(255, msg_buffer)

    if ec == sc.SCC_ER_NO_MEMORY:
        raise MemoryError(msg_buffer)
    elif ec == sc.SCC_ER_NOT_IMPLEMENTED:
        raise NotImplementedError(msg_buffer)
    elif ec == sc.SCC_ER_INVALID_INPUT:
        raise ValueError(msg_buffer)
    else:
        # SCC_ER_UNKNOWN_ERROR, SCC_ER_NO_SOLUTION
        # SCC_ER_TOO_LARGE_PROBLEM, SCC_ER_DIST_SEARCH_ERROR
        raise RuntimeError(msg_buffer)
