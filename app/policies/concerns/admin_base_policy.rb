# Default policies when a model is available for admin only
module AdminBasePolicy
  extend ActiveSupport::Concern

  included do |klass|
    # rubocop:disable Lint/ConstantDefinitionInBlock, Style/ClassAndModuleChildren
    class klass::Scope < klass::Scope
      def resolve
        scope.all if user
      end
    end
    # rubocop:enable Lint/ConstantDefinitionInBlock, Style/ClassAndModuleChildren

    def index?
      user
    end

    def show?
      user
    end

    def create?
      user
    end

    def new?
      user
    end

    def update?
      user
    end

    def edit?
      user
    end

    def destroy?
      user
    end
  end
end
