require "test_helper"
require "capybara-screenshot/minitest"
require "pry"

class UserNavbar < ActionDispatch::IntegrationTest
  setup do
    @test_user = users :confirmedUser

    user_sign_in @test_user

    visit new_event_path
  end
  
  test 'navitem buttons and logout' do
    assert page.has_css? '.nav-item'
    assert page.has_link? 'Home'
    find_link('Home', match: :first).click
    assert_equal '/', current_path
    assert page.has_link? 'About Us'
    find_link('About Us', match: :first).click
    assert_equal '/getinvolved', current_path
    assert page.has_link? 'Have us on your Podcast'
    find_link('Have us on your Podcast', match: :first).click
    assert_equal '/drschaeferspeaking', current_path
    assert page.has_link? 'Join the Team'
    find_link('Join the Team', match: :first).click
    assert_equal '/jointheteam', current_path
    assert page.has_link? 'Study Hall'
    find_link('Study Hall', match: :first).click
    assert_equal '/studyhall', current_path
    assert page.has_link? 'FAQ'
    find_link('FAQ', match: :first).click
    assert_equal '/faq', current_path
    assert page.has_link? 'Terms of Service'
    find_link('Terms of Service', match: :first).click
    assert_equal '/tos', current_path
    click_on class: 'btn btn-default', match: :first

    assert '/', current_path
  end
  
  test 'view profile page and logout' do
    # assert text, "#{@user.name}"
    assert page.has_css? '.dropdown'
    assert page.has_css? '.dropdown-menu'
    assert page.has_link? 'View Profile'
    find_link('View Profile',match: :first).click
    assert_equal "/#{@test_user.permalink}", current_path
    click_on class: 'btn btn-default', match: :first

    assert '/', current_path
  end
  
  test 'view control panel page and logout' do
    # assert text, "#{@user.name}"
    assert page.has_css? '.dropdown'
    assert page.has_css? '.dropdown-menu'
    assert page.has_link? 'Control Panel'
    find_link('Control Panel',match: :first).click
    assert_equal "/#{@test_user.permalink}/controlpanel", current_path
    click_on class: 'btn btn-default', match: :first

    assert '/', current_path
  end
  
  private
  def teardown
  end
end
