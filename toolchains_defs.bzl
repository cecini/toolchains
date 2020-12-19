
load(":python.bzl", "setup_local_python")
#load("@toolchains//:python.bzl", "setup_local_python")
def setup_deps():
#    bazel_skylib_workspace()

#    versions.check(minimum_bazel_version = "3.7.0")

#    rust_repositories(
#        edition = "2018",
        #use_worker = True,
        # use_worker = True,
        #version = "1.48.0",
        #version = "1.47.0",
#        version = "nightly",
#	iso_date = "2020-11-25",
#    )


    # get local raze rust depend
#    raze_fetch_remote_crates()

    #setup_local_python(name = "python")
    setup_local_python(name = "python", path = "/usr/local/python/bin/python" )

    native.register_toolchains("@python//:python3_toolchain")
