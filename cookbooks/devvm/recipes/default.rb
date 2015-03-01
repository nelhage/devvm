#
# Cookbook Name:: devvm
# Recipe:: default
#

package 'build-essential'
package 'openjdk-7-jre-headless'
package 'python-pexpect'
package 'gcc-multilib'
package 'gdb'
package 'tmux'
package 'sbuild'
package 'schroot'
package 'ubuntu-dev-tools'
package 'python-software-properties'
package 'software-properties-common'

group 'sbuild' do
  action :modify
  append true
  members 'vagrant'
end
