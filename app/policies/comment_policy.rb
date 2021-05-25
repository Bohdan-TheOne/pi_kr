class CommentPolicy < ApplicationPolicy
    def create?
        logged_in?
    end    
    
    def destroy?
        commenter? || admin? || moder? || article_author?
    end

private
    def commenter?
        return false unless user
        record.commenter == user.username
    end

    def article_author?
        return false unless user
        record.article.author_id == user.id
    end
end