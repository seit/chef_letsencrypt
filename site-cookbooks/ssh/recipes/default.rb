#
# Cookbook Name:: ssh
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
user "uentseit" do
  home "/home/uentseit"
  password "uentseit"
  supports :manage_home => true
  action [:create, :manage]
end

sshkeygen "uentseit" do
  username "uentseit"
  passphrase "uentseit"
end

