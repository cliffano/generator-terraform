ci: clean stage deps test-tf-module test-tf-module-partials

clean:
	rm -rf stage/

clean-tf-module:
	rm -rf stage/tf-module/

stage:
	mkdir -p stage/

deps:
	npm install .

########################################
# Utility targets
########################################

GENERATOR_CONFIG ?= tfmake.yml

define set_generator_vars
$(1): GENERATOR_COMPONENT = $$(shell yq .generator.component $(2))
$(1): GENERATOR_INPUTS_PROJECT_ID = $$(shell yq .generator.inputs.project_id $(2))
$(1): GENERATOR_INPUTS_PROJECT_NAME = $$(shell yq .generator.inputs.project_name $(2))
$(1): GENERATOR_INPUTS_PROJECT_DESC = $$(shell yq .generator.inputs.project_desc $(2))
$(1): GENERATOR_INPUTS_AUTHOR_NAME = $$(shell yq .generator.inputs.author_name $(2))
$(1): GENERATOR_INPUTS_AUTHOR_EMAIL = $$(shell yq .generator.inputs.author_email $(2))
$(1): GENERATOR_INPUTS_AUTHOR_URL = $$(shell yq .generator.inputs.author_url $(2))
$(1): GENERATOR_INPUTS_GITHUB_ID = $$(shell yq .generator.inputs.github_id $(2))
$(1): GENERATOR_INPUTS_GITHUB_REPO = $$(shell yq .generator.inputs.github_repo $(2))
$(1): GENERATOR_INPUTS_GITHUB_TOKEN_PREFIX = $$(shell yq .generator.inputs.github_token_prefix $(2))
endef

########################################
# tf-module targets
########################################

generate-tf-module: clean-tf-module
	node_modules/.bin/plop tf-module

$(eval $(call set_generator_vars,generate-tf-module-with-config,$(GENERATOR_CONFIG)))
generate-tf-module-with-config: clean-tf-module
	node_modules/.bin/plop $(GENERATOR_COMPONENT) -- \
	    --project_id "$(GENERATOR_INPUTS_PROJECT_ID)" \
		--project_name "$(GENERATOR_INPUTS_PROJECT_NAME)" \
		--project_desc "$(GENERATOR_INPUTS_PROJECT_DESC)" \
		--author_name "$(GENERATOR_INPUTS_AUTHOR_NAME)" \
		--author_email "$(GENERATOR_INPUTS_AUTHOR_EMAIL)" \
		--author_url "$(GENERATOR_INPUTS_AUTHOR_URL)" \
		--github_id "$(GENERATOR_INPUTS_GITHUB_ID)" \
		--github_repo "$(GENERATOR_INPUTS_GITHUB_REPO)" \
		--github_token_prefix "$(GENERATOR_INPUTS_GITHUB_TOKEN_PREFIX)"

test-tf-module: clean-tf-module
	make generate-tf-module-with-config GENERATOR_CONFIG=examples/tfmake-tf-module.yml
	cd stage/tf-module/ && \
	  make ci

########################################
# tf-module-partials targets
########################################

clean-tf-module-partials:
	rm -rf stage/tf-module-partials/

generate-tf-module-partials: clean-tf-module-partials
	node_modules/.bin/plop tf-module-partials

$(eval $(call set_generator_vars,generate-tf-module-partials-with-config,$(GENERATOR_CONFIG)))
generate-tf-module-partials-with-config: clean-tf-module-partials
	node_modules/.bin/plop $(GENERATOR_COMPONENT) -- \
	    --project_id "$(GENERATOR_INPUTS_PROJECT_ID)" \
		--project_name "$(GENERATOR_INPUTS_PROJECT_NAME)" \
		--project_desc "$(GENERATOR_INPUTS_PROJECT_DESC)" \
		--author_name "$(GENERATOR_INPUTS_AUTHOR_NAME)" \
		--author_email "$(GENERATOR_INPUTS_AUTHOR_EMAIL)" \
		--author_url "$(GENERATOR_INPUTS_AUTHOR_URL)" \
		--github_id "$(GENERATOR_INPUTS_GITHUB_ID)" \
		--github_repo "$(GENERATOR_INPUTS_GITHUB_REPO)" \
		--github_token_prefix "$(GENERATOR_INPUTS_GITHUB_TOKEN_PREFIX)"

test-tf-module-partials: clean-tf-module-partials
	make generate-tf-module-partials-with-config GENERATOR_CONFIG=examples/tfmake-tf-module-partials.yml

.PHONY: ci clean clean-tf-module stage deps generate-tf-module generate-tf-module-with-config test-tf-module clean-tf-module-partials generate-tf-module-partials generate-tf-module-partials-with-config test-tf-module-partials
