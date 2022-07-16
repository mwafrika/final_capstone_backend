require 'test_helper'

class Api::V1::PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_post = api_v1_posts(:one)
  end

  test 'should get index' do
    get api_v1_posts_url
    assert_response :success
  end

  test 'should get new' do
    get new_api_v1_post_url
    assert_response :success
  end

  test 'should create api_v1_post' do
    assert_difference('Api::V1::Post.count') do
      post api_v1_posts_url, params: { api_v1_post: { content: @api_v1_post.content, title: @api_v1_post.title } }
    end

    assert_redirected_to api_v1_post_url(Api::V1::Post.last)
  end

  test 'should show api_v1_post' do
    get api_v1_post_url(@api_v1_post)
    assert_response :success
  end

  test 'should get edit' do
    get edit_api_v1_post_url(@api_v1_post)
    assert_response :success
  end

  test 'should update api_v1_post' do
    patch api_v1_post_url(@api_v1_post),
          params: { api_v1_post: { content: @api_v1_post.content, title: @api_v1_post.title } }
    assert_redirected_to api_v1_post_url(@api_v1_post)
  end

  test 'should destroy api_v1_post' do
    assert_difference('Api::V1::Post.count', -1) do
      delete api_v1_post_url(@api_v1_post)
    end

    assert_redirected_to api_v1_posts_url
  end
end
