load(":python.bzl", "setup_local_python")

load("@io_bazel_rules_rust//rust:repositories.bzl", "rust_repositories")

def setup_deps_onlypython(names = []):
    setup_local_python(name = "python", names = names)
    native.register_toolchains("@python//:python3_toolchain")

def setup_deps_onlyrust():
        rust_repositories()

def setup_deps(names=[]):
    setup_deps_onlyrust()
    setup_deps_onlypython(names)

