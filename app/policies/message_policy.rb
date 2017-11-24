class MessagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    record.request.restaurant == user ||
    (record.request.chef_ids.include?(user.id) && user.is_a?(Chef))
  end
end
