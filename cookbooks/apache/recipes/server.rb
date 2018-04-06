package 'httpd'

package 'tree'

package 'vim'


remote_file '/var/www/html/anil.png' do
        source 'https://en.wikipedia.org/wiki/Taj_Mahal'
end

template '/var/www/html/index.html' do
        source 'index.html.erb'
end


  
bash "inline script" do
        user "root"
        code "mkdir -p /var/www/mysites/ && chown -R apache /var/www/mysites/"
#       not_if '[-d /var/www/mysites/ ]'
        not_if do
          File.directory?('/var/www/mysites')
        end
end

=begin
execute "run script" do
        user "root"
        command './myscript.sh'
        not_if
end
=end

directory "var/www/mysites" do
        owner 'apache'
        recursive true
end


service 'httpd' do
  action [ :enable,:start ]
end
