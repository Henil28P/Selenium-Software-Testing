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

* Information about the drivers:

- All drivers need to be downloaded and put into the system's path (`$ export PATH=$PATH:/path/to/driver_name`) before being used.
- API functionality are same between all drivers
- Some drivers are faster than others in speed and might differ slightly in syntax or functionality as they are all managed by different organisations.

1. ChromeDriver - maintained by Google and is a standalone server which implements the WebDriver wire protocol for Chromium. It's available on Chrome for Android and Desktop.
2. geckodriver - owned by Mozilla and written in Rust (Mozilla's open-source programming language).
3. EdgeDriver - maintained by Microsoft and written in C# and supports all language bindings.
4. SafariDriver - maintained by web developer experience team at Apple. It is built with WebKit (an open-source web browser and application engine).

# Selenium Grid

- It's a proxy server to run tests against remote browser instances
- It distributes the load of testing across several servers
- It allows for multiple configurations of test to be run across different browsers, platforms and devices - all at the same time.

2 main components to the grid:

1. Hub - central server for the grid. It is the point where tests are executed.

- The hub is launched on a single machine and connects to 1 or more nodes that are registered to it. There can only be 1 hub in a grid instance (can be a Windows, macOS, or Linux platform).

2. Node - servers that are registered to a hub. Nodes receive test scripts from the hub and run them.

- Nodes don't have to be the same platform as the hub and can be a mix and match of different platforms. Nodes have different Selenium instances installed on them as well as the browsers that will be used for testing. There are usually many nodes registered to 1 hub in a grid instance.

Hub and Node Relationship:

- Once a test is executed on the hub, the hub searches through its list of registered servers one-by-one trying to find an available node matching the criteria provided.
- If a match node is found, the hub sends test scripts to that node.

Selenium Grid Benefits:

- Smart routing between hub and nodes
- Allows multiple tests to be run concurrently
- Managed multiple connections

The grid requires set up and maintenance of the hub and nodes.

# Setting up the hub

- Use of Selenium standalone server is required (Selenium grid support comes built into the Selenium standalone server)
- Download the latest Selenium standalone server at: https://www.selenium.dev/downloads
- Then, scroll to "Selenium Server (Grid)" section and click the latest stable version to download (4.27.0)
- Once downloaded, use the Selenium standalone server to start the hub on your local machine by the following commands:

1. `$ cd ~/Downloads`
2. `$ java -jar selenium-server-4.27.0.jar hub` - to start the hub in the grid

# Configuring nodes

- Follow the steps in your terminal to start the node in the hub:

1. `$ cd ~/Downloads`
2. `$ java -jar selenium-server-4.27.0.jar node --hub http://<hub_ip_generated_from_earlier_command_when_starting_hub>:<port>`

# Running tests after setting up hub and configuring nodes

Change the signup-test.rb file by using the remote driver
`driver = Selenium::WebDriver.for :remote, desired_capabilities: :chrome`
where desired_capabilities define the browser name, or its version, screen resolution, etc.

What to consider next:

- Where and how to maintain infrastructure moving forward (realistically, when using the grid, it is hosted either on physical or virtual servers dedicated to this 1 purpose).

1. Physical Servers: Using physical servers can be good if there are machines readily available or can be set up and configured easily. Physical servers should only be dedicated for testing.
2. Virtual Servers: Services like Amazon EC2 are great at being able to easily spin up and manage virtual servers.

# Pros and Cons of Selenium grid

Selenium grid solves the problems of being able to run tests across many platforms and browsers in a nice delegated distribution.

1. Pros

- Scales well by distributing tests on several machines, running tests in parallel.
- It is a central way to manage multiple environments making it easy to run the test against a large combination of browsers and OS's.
- Grid is smart by being able to find specified nodes quickly and easily and routes tests scripts to the correct node.

2. Cons

- Maintainability is required to keep the hub and nodes running smoothly.
- For better maintenance: enable warnings and logs for easy debugging, create scripts to manage grid (such as starting and stopping hubs and nodes).
- Performance - tests running can start to degrade over time
- For better performance: explicitly kill browser after tests, restart nodes periodically and restart server after several test runs or on a nightly basis.

# Writing effective tests

1. Clean Test Code

- Readable tests
- Minimise lines of codes per test class and not repeat steps over and over
- Reusable steps (variables and methods)

Page Object Pattern - design pattern for Selenium tests
Idea: A class for each page in the app to model its behaviour
Each page class has:

- Test Selectors
- Test Methods

In a test, a new page object can be created and that object can then call that class's methods directly.
Goals of Page Object model - separation of test and code and more maintainable test code by being able to go directly to the page object class and update things there.

# Test Organisation

- Important to think about as Selenium test suites grow and scale.

Best practices to follow to keep tests organised:

1. Each test class focuses on 1 area of the application - allows for easy navigation and the ability to find specific tests quickly and helps to keep test classes shorter and more concise.
2. Group tests by feature - have sub-suites based on feature (allows for total separation of concerns and allows for more flexibility with running multiple suites of tests).
3. Document tests - README, outlines details about tests, helps those unfamiliar with tests.

- The Test Pyramid

* It's the ideal way to structure tests
* Different levels of testing
* It's a visual representation intended to guide the coverage of tests that should exist at various levels within the application.

It consists of 3 layers:

1. Unit (bottom):

- Hit the server, verify a result and test a single function.
- They run in seconds
- There should always be most unit tests

2. Integration (middle) - service-level tests:

- Involve testing multiple services and how they work together
- Create their own data and are a bit slower
- They run in the range of tens of seconds
- There should be a decent amount of integration-level tests

3. UI (top):

- This is where Selenium tests belong
- End-to-end user workflows are tested and mimic user actions
- Run through the browser and are the slowest tests (minutes to run)
- Most volatile

Takeaway:

- Selenium UI tests are valuable, but remember to consider other types of testing.
- Avoid having a test suite full of Selenium tests.
