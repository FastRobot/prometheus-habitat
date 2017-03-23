pkg_name=prometheus
pkg_description="Prometheus monitoring"
pkg_upstream_url=http://prometheus.io
pkg_origin=fastrobot
pkg_version=1.5.2
pkg_maintainer="Lamont Lucas <lamont@fastrobot.com>"
pkg_license=('Apache-2.0')
pkg_source=https://github.com/prometheus/prometheus/releases/download/v${pkg_version}/prometheus-${pkg_version}.linux-amd64.tar.gz
pkg_shasum=971c5f365c3f53f52d05729acf43962905832b33d740798094850a25645de5ae
pkg_dirname=${pkg_name}-${pkg_version}
pkg_deps=(core/go)
pkg_build_deps=(core/tar)
#pkg_lib_dirs=(lib)
#pkg_include_dirs=(include)
pkg_exports=(
  [port-http]=ports.http
)
pkg_exposes=(port-http)
pkg_bin_dirs=(prom)
pkg_svc_run="prometheus -config.file=$pkg_svc_config_path/prometheus.yml"

do_unpack() {
  cd "${HAB_CACHE_SRC_PATH}" || exit
  tar zxf ${pkg_filename}
}

do_build() {
  return 0
}

do_install() {
  mkdir -p ${pkg_prefix}/prom 
  cp ${HAB_CACHE_SRC_PATH}/${pkg_dirname}.linux-amd64/prometheus $pkg_prefix/prom/prometheus 
  #cp ${HAB_CACHE_SRC_PATH}/${pkg_dirname}.linux-amd64/prometheus.yml $pkg_svc_config_path/prometheus.yml
}
