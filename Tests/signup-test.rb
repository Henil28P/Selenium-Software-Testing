require "selenium-webdriver" # introduce the driver to use the WebDriver API library
require "rspec"
require_relative "signup_page.rb" # to use the signup page object in this test
require_relative "users_page.rb"

# Create unique usernames to avoid error of locating same element - change email, username, password fields and also modify expected value for username in the banner
# --> Create a timestamp variable and assign it to the end of those fields, then append it to the end of the username, email and expected banner text fields
timestamp = Time.now.to_i
# Value of the timestamp variable represents the epic (number of seconds elapsed since Jan 1st 1970) and append this to the username, email, expected banner text fields

username = "user #{timestamp}"
email = "user#{timestamp}@test.com"
password = "password"
expected_banner_text = "Welcome to the alpha blog user #{timestamp}"

# It's necessary to search for elements in the webpage before interacting with them and performing actions
# find_element is the primary method of the SearchContext class

# Use the "id" locator to find the element on the web page
# 2. Drive actions on the above elements found - send keys to the username, email and password fields and finally finish by clicking the 'submit' button

# TEST: Sign up for blog
# To use rspec-core, add a 'describe' block which describes what the test is doing (describing a blog application for this project)
describe "Blog application" do
    # describe what the focus of this test is (ie. signing up a new user)
    describe "Sign up to the blog application" do
        # it block to describe the purpose of this test which is to confirm that a new user has signed up successfully
        it "confirm that a user can successfully sign up" do

            # Step 1: Use the above driver - use @driver to change from scope of driver variable from local to global context (making it an instance variable to be accessible everywhere throughout the class)
            @driver = Selenium::WebDriver.for :remote, desired_capabilities: :chrome  # set up a new instance of the remote web driver (instead of the browser name, it can be the version, or screen resolution)

            @driver.navigate.to "https://selenium-blog.herokuapp.com/signup" # the driver navigates to the webpage link of the Heroku app passed to it

            # declare 'signup' variable to use the signup page object
            signup = SignupPage.new(@driver)

            # Use the 'signup' page object on the methods of the page
            signup.enter_username(username)
            signup.enter_email(email)
            signup.enter_password(password)
            signup.submit_form()

            # Choose the expectation that the user's account was created successfully after form submission
            # --> Get the message from the 'banner' element which confirms that the user is signed up
            users = UsersPage.new(@driver) # allows to call methods on page object directly
            banner_text = users.get_banner_text()
            expect(banner_text).to eq(expected_banner_text) # to expect the actual banner text equals the expected banner text

            # Step 3: close out the driver session
            @driver.quit
        end
    end
end