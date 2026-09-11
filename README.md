<!-- BEGIN:AVATAR -->
![Avatar](avatar.jpg)
<!-- END:AVATAR -->

<!-- BEGIN:BADGES -->
[![Build Status](https://github.com/cliffano/generator-terraform/workflows/CI/badge.svg)](https://github.com/cliffano/generator-terraform/actions?query=workflow%3ACI)
[![Code Scanning Status](https://github.com/cliffano/generator-terraform/workflows/CodeQL/badge.svg)](https://github.com/cliffano/generator-terraform/actions?query=workflow%3ACodeQL)
[![Security Status](https://snyk.io/test/github/cliffano/generator-terraform/badge.svg)](https://snyk.io/test/github/cliffano/generator-terraform)
<!-- END:BADGES -->

# Generator Terraform

Generator Terraform is Code generator for Terraform modules.

It provides the following components:

| Component | Description |
|-----------|-------------|
| tf-module | <some_component_desc> |
| tf-module-partials | Generate README partial snippets for Terraform module projects. |

## Usage

Generate code generator project:

```shell
make generate-tf-module
```

Generate Terraform module partial snippets:

```shell
make generate-tf-module-partials
```

This component will prompt you the following inputs:

| Prompt | Description |
|--------|-------------|
| Project ID | Used for package names and project repo name. |
| Project Name | Used in documentation or comments. |
| Project Description | Used in documentation or comments. |
| Author Name | The name of the project author. |
| Author Email | The email of the project author. |
| Author URL | The author's website URL. |
| GitHub ID | The GitHub ID of the project repo. |

Move to the generated project directory:

```shell
cd stage/tf-module/
```

## Usage With Config File

Each component also has a `-with-config` target that skips the interactive prompts by reading the inputs from a TFMake YAML config file. See [examples/](examples/) for sample config files for each component.

Pass the config file path via the `GENERATOR_CONFIG` variable, it defaults to `tfmake.yml`:

```shell
make generate-tf-module-with-config GENERATOR_CONFIG=path/to/tfmake.yml
make generate-tf-module-partials-with-config GENERATOR_CONFIG=path/to/tfmake.yml
```

## Configuration

| Key | Value |
|-----|-------|
| project_id | generator-terraform |
| project_name | Generator Terraform |
| project_desc | Code generator for Terraform modules |
| author_name | Cliffano Subagio |
| author_email | blah@cliffano.com |
| github_id | cliffano |
| github_repo | generator-terraform |

## Colophon

<!-- BEGIN:DEVELOPERS_GUIDE -->
[Developer's Guide](https://cliffano.github.io/developers-guide-makefile.html)
<!-- END:DEVELOPERS_GUIDE -->

<!-- BEGIN:BUILD_REPORTS -->
Build reports:

<!-- END:BUILD_REPORTS -->

Related Projects:

* [TFMake](https://github.com/cliffano/tfmake) - Makefile for building Terraform modules
