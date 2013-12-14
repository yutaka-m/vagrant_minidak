#
# Cookbook Name:: mini-dak
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

user "ftpmaster"

packages = ["apt-utils","procmail","ssh","wget","bzip2"]
packages.each do |p|
  package p 
end

directory "/srv/ftp.example.org/bin" do
  recursive true
end

git "/srv/ftp.example.org/bin" do
  repo "git://git.hadrons.org/git/debian/mini-dak.git"
end

execute "./archive-setup" do
  cwd "/srv/ftp.example.org/bin"
end

execute "chown -R ftpmaster:ftpmaster /srv/ftp.example.org"


