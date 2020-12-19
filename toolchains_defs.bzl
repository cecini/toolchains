load(":python.bzl", "setup_local_python")
#load("@toolchains//:python.bzl", "setup_local_python")

load("@io_bazel_rules_rust//rust:repositories.bzl", "rust_repositories")
def setup_debugdeps():
#    bazel_skylib_workspace()

#    versions.check(minimum_bazel_version = "3.7.0")

    rust_repositories(
        edition = "2018",
        version = "nightly",
        iso_date = "2020-11-25",
    )

    # get local raze rust depend
    raze_fetch_remote_crates()

    #setup_local_python(name = "python")
    setup_local_python(name = "python", path = "/usr/local/python/bin/python" )

    native.register_toolchains("@python//:python3_toolchain")


def setup_releasedeps():
#    bazel_skylib_workspace()

#    versions.check(minimum_bazel_version = "3.7.0")

    raze_fetch_remote_crates()
    rust_repositories(
        edition = "2018",
        #use_worker = True,
        version = "1.48.0",
    )

    # get local raze rust depend
#    raze_fetch_remote_crates()

    #setup_local_python(name = "python")
    setup_local_python(name = "python", path = "/usr/local/python39release/bin/python" )

    native.register_toolchains("@python//:python3_toolchain")
