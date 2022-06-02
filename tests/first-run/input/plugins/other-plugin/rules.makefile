./plugins/other-plugin/generated/input.js:
	mkdir -p $(dir $@)
	cp ./plugins/other-plugin/input.js $@

./plugins/other-plugin/generated/dreck_terser_output_javascript_paths.txt:
	mkdir -p $(dir $@)
	echo $(DRECK_TERSER_OUTPUT_JAVASCRIPT_PATHS) > $@
