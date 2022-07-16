require "application_system_test_case"

class Api::V1::PostsTest < ApplicationSystemTestCase
  setup do
    @api_v1_post = api_v1_posts(:one)
  end

  test "visiting the index" do
    visit api_v1_posts_url
    assert_selector "h1", text: "Posts"
  end

  test "should create post" do
    visit api_v1_posts_url
    click_on "New post"

    fill_in "Content", with: @api_v1_post.content
    fill_in "Title", with: @api_v1_post.title
    click_on "Create Post"

    assert_text "Post was successfully created"
    click_on "Back"
  end

  test "should update Post" do
    visit api_v1_post_url(@api_v1_post)
    click_on "Edit this post", match: :first

    fill_in "Content", with: @api_v1_post.content
    fill_in "Title", with: @api_v1_post.title
    click_on "Update Post"

    assert_text "Post was successfully updated"
    click_on "Back"
  end

  test "should destroy Post" do
    visit api_v1_post_url(@api_v1_post)
    click_on "Destroy this post", match: :first

    assert_text "Post was successfully destroyed"
  end
end
