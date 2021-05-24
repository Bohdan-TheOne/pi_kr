class CommentPolicy < ApplicationPolicy
    def create?
        logged_in?
    end    
    
    def destroy?
        commenter? || admin? || moder?
    end

private
    def commenter?
        return false unless user
        record.commenter == user.username
    end
end