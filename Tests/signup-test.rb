require "selenium-webdriver" # introduce the driver to use the WebDriver API library
require "rspec"

# TEST: Sign up for blog
# To use rspec-core, add a 'describe' block which describes what the test is doing (describing a blog application for this project)
describe "Blog application" do
    # describe what the focus of this test is (ie. signing up a new user)
    describe "Sign up to the blog application" do
        # it block to describe the purpose of this test which is to confirm that a new user has signed up successfully
        it "confirm that a user can successfully sign up" do
            # Step 1: Use the above driver
            driver = Selenium::WebDriver.for :chrome # set up a new instance of thee chrome driver (instead of the browser name, it can be the version, or screen resolution)
            driver.navigate.to "https://selenium-blog.herokuapp.com/signup" # the driver navigates to the webpage link of the Heroku app passed to it

            # Step 2: after creating a driver, it's necessary to search for elements in the webpage before interacting with them and performing actions
            # find_element is the primary method of the SearchContext class

            # Use the "id" locator to find the element on the web page
            # 2. Drive actions on the above elements found - send keys to the username, email and password fields and finally finish by clicking the 'submit' button

            username_field = driver.find_element(id: "user_username")
            username_field.send_keys("user")

            email_field = driver.find_element(id: "user_email")
            email_field.send_keys("email@test.com")

            password_field = driver.find_element(id: "user_password")
            password_field.send_keys("password")

            submit_button = driver.find_element(id: "submit")
            submit_button.click

            # Choose the expectation that the user's account was created successfully after form submission
            # --> Get the message from the 'banner' element which confirms that the user is signed up
            banner = driver.find_element(id: "flash_success")
            banner_text = banner.text # to grab the text from the banner element
            expect(banner_text).to eq("Welcome to the alpha blog user") # to expect the actual banner text equals the expected banner text

            # Step 3: close out the driver session
            driver.quit
        end
    end
end