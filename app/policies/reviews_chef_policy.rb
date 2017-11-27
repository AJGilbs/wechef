class ReviewsChefPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    # user.is_a?(Restaurant)
    true
  end

  def new
    create?
  end

end
