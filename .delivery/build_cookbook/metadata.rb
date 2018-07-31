name 'nginx'
maintainer 'The Authors'
maintainer_email 'you@example.com'
license 'all_rights'
version '0.1.1'
chef_version '>= 12.14' if respond_to?(:chef_version)

depends 'delivery-truck'
