pkg_name=prometheus
pkg_description="Prometheus monitoring"
pkg_upstream_url=http://prometheus.io
pkg_origin=fastrobot
pkg_version=1.6.1
pkg_maintainer="Lamont Lucas <lamont@fastrobot.com>"
pkg_license=('Apache-2.0')
pkg_bin_dirs=(bin)
pkg_source=github.com/prometheus/prometheus/cmd/prometheus
pkg_scaffolding=core/scaffolding-go

pkg_exports=(
  [port-http]=listening_port
)
pkg_exposes=(port-http)
#pkg_svc_run="prometheus -config.file=${pkg_svc_config_path}/prometheus.yml \
#-web.listen-address :${cfg.ports.http} "

#do_before() {
#  mkdir -p ${HAB_CACHE_SRC_PATH}/${pkg_dirname}/src
#}

#do_build() {
#  make
#  # return 0
#}

#do_install() {
#  attach
#  mkdir -p ${pkg_prefix}/prom
#  cp ${HAB_CACHE_SRC_PATH}/${pkg_dirname}.linux-amd64/prometheus $pkg_prefix/prom/prometheus
#  #cp ${HAB_CACHE_SRC_PATH}/${pkg_dirname}.linux-amd64/prometheus.yml $pkg_svc_config_path/prometheus.yml
#}
