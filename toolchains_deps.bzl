"""Load dependencies needed to compile the toolchains library as a 3rd-party consumer."""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository", "new_git_repository")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def toolchains_deps():
    """Loads common dependencies needed to compile the toolchains library."""

    if not native.existing_rule("bazel_skylib"):
        http_archive(
            name = "bazel_skylib",
            sha256 = "97e70364e9249702246c0e9444bccdc4b847bed1eb03c5a3ece4f83dfe6abc44",
            urls = [
                "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.0.2/bazel-skylib-1.0.2.tar.gz",
                "https://github.com/bazelbuild/bazel-skylib/releases/download/1.0.2/bazel-skylib-1.0.2.tar.gz",
            ],
        )

    maybe(
        git_repository,
        name = "io_bazel_rules_rust",
        commit = "dfd1200fcdcc0d56d725818ed3a66316517f20a6",
        remote = "https://github.com/ankitects/rules_rust",
        shallow_since = "1607578413 +1000",
    )
