require 'test_helper'

class CreatArticleTest < ActionDispatch::IntegrationTest

  def setup
  @user = User.create(username: "john", email: "john@example.com", password: "password", admin: true)  
  end

  test 'get new category form and create category' do
    sign_in_as(@user,"password")
    get new_article_path
    assert_template 'articles/new'
    assert_difference 'Article.count', 1 do
      post articles_path, params: {article: {title: "First article", description: "Article about sports",
      category_id: [1] }}
      follow_redirect!
    end
    assert_template 'articles/show'
    assert_match "First article", response.body
  end
end  
