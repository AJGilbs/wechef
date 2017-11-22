class RequestPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    user.class.name == 'Restaurant'
  end

  def update?
    destroy?
  end

  def destroy?
    record.chef_ids.include?(user.id)
  end

end
