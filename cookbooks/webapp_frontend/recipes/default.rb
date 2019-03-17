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
  # tomcat_user TOMCATUSER
  # tomcat_group TOMCATGROUP
end

template node['tomcat1']['base_dir'] + 'conf/server.xml' do
    source 'server.xml.erb'
    owner node['tomcat']['tomcat_user']
    group node['tomcat']['tomcat_group']
    mode '0644'
    variables(port_number: node['tomcat1']['port_number'])
  end

remote_file node['tomcat1']['base_dir'] + 'webapps/sample.war' do
    owner node['tomcat']['tomcat_user']
#    group node['tomcat']['tomcat_group']
    mode '0644'
    source 'https://tomcat.apache.org/tomcat-6.0-doc/appdev/sample/sample.war'
    checksum '89b33caa5bf4cfd235f060c396cb1a5acb2734a1366db325676f48c5f5ed92e5'
  end
  
tomcat_service node['tomcat1']['name'] do
  action [:start, :enable]
  env_vars [
      { 'CATALINA_BASE' => node['tomcat1']['base_dir'] },
      { 'CATALINA_PID' => node['tomcat1']['base_dir'] + 'bin/non_standard_location.pid' },
      { 'SOMETHING' => 'some_value' }
    ]
  sensitive true
 #  tomcat_user node['tomcat']['tomcat_user']
 # tomcat_group node['tomcat']['tomcat_group']
end