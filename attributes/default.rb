include_attribute "kagent"
include_attribute "hops"

default['flink']['user']                             = node['install']['user'].empty? ? "flink" : node['install']['user']
default['flink']['user_id']                          = '1510'
default['flink']['user-home']                        = "/home/#{node['flink']['user']}"

default['flink']['version_base']                     = "1.9"
default['flink']['version_bugfix']                   = "2.1"
default['flink']['version']                          = node['flink']['version_base'] + "." + node['flink']['version_bugfix']
default['flink']['scala_version']                    = "2.11"

default['flink']['dir']                              = node['install']['dir'].empty? ? "/srv" : node['install']['dir']
default['flink']['base_dir']                         = "#{node['flink']['dir']}/flink"
default['flink']['home']                             = "#{node['flink']['dir']}/flink-#{node['flink']['version']}"
default['flink']['url']                              = node['download_url'] + "/flink-" + node['flink']['version'] + "-bin" + "-scala_" + node['flink']['scala_version'] + ".tgz"
default['flink']['conf_dir']                         = "#{node['flink']['base_dir']}/conf"
default['flink']['lib_dir']                          = "#{node['flink']['base_dir']}/lib"
default['flink']['logs_dir']                         = "#{node['flink']['base_dir']}/log"

# Data volume directories
default['flink']['data_volume']['root_dir']          = "#{node['data']['dir']}/flink"
default['flink']['data_volume']['logs_dir']          = "#{node['flink']['data_volume']['root_dir']}/log"
default['flink_hs']['data_volume']['root_dir']       = "#{node['data']['dir']}/flinkhistoryserver"
default['flink_hs']['data_volume']['logs_dir']       = "#{node['flink_hs']['data_volume']['root_dir']}/logs"

default['flink']['historyserver']['local_dir']       = "#{node['flink']['dir']}/flinkhistoryserver"
default['flink']['historyserver']['remote_dir']      = "#{node['hops']['hdfs']['user_home']}/#{node['flink']['user']}/completed-jobs"
default['flink']['historyserver']['logs']            = "#{node['flink']['historyserver']['local_dir']}/logs"
default['flink']['historyserver']['tmp']             = "#{node['flink']['historyserver']['local_dir']}/tmp"
default['flink']['historyserver']['environment']     = "#{node['flink']['historyserver']['local_dir']}/historyserver.env"


default['flink']['checksum']                         = ""
default['flink']['beamjobserver_name']               = "beam-runners-flink-#{node['flink']['version_base']}-job-server-#{node['conda']['beam']['version']}.jar"
default['flink']['beamjobserver_jar']['url']         = "#{node['download_url']}/beam/#{node['conda']['beam']['version']}/#{node['flink']['beamjobserver_name']}"
default['flink']['beam_boot']['url']                 = "#{node['download_url']}/beam/#{node['conda']['beam']['version']}/boot"
# Custom shaded version of service-discovery-client that excludes jackson from shading
default['flink']['service_discovery_client']['name'] = "service-discovery-client-0.5-SNAPSHOT.jar"
default['flink']['service_discovery_client']['url']  = "#{node['download_url']}/beam/#{node['conda']['beam']['version']}/#{node['flink']['service_discovery_client']['name']}"

default['flink']['mode']                             = "BATCH"
default['flink']['jobmanager']['web_port']           = 8088
default['flink']['jobmanager']['heap_mbs']           = 256
default['flink']['taskmanager']['heap_mbs']          = 512
default['flink']['historyserver']['port']            = 29183

default['flink']['taskmanager']['num_taskslots']     = node['cpu']['total']
default['flink']['parallelization']['degree']        = node['cpu']['total']
default['flink']['webclient_port']                   = 8888
default['flink']['taskmanager']['network_num_buffers']  = 2048
