class SignupPage

    # assign values for each of the CSS selector constants as a Hashmap
# 1. CSS selectors - declare all CSS selectors as constants with descriptive names that represent each element
USERNAME_FIELD = {id: "user_username"}
EMAIL_FIELD = {id: "user_email"}
PASSWORD_FIELD = {id: "user_password"}
SUBMIT_BUTTON = {id: "submit"}

# attr_reader to allow the webdriver instance variable to be created in the test and used throughout the class
attr_reader :driver # takes a driver object

# 2. Class Methods
def initialize(driver) # constructor
    @driver = driver
end

# methods for better readability and produce clean test code
def enter_username(username):
    username_field = @driver.find_element(USERNAME_FIELD)
    username_field.send_keys(username)
end

def enter_email(email):
    email_field = @driver.find_element(EMAIL_FIELD)
    email_field.send_keys(email)
end

def enter_password(password):
    password_field = @driver.find_element(PASSWORD_FIELD)
    password_field.send_keys(password)
end

def submit_form()
    submit_button = @driver.find_element(SUBMIT_BUTTON)
    submit_button.click
end

end