# ==============================================================================
# Helper functions
# ==============================================================================

# Throw error
def new_error(e, message):
	raise Exception(e + message)


# ==============================================================================
# Ensure functions
# ==============================================================================

# Ensure that `distances` is `distances` object
def ensure_distances(distances, req_length = None):
	for (d in distances):
		if (!is_distances(d)):
			new_error(distances, "is not a 'scc_distances' object.")
	if (req_length != None and len(distances) != req_length):
		new_error(distances, "does not contain " + str(req_length))


# Ensure that `indicators` are non-NA logicals
def ensure_indicators(indicators, req_length = None, any_true = False):

	if(!is_logical(indicators)):
		new_error(indicators, "must be logical.")
	for (l in indicators):
		if l == None:
			new_error(indicators, "may not contain null.")
	if (req_length != None & (len(indicators) != req_length)):
		new_error(indicators, "is not of length " + str(req_length))
