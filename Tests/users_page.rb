class UsersPage

# 1. CSS Selectors
SUCCESS_BANNER = {id: "flash_success"}

attr_reader :driver # to use the driver instance throughout this class

# 2. Class Methods
def initialize(driver) # constructor
    # the 'driver' instance will be passed through the attr_reader
    @driver = driver
end

def get_banner_text()
    # this will return a text value
    banner = @driver.find_element(SUCCESS_BANNER)
    banner_text = banner.text # to grab the text from the banner element
end

end