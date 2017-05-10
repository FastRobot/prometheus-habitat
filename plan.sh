pkg_name=prometheus
pkg_description="Prometheus monitoring"
pkg_upstream_url=http://prometheus.io
pkg_origin=fastrobot
pkg_version=1.6.1
pkg_maintainer="Lamont Lucas <lamont@fastrobot.com>"
pkg_license=('Apache-2.0')
pkg_bin_dirs=(bin)
pkg_source="https://github.com/prometheus/prometheus/archive/v${pkg_version}.tar.gz"
pkg_shasum=ecc9ce94fce45994c23b76eb0c5acbb1b942513be601872c8cd74d0821450c5e
prom_pkg_dir="$HAB_CACHE_SRC_PATH/${pkg_name}-${pkg_version}"
prom_build_dir="${prom_pkg_dir}/src/${pkg_source}"
pkg_deps=(
  core/go
)
pkg_build_deps=(
  core/git
  core/gcc
  core/make
)

pkg_exports=(
  [port-http]=listening_port
)
pkg_exposes=(port-http)


do_prepare() {
  export GOPATH=$HAB_CACHE_SRC_PATH/$pkg_dirname
}

do_unpack() {
  mkdir -p $prom_pkg_dir/src/github.com/prometheus/prometheus
  tar zxf "v${pkg_version}.tar.gz" --strip-components=1 -C ${prom_pkg_dir}/src/github.com/prometheus/prometheus
}

do_build() {
  pushd ${prom_pkg_dir}/src/github.com/prometheus/prometheus
  make build
  $GOPATH/bin/promu build --prefix $pkg_prefix/bin
  popd
  return 0
}

do_install() {
  return 0
}
