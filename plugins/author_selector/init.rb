Redmine::Plugin.register :author_selector do
  name 'Author Selector Plugin'
  author 'veronicie'
  description 'This plugin adds an option to select an author for a project from already registered users.'
  version '0.0.1'
  requires_redmine version_or_higher: '4.0.0'
end

Rails.configuration.to_prepare do
  require_dependency 'projects_controller_patch'
  require_dependency 'project_patch'
  ProjectsController.include AuthorSelector::ProjectsControllerPatch
  Project.include AuthorSelector::ProjectPatch
end
