require File.expand_path('../../test_helper', __FILE__)

class ProjectsControllerPatchTest < ActionController::TestCase
  fixtures :projects, :users

  def setup
    @controller = ProjectsController.new
    @request = ActionController::TestRequest.create
    @response = ActionController::TestResponse.create

    ProjectsController.include AuthorSelector::Patches::ProjectsControllerPatch
  end

  def test_should_set_author_on_project_create
    user = User.find(1)

    post :create, params: {
      project: {
        name: 'Test Project',
        identifier: 'test-project',
        author_id: user.id
      }
    }

    project = Project.last
    assert_equal user, project.author
  end

  def test_should_update_author_on_project_update
    project = Project.find(1)
    user = User.find(1)

    patch :update, params: {
      id: project.id,
      project: { author_id: user.id }
    }

    project.reload
    assert_equal user, project.author
  end
end
