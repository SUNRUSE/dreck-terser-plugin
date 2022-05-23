DRECK_INTERMEDIATE_PATHS += $(patsubst ./%.js, ./%.min.js, $(filter %.js, $(DRECK_SRC_PATHS) ${DRECK_INTERMEDIATE_JAVASCRIPT_PATHS}))

DRECK_HTML_VARIABLE_PATHS += $(patsubst ./%.js, ./ephemeral/intermediate/%.min.js, $(filter %.js, $(DRECK_SRC_PATHS) ${DRECK_INTERMEDIATE_JAVASCRIPT_PATHS}))
