./plugins/terser/npm-install-marker: ./plugins/terser/package.json ./plugins/terser/package-lock.json
	npm ci --prefix ./plugins/terser
	touch $@

./plugins/terser/generated/%.js: ./%.js ./plugins/terser/npm-install-marker
	mkdir -p $(dir $@)
	cd ./plugins/terser && npx terser --toplevel --module --compress --mangle --output ../../$@ ../../$<
