// See:
// https://docs.python.org/3/extending/extending.html
// https://docs.python.org/3.4/c-api/index.html

#include <Python.h>
#define NPY_NO_DEPRECATED_API NPY_1_7_API_VERSION
#include <numpy/arrayobject.h>

#include "sc_clustering.h"

static PyMethodDef libsccwrap_methods[] = {
	{"sc_clustering", sccw_sc_clustering, METH_VARARGS, "sc_clustering"},
	{NULL,            NULL,               0,            NULL}
};

#if PY_MAJOR_VERSION >= 3
	// Python 3

	static struct PyModuleDef libsccwrap_module = {
		PyModuleDef_HEAD_INIT,
		"libsccwrap",
		NULL,
		-1,
		libsccwrap_methods
	};

	PyMODINIT_FUNC PyInit_libsccwrap(void)
	{
		PyObject* m = PyModule_Create(&libsccwrap_module);
		import_array();
		return m;
	}

#else
	// Python 2.7

	PyMODINIT_FUNC initlibsccwrap(void)
	{
		(void) Py_InitModule("libsccwrap", libsccwrap_methods);
		import_array();
	}

#endif
