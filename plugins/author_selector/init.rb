Redmine::Plugin.register :author_selector do
  name 'Author Selector Plugin'
  author 'veronicie'
  description 'This plugin adds the option to select a project author from registered users.'
  version '0.0.1'
  requires_redmine version_or_higher: '4.0.0'
end
