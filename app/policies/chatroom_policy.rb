class ChatroomPolicy < ApplicationPolicy
  # [...]

  def show?
    return true
  end
end
