package 'nginx'

service 'nginx' do
  supports status: true, restart: true, reload: true
  action [ :enable, :start ]
end

template '/etc/nginx/sites-available/nginx.conf' do
  source 'nginx.conf.erb'
  variables proxy_port: node['nginx']['proxy_port']
  notifies :restart, 'service[nginx]'
end

link '/etc/nginx/sites-enabled/nginx.conf' do
  to '/etc/nginx/sites-available/nginx.conf'
  notifies :restart, 'service[nginx]'
end

link '/etc/nginx/sites-enabled/default' do
  action :delete
  notifies :restart, 'service[nginx]'
end
