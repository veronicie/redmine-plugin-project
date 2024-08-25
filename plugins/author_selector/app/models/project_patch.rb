module AuthorSelector
  module Patches
    module ProjectPatch
      def self.included(base)
        base.class_eval do
          belongs_to :author, class_name: 'User', foreign_key: 'author_id'
        end
      end
    end
  end
end

Project.include AuthorSelector::Patches::ProjectPatch
