class RequestPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.is_a?(Restaurant)
        scope.where(restaurant: user)
      elsif user.is_a?(Chef)
        scope.where('? = ANY (chef_ids)', user.id)
      end
    end
  end

  def create?
    user.class.name == 'Restaurant'
  end

  def show?
    true
  end

  def update?
    destroy?
  end

  def show?
    true
  end

  def destroy?
    record.chef_ids.include?(user.id)
  end

  def cancel_all?
    record.restaurant_id == user.id && user.class.name == 'Restaurant'
  end

  def cancel_chef?
    cancel_all?
  end

end
