class ChatroomPolicy < ApplicationPolicy
  # [...]

  def show?
    return true
  end

  def create?
    return true
  end
end
