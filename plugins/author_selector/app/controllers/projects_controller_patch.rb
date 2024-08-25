module AuthorSelector
  module Patches
    module ProjectsControllerPatch
      def self.included(base)
        base.class_eval do
          before_action :add_author_to_project, only: [:create, :update]
        end
      end

      def add_author_to_project
        binding.break
        if params[:project] && params[:project][:author_id].present?
          @project.author_id = params[:project][:author_id]
        end
      end
    end
  end
end

ProjectsController.include AuthorSelector::Patches::ProjectsControllerPatch
