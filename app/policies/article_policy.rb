class ArticlePolicy < ApplicationPolicy
    def index?
        true
    end
    
    def show?
        author? || record.public?
    end
    
    def update?
        author?
    end
    
    def destroy?
        author?
    end

private
    def author?
        record.author_id == user.id
    end
end