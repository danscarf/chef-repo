#
# Cookbook:: webapp_frontend
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

include_recipe 'java'

['net-tools'].each do |p|
    package p do
      action :install
    end
  end

user node['tomcat']['tomcat_user']

group node['tomcat']['tomcat_group'] do
  members node['tomcat']['tomcat_user']
  action :create
end

tomcat_install node['tomcat1']['name'] do
  tarball_uri 'http://archive.apache.org/dist/tomcat/tomcat-8/v8.5.38/bin/apache-tomcat-8.5.38.tar.gz'
  verify_checksum false # Don't do this in Prod
  install_path node['tomcat1']['base_dir']
end

template node['tomcat1']['base_dir'] + 'conf/server.xml' do
    source 'server.xml.erb'
    owner node['tomcat']['tomcat_user']
    group node['tomcat']['tomcat_group']
    mode '0644'
    variables(
      port_number: node['tomcat1']['port_number'],
      shutdown_port_number: node['tomcat1']['shutdown_port_number']
      )
  end

  template node['tomcat1']['base_dir'] + 'bin/setenv.sh' do
    source 'setenv.sh.erb'
    owner node['tomcat']['tomcat_user']
    group node['tomcat']['tomcat_group']
    mode '0644'
    variables(
      min_heap: node['tomcat1']['min_heap'],
      max_heap: node['tomcat1']['max_heap'],
      max_permgen: node['tomcat1']['max_permgen']
    )
  end

cookbook_file node['tomcat1']['base_dir'] + 'webapps/sample.war' do
    owner node['tomcat']['tomcat_user']
    mode '0644'
    source 'sample.war'
  end
  
tomcat_service node['tomcat1']['name'] do
  action [:start, :enable]
  env_vars [
      { 'CATALINA_BASE' => node['tomcat1']['base_dir'] },
      { 'CATALINA_PID' => node['tomcat1']['base_dir'] + 'bin/non_standard_location.pid' }
    ]
  sensitive true
end

# Tomcat_2
tomcat_install node['tomcat2']['name'] do
  tarball_uri 'http://archive.apache.org/dist/tomcat/tomcat-8/v8.5.38/bin/apache-tomcat-8.5.38.tar.gz'
  verify_checksum false # Don't do this in Prod
  install_path node['tomcat2']['base_dir']
end

template node['tomcat2']['base_dir'] + 'conf/server.xml' do
    source 'server.xml.erb'
    owner node['tomcat']['tomcat_user']
    group node['tomcat']['tomcat_group']
    mode '0644'
    variables(
      port_number: node['tomcat2']['port_number'],
      shutdown_port_number: node['tomcat2']['shutdown_port_number']
      )
  end

template node['tomcat2']['base_dir'] + 'bin/setenv.sh' do
  source 'setenv.sh.erb'
  owner node['tomcat']['tomcat_user']
  group node['tomcat']['tomcat_group']
  mode '0644'
  variables(
    min_heap: node['tomcat2']['min_heap'],
    max_heap: node['tomcat2']['max_heap'],
    max_permgen: node['tomcat2']['max_permgen']
  )
end

cookbook_file node['tomcat2']['base_dir'] + 'webapps/sample.war' do
    owner node['tomcat']['tomcat_user']
    mode '0644'
    source 'sample.war'
end
  
tomcat_service node['tomcat2']['name'] do
  action [:start, :enable]
  env_vars [
      { 'CATALINA_BASE' => node['tomcat2']['base_dir'] },
      { 'CATALINA_PID' => node['tomcat2']['base_dir'] + 'bin/non_standard_location.pid' }
    ]
  sensitive true
end

# Tomcat 3
tomcat_install node['tomcat3']['name'] do
  tarball_uri 'http://archive.apache.org/dist/tomcat/tomcat-8/v8.5.38/bin/apache-tomcat-8.5.38.tar.gz'
  verify_checksum false # Don't do this in Prod
  install_path node['tomcat3']['base_dir']
end

template node['tomcat3']['base_dir'] + 'conf/server.xml' do
    source 'server.xml.erb'
    owner node['tomcat']['tomcat_user']
    group node['tomcat']['tomcat_group']
    mode '0644'
    variables(
      port_number: node['tomcat3']['port_number'],
      shutdown_port_number: node['tomcat3']['shutdown_port_number']
      )
  end

  template node['tomcat3']['base_dir'] + 'bin/setenv.sh' do
    source 'setenv.sh.erb'
    owner node['tomcat']['tomcat_user']
    group node['tomcat']['tomcat_group']
    mode '0644'
    variables(
      min_heap: node['tomcat3']['min_heap'],
      max_heap: node['tomcat3']['max_heap'],
      max_permgen: node['tomcat3']['max_permgen']
    )
  end

cookbook_file node['tomcat3']['base_dir'] + 'webapps/sample.war' do
    owner node['tomcat']['tomcat_user']
    mode '0644'
    source 'sample.war'
  end
  
tomcat_service node['tomcat3']['name'] do
  action [:start, :enable]
  env_vars [
      { 'CATALINA_BASE' => node['tomcat3']['base_dir'] },
      { 'CATALINA_PID' => node['tomcat3']['base_dir'] + 'bin/non_standard_location.pid' }
    ]
  sensitive true
end

# Tomcat 4
tomcat_install node['tomcat4']['name'] do
  tarball_uri 'http://archive.apache.org/dist/tomcat/tomcat-8/v8.5.38/bin/apache-tomcat-8.5.38.tar.gz'
  verify_checksum false # Don't do this in Prod
  install_path node['tomcat4']['base_dir']
end

template node['tomcat4']['base_dir'] + 'conf/server.xml' do
    source 'server.xml.erb'
    owner node['tomcat']['tomcat_user']
    group node['tomcat']['tomcat_group']
    mode '0644'
    variables(
      port_number: node['tomcat4']['port_number'],
      shutdown_port_number: node['tomcat4']['shutdown_port_number']
      )
  end

  template node['tomcat4']['base_dir'] + 'bin/setenv.sh' do
    source 'setenv.sh.erb'
    owner node['tomcat']['tomcat_user']
    group node['tomcat']['tomcat_group']
    mode '0644'
    variables(
      min_heap: node['tomcat4']['min_heap'],
      max_heap: node['tomcat4']['max_heap'],
      max_permgen: node['tomcat4']['max_permgen']
    )
  end

cookbook_file node['tomcat4']['base_dir'] + 'webapps/sample.war' do
    owner node['tomcat']['tomcat_user']
    mode '0644'
    source 'sample.war'
  end
  
tomcat_service node['tomcat4']['name'] do
  action [:start, :enable]
  env_vars [
      { 'CATALINA_BASE' => node['tomcat4']['base_dir'] },
      { 'CATALINA_PID' => node['tomcat4']['base_dir'] + 'bin/non_standard_location.pid' }
    ]
  sensitive true
end
