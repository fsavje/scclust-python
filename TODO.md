### Specification:

* Only depend on Python's standard library and NumPy/SciPy.
* Work for both Python 2.7 and 3.
* Use cKDTree in SciPy for nearest neighbor search functions.
* Wrapping the scclust library with the standard CPython C API or Cython.
* Be distributed through PyPI (https://pypi.python.org/pypi)
* If possible, try to make it compatible with Anaconda (don't know how much it differs from PyPI).
* Mac and Linux versions to start with.
* Keep Windows in mind so it doesn't turn out impossible to make such a version eventually.


### To do:

* Which testing framework should we use?
   * https://docs.python.org/2/library/unittest.html
   * http://docs.python-guide.org/en/latest/writing/tests/
   * http://docs.pytest.org/en/latest/
   * http://nose2.readthedocs.io/en/latest/
   * https://tox.readthedocs.io/en/latest/
* Add CI on Travis (and at some point AppVeyor)


### References:

**Making packages:**

* https://packaging.python.org
* https://setuptools.readthedocs.io/en/latest/setuptools.html
* https://docs.python.org/3/tutorial/modules.html

**C extensions:**

* http://www.scipy-lectures.org/advanced/interfacing_with_c/interfacing_with_c.html
* http://www.scipy-lectures.org/advanced/advanced_numpy/index.html#advanced-numpy
* http://scipy-cookbook.readthedocs.io/items/C_Extensions_NumPy_arrays.html
* https://docs.scipy.org/doc/numpy/user/c-info.how-to-extend.html
* https://docs.python.org/2/c-api/
* https://packaging.python.org/extensions/
* https://python-packaging-user-guide.readthedocs.io/extensions/
* https://docs.python.org/2/extending/extending.html
* https://docs.python.org/3/extending/extending.html
* https://docs.python.org/3.6/c-api/index.html
* https://docs.scipy.org/doc/numpy/user/c-info.how-to-extend.html

**Portability:**

* http://sebastianraschka.com/Articles/2014_python_2_3_key_diff.html
* http://python3porting.com/cextensions.html

**Style:**

* https://www.python.org/dev/peps/pep-0008/

**Other:**

* http://docs.python-guide.org/en/latest/writing/style/
* https://www.pypa.io/en/latest/
* https://python-packaging.readthedocs.io
* https://github.com/pypa/sampleproject
* https://conda.io/docs/
