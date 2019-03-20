default['java']['jdk_version'] = '8'
default['java']['set_etc_environment'] = 'true'


default['tomcat']['tomcat_user'] = 'usr_tomcat'
default['tomcat']['tomcat_group'] = 'grp_tomcat_owner'

# Instance 1
default['tomcat1']['name'] = 'tomcat_1'
default['tomcat1']['base_dir'] = '/opt/tomcat_1/'
default['tomcat1']['port_number'] = '8001'
default['tomcat1']['shutdown_port_number'] = '8011'
default['tomcat1']['min_heap'] = '64'
default['tomcat1']['max_heap'] = '128'
default['tomcat1']['max_permgen'] = '256'

# Instance 2
default['tomcat2']['name'] = 'tomcat_2'
default['tomcat2']['base_dir'] = '/opt/tomcat_2/'
default['tomcat2']['port_number'] = '8002'
default['tomcat2']['shutdown_port_number'] = '8012'
default['tomcat2']['min_heap'] = '64'
default['tomcat2']['max_heap'] = '128'
default['tomcat2']['max_permgen'] = '256'

# Instance 3
default['tomcat3']['name'] = 'tomcat_3'
default['tomcat3']['base_dir'] = '/opt/tomcat_3/'
default['tomcat3']['port_number'] = '8003'
default['tomcat3']['shutdown_port_number'] = '8013'
default['tomcat3']['min_heap'] = '64'
default['tomcat3']['max_heap'] = '128'
default['tomcat3']['max_permgen'] = '256'

# Instance 3
default['tomcat4']['name'] = 'tomcat_4'
default['tomcat4']['base_dir'] = '/opt/tomcat_4/'
default['tomcat4']['port_number'] = '8004'
default['tomcat4']['shutdown_port_number'] = '8014'
default['tomcat4']['min_heap'] = '64'
default['tomcat4']['max_heap'] = '128'
default['tomcat4']['max_permgen'] = '256'
