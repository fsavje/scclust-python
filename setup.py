import numpy
import os.path
import sys
from setuptools import setup, Extension, Command

def compile_cython():
    from Cython.Build import cythonize
    cythonize(['scclust/scclust.pyx'])

if os.path.isfile(".cython"):
    compile_cython()

class cython(Command):
    user_options = []
    def initialize_options(self): pass
    def finalize_options(self): pass
    def run(self):
        compile_cython()

scclust_ext = Extension(
                    'scclust',
                    sources=[
                        # Wrapper files
                        'scclust/scclust.c',

                        # scclust files
                        'libscclust/src/data_set.c',
                        'libscclust/src/digraph_core.c',
                        'libscclust/src/digraph_operations.c',
                        'libscclust/src/dist_search_imp.c',
                        'libscclust/src/error.c',
                        'libscclust/src/hierarchical_clustering.c',
                        'libscclust/src/nng_batch_clustering.c',
                        'libscclust/src/nng_clustering.c',
                        'libscclust/src/nng_core.c',
                        'libscclust/src/nng_findseeds.c',
                        'libscclust/src/scclust_spi.c',
                        'libscclust/src/scclust.c',
                        'libscclust/src/utilities.c'
                    ],
                    include_dirs=[
                        'libscclust/include',
                        numpy.get_include()
                    ],
                    define_macros=[('NDEBUG', None)]
                )

setup(
    name='scclust',
    version='0.0.1',
    author='Olivia Koshy, Rose Zhao, Fredrik Savje, Jasjeet Sekhon',
    author_email='fredrik.savje@berkeley.edu',
    description='Python wrapper for the scclust library.',
    long_description='...',
    keywords='clustering',
    license='GPLv3',
    url='https://github.com/fsavje/scclust-python',
    classifiers=[
        'Development Status :: 1 - Planning',
        'Intended Audience :: Science/Research',
        'Topic :: Scientific/Engineering',
        'License :: OSI Approved :: GNU General Public License v3 (GPLv3)',
        'Operating System :: MacOS',
        'Operating System :: POSIX',
        'Operating System :: Unix',
        #'Operating System :: Microsoft :: Windows',
        'Programming Language :: C',
        'Programming Language :: Python',
        'Programming Language :: Python :: 2',
        'Programming Language :: Python :: 2.7',
        'Programming Language :: Python :: 3',
        'Programming Language :: Python :: 3.4',
        'Programming Language :: Python :: 3.5',
        'Programming Language :: Python :: 3.6',
        'Programming Language :: Python :: Implementation :: CPython'
    ],
    cmdclass={'cython': cython},
    ext_modules=[scclust_ext],
    install_requires=[
        'numpy',
        'scipy'
    ]
)
