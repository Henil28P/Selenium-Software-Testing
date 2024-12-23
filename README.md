# Selenium-Software-Testing

Automating key functionalities tests and verification of any web application with Selenium framework to write automated tests and Ruby for supporting the tests structure.

Background:
Selenium is one of the most popular tools for testing web-based applications. It allows QA engineers to write and automate tests across many different browsers and operating systems, without a special scripting language. This project introduces Selenium to new users, covering installation and basic use cases. Find out how to set up the test-writing framework, WebDriver, and Selenium Grid, which allows you to distribute the testing load and run tests against a remote server. Learn best practices to write effective tests using variables and functions, and to organize tests into suites that can scale over time. Instructor Meaghan Lewis—a QA engineer at GitHub—also explains the test pyramid paradigm, which details an ideal way to balance unit, integration, and UI testing.

Selenium is a software testing framework that supports all major programming languages, platforms and browsers. It offers a variety of testing tools for all users and it is compatible with other frameworks and applications and it is an open-source tool making it accessible for everyone.

Ruby is used in this project in order to write and run test examples. Several methods to install Ruby are: Package managers, installers, managers and source. This project uses 'rvm' manager of Ruby to install Ruby.

Installation for Ruby using rvm for Mac:

1. $ \curl -sSL https://get.rvm.io | bash -s stable --> to install the latest stable version of rvm
2. $ rvm --> to see the list of options available for rvm
3. $ rvm install 2.5.1 (or rvm install 3.2.0) to install the Ruby's latest stable version

The sample/exampler website used for this project is: https://selenium-blog.herokuapp.com/signup

1. Selenium WebDriver
   The goal of Selenium WebDriver is to help developers and testers quickly and easily write automated tests. Its goal is to maintain a standardized API that is user-friendly and emulates user actions such as clicking and typing.

Ideal users of WebDriver:
--> Testers who want to save time manually testing.
--> Developers have confidence in testing to know they won't introduce regressions.
--> Those who have the need to test their applications across multiple browsers and platforms.
--> A customizable and powerful framework (ie. WebDriver API)

Selenium WebDriver works using Client-Server communication. When a Selenium test is executed, a new session of the browser driver is created and a browser is launched. For each command in the test script, a request is sent to the WebDriver API. The WebDriver API interprets the request and the step is then executed in the browser driver - which acts as a server - and just waits for the request to come in. Once each step is complete, the response is sent back to the WebDriver API and then back to the test. This process continues until all steps are complete.

WebDriver works with all major supported tech stacks.
--> The languages supported are C, Java, Ruby, Python, JavaScript
--> The platforms supported are macOS, Windows, Linux
--> The browsers supported are Chrome, Firefox, Internet Explorer and Safari

- Each one of the browsers have their own drivers which are maintained by a different browser vendor (own API for each).
  The key idea behind these drivers is that they are written in a language most natural to use for each browser.

Setting up WebDriver
2 tools to install before writing tests

1. Selenium WebDriver as the framework
2. ChromeDriver as the browser driver to run tests in Chrome (there is also geckdriver to run tests in Firefox)

--> Navigate to Selenium website (selenium.dev/downloads)
--> Scroll to and find the "Selenium Client & WebDriver Language Bindings" section
--> Click "download" of Ruby which will navigate you to Selenium-WebDriver Ruby Gems page

- Note that Gems in Ruby are independent Ruby software packages (you can think of them as library or plugin)
- RubyGems is the package management framework
- Each Gem needs to be installed before using it

2 ways to install RubyGems:

1. $ gem install (included in Ruby by default) - install gems from command line, quick and easy. It's able to search for packages available and install the specified software packages and their dependencies.
2. $ bundle install - When gems are installed with the help of their bundler, gems are defined in what's called a GemFile. Then, use bundler to install gems. This is beneficial so that any other individual or system that builds and runs the application will be able to install all the same versions of the gem easily - it is necessary for shared projects.

- This project uses the 2nd way from above which is to use the bundle install.

So copy the GenFile command from the webpage and put it in the GemFile in the project source.

It is important to note that placing the gem in the GemFile doesn't actually install them. To install the manage gem dependencies in this file, we must use the bundler.
To use the bundler, need to first install it in the project directory (do $pwd to verify) and in terminal:

--> $ gem install bundler which will give the latest bundler.
--> After that succeeds, type $ bundle install (and this will go ahead and install your Selenium WebDriver gem).
--> Finally, ensure that you have a browser driver setup (ChromeDriver for this project): $ gem install selenium-webdriver -v 3.142.7 and then $ brew install chromedriver

Using the API:
Ruby API Documentation for using the Selenium WebDriver: https://www.rubydoc.info/gems/selenium-webdriver/0.0.28/Selenium/WebDriver/Driver - has all the classes and methods available to perform actions on the browser.

Breaking down the testing process into 3 steps:

1. Decide what features to automate - requires knowledge of application under test and all of the available functionality.
2. Outline test scenarios that will be automated and the steps of each test - think about inputs/outputs, determine the value of each scenario.
3. Find the elements needed for the test - need to locate all elements used in tests upfront.

# EXAMPLE WORKFLOW: Sign-up workflow of the Selenium Blog Web App for this project

Behavior of sign-up test to be automated:

--> A user needs to navigate to the sign-up form
--> Then, the user needs to fill out their username, email and create a password
--> The user can then submit the form and users are successfully signed up

Process of automating, filling out and submitting the form

1. Find all 4 locators of all web elements to be used in this test (username, email, password, and Sign Up button)

--> Can do the above by "inspecting" elements in the webpage (right-click on any element such as username field and select the "Inspect Element" option from the menu).

It will show the type of element, and also show all locators such as the field's id, class, placeholder, name.

Final step is to confirm that the user is successfully added after signing up by writing an assertion.
--> In order to use assertions, another Ruby library is needed since assertions are not something that is provided either natively in Ruby or by Selenium WebDriver.
The Ruby library of RSpec will be used in this project which is a Behaviour-driven framework for Ruby and offers multiple libraries that can be used to work either together or independently.

--> 2 different libraries will be used to add structure to the tests.

1. RSpec Expectations library (https://rpsec.info/documentation/3.7rspec-expectations) - this library provides an API to express expected outcomes (by equivalence, by identity, by comparisons, by regexp, etc.)
   --> To use RSpec, it first needs to be installed as a 'gem' (go to Ruby gems site for rspec: https://rubygems.org/gems/rspec/versions/3.7.0): copy the gem command to add to the GemFile
   --> After adding the gem command to the GemFile, type $ bundle install - in the project directory path

--> Use the rspec-core library - it provides a BDD format for test classes, as well as a test runner to execute test and provide nicely formatted output.

- Executing the test

* Open the terminal and navigate to project directory
* Then, type `$ rspec signup-test.rb` - tells the test runner (rspec-core) to run each 'it' block within the test file.
