load(":python.bzl", "setup_local_python")
#load("@toolchains//:python.bzl", "setup_local_python")

load("@io_bazel_rules_rust//rust:repositories.bzl", "rust_repositories")
# mabye auto detect path by python name 
def setup_debugdeps_onlypython(pypath):
    if pypath == None:
        path = "/usr/local/python/bin/python"

    setup_local_python(name = "python", path = path)
    native.register_toolchains("@python//:python3_toolchain")

def setup_releasedeps_onlypython(pypath):
    if pypath == None:
        path = "/usr/local/python39release/bin/python"


    setup_local_python(name = "python", path = path)
    native.register_toolchains("@python//:python3_toolchain")

def setup_debugdeps_onlyrust(edition = "2018", iso_date = "2020-11-25"):
    rust_repositories(
        edition = edition,
        version = "nightly",
        iso_date = iso_date
    )
def setup_releasedeps_onlyrust(edition = "2018", rust_version = "1.48.0"):
    rust_repositories(
        edition = edition,
        #use_worker = True,
        version = rust_version
    )

def setup_debugdeps(edition = "2018", iso_date = "2020-11-25", pypath = "/usr/local/python/bin/python"):
#    bazel_skylib_workspace()

#    versions.check(minimum_bazel_version = "3.7.0")

    rust_repositories(
        edition = edition,
        version = "nightly",
        iso_date = iso_date
    )

    # get local raze rust depend
    #raze_fetch_remote_crates()

    #setup_local_python(name = "python")
    #setup_local_python(name = "python", path = "/usr/local/python/bin/python" )
    print("pypath")
    print(pypath)
    setup_local_python(name = "python", path = pypath )

    native.register_toolchains("@python//:python3_toolchain")


def setup_releasedeps(edition = "2018", rust_version = "1.48.0", pypath = "/usr/local/python39release/bin/python"):
#    bazel_skylib_workspace()

#    versions.check(minimum_bazel_version = "3.7.0")

    #raze_fetch_remote_crates()
    rust_repositories(
        edition = edition,
        #use_worker = True,
        version = rust_version
    )

    # get local raze rust depend
#    raze_fetch_remote_crates()

    #setup_local_python(name = "python")
    if pypath == None:
        path = "/usr/local/python39release/bin/python"

    #setup_local_python(name = "python", path = "/usr/local/python39release/bin/python" )
    setup_local_python(name = "python", path = path)

    native.register_toolchains("@python//:python3_toolchain")
