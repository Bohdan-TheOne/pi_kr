require "test_helper"

class ArticleTest < ActiveSupport::TestCase
    test "article without title" do
        article = Article.new
        assert_not article.save, "Saved the article without a title"
    end
            
    test "article with nil data" do
        article = Article.new({title: nil, body: nil})
        assert_not article.save, "Saved the article with nil data"
    end
            
    test "article with nil title" do
        article = Article.new({title: nil, body: @correct_body})
        assert_not article.save, "Saved the article with nil title"
    end
            
    test "article with nil body" do
        article = Article.new({title: @correct_title, body: nil})
        assert_not article.save, "Saved the article with nil body"
    end
            
    test "article with short data" do
        article = Article.new({title: @short_title, body: @short_body})
        assert_not article.save, "Saved the article with short data"
    end
            
    test "article with short title" do
        article = Article.new({title: @short_title, body: @correct_body})
        assert_not article.save, "Saved the article with short title"
    end
            
    test "article with short body" do
        article = Article.new({title: @correct_title, body: @short_body})
        assert_not article.save, "Saved the article with short body"
    end
            
    test "article with long data" do
        article = Article.new({title: @long_title, body: @long_body})
        assert_not article.save, "Saved the article with long data"
    end
            
    test "article with long title" do
        article = Article.new({title: @long_title, body: @correct_body})
        assert_not article.save, "Saved the article with long title"
    end
            
    test "article with long body" do
        article = Article.new({title: @correct_title, body: @long_body})
        assert_not article.save, "Saved the article with long body"
    end



private
    @empty_title = ''
    @empty_body = ''
    @short_title = 'A'
    @short_body = 'body'
    @correct_title = 'Article'
    @correct_body = 'Some article text'
    @long_title = 'Way too looooooooooooooooooooong article name'
    @long_body = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. \
        Etiam auctor rutrum condimentum. In nec semper diam. Pellentesque \
        habitant morbi tristique senectus et netus et malesuada fames ac \
        turpis egestas. Maecenas tincidunt consectetur auctor. Morbi in \
        mattis nisl, vitae pellentesque urna. Mauris mi.'
end
