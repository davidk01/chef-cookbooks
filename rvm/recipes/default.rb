#
# Cookbook Name:: juju
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# don't know why we need this but rvm complains if we don't have them
bash "apt-update" do
  code <<-EOF
    apt-get update
  EOF
end

['curl', 'build-essential', 'libyaml-dev', 'libsqlite3-dev', 'libxml2-dev',
 'libxslt-dev', 'libgdbm-dev', 'ncurses-dev', 'automake',
 'libffi-dev'].each { |p| package p }

bash "install-rvm-ruby1.9.3-bundler-chef-librarian" do
  code <<-EOF
    curl -L https://get.rvm.io | bash
    source /etc/profile.d/rvm.sh
    rvm install 1.9.3
    gem install bundler
    gem install chef
    gem install librarian
  EOF
end
