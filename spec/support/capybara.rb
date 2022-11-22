Capybara.register_driver :remote_chrome do |app|
  url = 'http://chrome:4444/wd/hub'
  capabilities = ::Selenium::WebDriver::Remote::Capabilities.chrome(
    'goog:chromeOptions' => {
      'args' => [
        'no-sandbox',
        'headless',
        'disable-gpu',
        'window-size=1680,1050'
      ]
    }
  )
  Capybara::Selenium::Driver.new(app, browser: :remote, url: url, capabilities: capabilities)
end

RSpec.configure do |config|
  config.before(:each, type: :system) do
    driven_by :rack_test
  end
  # ブラウザテストの設定
  config.before(:each, type: :system, js: true) do
    # CI用のセッティング
    if ENV['CIRCLECI'].present?
      driven_by :selenium_chrome_headless
    # コンテナ開発環境でのセッティング  
    else
      driven_by :remote_chrome
      Capybara.server_host = IPSocket.getaddress(Socket.gethostname)
      Capybara.server_port = 4444
      Capybara.app_host = "http://#{Capybara.server_host}:#{Capybara.server_port}"
    end
  end
end