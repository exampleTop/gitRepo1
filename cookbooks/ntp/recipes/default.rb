#
# Cookbook Name:: ntp
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#
#
package "ntp" do
  action [:install]
end

ntp_server = data_bag_item('ntp', 'default_server')

template "/etc/ntp.conf" do
  source "ntp.conf.erb"
  variables( :ntp_server => ntp_server['value'] )
  notifies :restart, "service[ntpd]"
end

service "ntpd" do
  action [:enable,:start]
end
