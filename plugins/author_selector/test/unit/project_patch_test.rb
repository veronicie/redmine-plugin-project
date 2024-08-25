require File.expand_path('../../test_helper', __FILE__)

class ProjectPatchTest < ActiveSupport::TestCase
  fixtures :projects, :users

  def setup
    Project.include AuthorSelector::Patches::ProjectPatch
  end

  def test_project_should_have_author_association
    project = Project.new(name: 'Test Project', identifier: 'test-project')
    user = User.find(1)

    project.author = user
    assert_equal user, project.author
  end
end
