from distutils.core import setup
from Cython.Build import cythonizeclass
from libc.stdlib cimport atoi
from hierarchical_clustering import *
from libc.string cimport const_char, const_uchar

class hierarchical_clustering():

    def __init__(self, distances, size_constraint, batch_assign = True, existing_clustering = None):
        self.distances = distances
        ensure_distances(distances)
        self.num_data_points = len(distances)
        self.size_constraint = coerce_size_constraint(size_constraint, num_data_points)
        self.batch_assign = coerce_scalar_indicator(batch_assign)
        self.existing_clustering = existing_clustering
      	if ((existing_clustering)!= None) {
   			ensure_scclust(existing_clustering, num_data_points)
   			}

   	def clustering(self):
      return scc_hierarchical_clustering(self.distances, self.size_constraint, self.batch_assign, out_clustering)




