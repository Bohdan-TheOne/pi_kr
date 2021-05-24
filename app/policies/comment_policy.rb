class CommentPolicy < ApplicationPolicy
    def create?
        !!user
    end    
    
    def destroy?
        commenter?
    end

private
    def commenter?
        return false unless user
        record.commenter == user.username
    end
end