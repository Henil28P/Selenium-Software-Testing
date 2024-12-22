require "selenium-webdriver" # introduce the driver to use the WebDriver API library

# TEST: Sign up for blog
# Step 1: Use the above driver
driver = Selenium::WebDriver.for :chrome # set up a new instance of thee chrome driver (instead of the browser name, it can be the version, or screen resolution)
driver.navigate.to "https://selenium-blog.herokuapp.com/signup" # the driver navigates to the webpage link of the Heroku app passed to it

# Step 2: after creating a driver, it's necessary to search for elements in the webpage before interacting with them and performing actions
# find_element is the primary method of the SearchContext class

# Step 3: close out the driver session
driver.quit