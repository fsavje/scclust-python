# See:
# https://setuptools.readthedocs.io/en/latest/setuptools.html

from setuptools import setup, Extension
import numpy

libsccwrap = Extension(
                    'libsccwrap',
                    sources=[
                        # Wrapper files
                        'libsccwrap/init.c',
                        'libsccwrap/make_clustering.c',

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
                        'libscclust/src/scclust.c'
                    ],
                    include_dirs=[
                        'libscclust/include',
                        numpy.get_include()],
                    define_macros=[
                        ('NDEBUG', None),
                        ('PY_ARRAY_UNIQUE_SYMBOL', 'libsccwrap_ARRAY_API'),
                    ]
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

    # See https://pypi.python.org/pypi?%3Aaction=list_classifiers
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

    packages=['scclust'],
    ext_modules=[libsccwrap],
    #zip_safe=False,
    install_requires=[
        'numpy',
        'scipy'
    ]
)
