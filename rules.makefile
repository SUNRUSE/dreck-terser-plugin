./submodules/plugins/terser/npm-install-marker: ./submodules/plugins/terser/package.json ./submodules/plugins/terser/package-lock.json
	npm ci --prefix ./submodules/plugins/terser
	touch $@

DRECK_TERSER_PERCENT = %

./ephemeral/intermediate/%.min.js: $$(patsubst ./$${DRECK_TERSER_PERCENT}.js, ./ephemeral/src/$${DRECK_TERSER_PERCENT}.js, $$(filter ${DRECK_SRC_PATHS}, $$(addprefix ./, $$(addsuffix .js, %)))) $$(patsubst ./$${DRECK_TERSER_PERCENT}.js, ./ephemeral/intermediate/$${DRECK_TERSER_PERCENT}.js, $$(filter ${DRECK_INTERMEDIATE_PATHS}, $$(addprefix ./, $$(addsuffix .js, %)))) ./submodules/plugins/terser/npm-install-marker
	mkdir -p $(dir $@)
	cd ./submodules/plugins/terser && npx terser --toplevel --module --compress --mangle --output ../../../$@ ../../../$<
