def create_visitor
  @visitor ||= { :email => "example@example.com",
    :password => "changeme", :password_confirmation => "changeme" }
end

def create_user
  create_visitor
  @user = FactoryGirl.create(:user, @visitor)
end

def sign_in
  visit '/users/sign_in'
  fill_in "user_email", :with => @visitor[:email]
  fill_in "user_password", :with => @visitor[:password]
  click_button "Log in"
  expect(page).to have_content("Signed in successfully.")
end

Given(/^I sucessfully logged in as a User$/) do
  create_user
  sign_in
end

Given(/^I am on the home page$/) do
  visit '/'
end

When(/^I change the genre$/) do
  select "Fantasy", from: 'genre_genre_name'
end

Then(/^I should see a video on that category$/) do
  expect(page).to have_content("(Fantasy)")
end

When(/^I click on Next New Video$/) do
  @first_video = page.find("#current_video_name").text
  click_button "Next New Video"
end

Then(/^I should see a new video on the screen$/) do
  within '#current_video' do
    expect(page).not_to have_content(@first_video)
  end
  @new_video = page.find("#current_video_name").text
end

Then(/^The previous video should be listed as viewed$/) do
  within '#previously_viewed_list' do
    expect(page).to have_content(@first_video)
  end
end

Then(/^I should see no videos on the Previously Viewed list$/) do
  within '#previously_viewed_list' do
    message = "There aren't previously viewed videos"
    expect(page).to have_content(message)
  end
end

When(/^I view all the videos for a genre$/) do
  genre = 'Fantasy'
  select genre, from: 'genre_genre_name'
  Video.where(genre: genre).each do |video|
    @user.video_views.create!(title: video.title, genre: video.genre, video: video)
  end
end

Then(/^I should see a message saying there are no more videos$/) do
  click_button "Next New Video"
  within '#current_video' do
    message = "We ran out of new videos for this category :("
    expect(page).to have_content(message)
  end
end
