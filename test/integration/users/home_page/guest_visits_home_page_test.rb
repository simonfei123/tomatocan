require 'test_helper'

class GuestVisitsHomePageTest < ActionDispatch::IntegrationTest
	setup do
    	visit root_path
	end

	test "should go to home after clicking on home" do
  		within("div#globalNavbar.collapse.navbar-collapse") do
  			click_on('Home', match: :first)
  			assert_equal current_path, root_path
  		end	
  	end

  test "should go to about page when clicking about in header"  do
  	within("div#globalNavbar.collapse.navbar-collapse") do
  		click_on('About Us', match: :first)
  		assert_equal current_path, '/getinvolved'
  	end	
  end 

  test "should go to dr.schaefer page when clicking on have us on podcast in header"  do
  	within("div#globalNavbar.collapse.navbar-collapse") do
  		click_on("Have us on your Podcast", match: :first)
  		assert_equal current_path, '/drschaeferspeaking'
  	end	
  end 

  #jtt = join the team
  test "should go to jtt page when clicking on jtt in header"  do
    within("div#globalNavbar.collapse.navbar-collapse") do
      click_on("Join the Team", match: :first)
      assert_equal current_path, '/jointheteam'
    end 
  end 

  test "should go to study hall page when clicking study hall in header"  do
    within("div#globalNavbar.collapse.navbar-collapse") do
      click_on("Study Hall", match: :first)
      assert_equal current_path, '/studyhall'
    end 
  end

  test 'should go to sign up page when clicking sign up button' do
    assert page.has_css? '.navbar-btn'
    assert page.has_link? 'Sign Up'
    find_link('Sign Up', match: :first).click
    assert_equal current_path, '/signup'
  end

  test 'should go to sign in page when clicking sign in button' do
    assert page.has_css? '.navbar-btn'
    assert page.has_link? 'Sign In'
    find_link('Sign In', match: :first).click
    assert_equal '/login', current_path
  end 

  test "should go to FAQ page when clicking FAQ in footer"  do
    within("div#footer.row") do
      click_on("FAQ", match: :first)
      assert_equal current_path, '/faq'
    end 
  end

  #ToS = Terms of Service
  test "should go to ToS page when clicking ToS in footer"  do
    within("div#footer.row") do
      click_on("Terms of Service", match: :first)
      assert_equal current_path, '/tos'
    end 
  end

  test "should have a link for emailing website in footer" do
    within("div#footer.row") do
      assert page.has_link?('info@ThinQ.tv')
    end
  end

  test "images should exist for social media sharing buttons in footer" do
    email_img = "//footer/div/div/div[3]/div/a[4]/img"
    linkedin_img = "//footer/div/div/div[3]/div/a[3]/img"
    facebook_img = "//footer/div/div/div[3]/div/a[1]/img"
    twitter_img = "//footer/div/div/div[3]/div/a[2]/img"

    assert page.has_xpath? email_img
    assert page.has_xpath? linkedin_img
    assert page.has_xpath? facebook_img
    assert page.has_xpath? twitter_img
  end

  test "links should exist for social media sharing buttons in footer" do
    linkedin_link = "/html/body/footer/div/div/div[3]/div/a[3]"
    facebook_link = "/html/body/footer/div/div/div[3]/div/a[1]"
    twitter_link = "/html/body/footer/div/div/div[3]/div/a[2]"
    email_link = "/html/body/footer/div/div/div[3]/div/a[4]"

    assert page.has_xpath? linkedin_link
    assert page.has_xpath? facebook_link
    assert page.has_xpath? twitter_link
    assert page.has_xpath? email_link
  end
  		click_on('About', match: :first)
  		assert_equal current_path, getinvolved_path
  	end	
  end
end
