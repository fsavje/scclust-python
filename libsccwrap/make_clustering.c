#define NO_IMPORT_ARRAY

#include "make_clustering.h"

#include <Python.h>
// http://docs.scipy.org/doc/numpy/reference/c-api.deprecations.html
#define NPY_NO_DEPRECATED_API NPY_1_7_API_VERSION
#include <numpy/arrayobject.h>
#include <scclust.h>


PyObject* sccw_make_clustering(PyObject* const self,
                               PyObject* const args)
{
	PyArrayObject* in_array;
	if (!PyArg_ParseTuple(args, "O!", &PyArray_Type, &in_array)) return NULL;
	if (PyArray_NDIM(in_array) != 2) return NULL;
	if (PyArray_TYPE(in_array) != NPY_DOUBLE) return NULL;

	const uintmax_t num_data_points = (uintmax_t) PyArray_SHAPE(in_array)[0];
	const uintmax_t num_dimensions = (uintmax_t) PyArray_SHAPE(in_array)[1];

	int* const cluster_labels = malloc(sizeof(int[num_data_points]));
	if (cluster_labels == NULL) return NULL;

	scc_ErrorCode ec;
	scc_DataSet* data_set;
	ec = scc_init_data_set(num_data_points,
	                       num_dimensions,
	                       num_data_points * num_dimensions,
	                       (const double *) PyArray_DATA(in_array),
	                       &data_set);
	if(ec != SCC_ER_OK) return NULL;

	scc_Clustering* clustering;
	ec = scc_init_empty_clustering(num_data_points,
	                               cluster_labels,
	                               &clustering);
	if(ec != SCC_ER_OK) return NULL;

	scc_ClusterOptions options = scc_default_cluster_options;
	options.size_constraint = 2;

	ec = scc_make_clustering(data_set, clustering, &options);
	if(ec != SCC_ER_OK) return NULL;

	scc_free_clustering(&clustering);
	scc_free_data_set(&data_set);

	npy_intp dims[1] = { num_data_points };
	PyObject* py_clustering = PyArray_SimpleNewFromData(1, dims, NPY_INT, cluster_labels);
	PyArray_ENABLEFLAGS((PyArrayObject*) py_clustering, NPY_ARRAY_OWNDATA);
	Py_INCREF(py_clustering);
	return py_clustering;
}
