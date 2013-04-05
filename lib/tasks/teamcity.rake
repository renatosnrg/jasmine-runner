namespace :jasmine do
  namespace :phantom do
    desc "Run specs using PhantomJS for Teamcity CI"
    task :teamcity => 'jasmine:require' do
      require 'jasmine/runner/reporters/teamcity'

      reporter = Jasmine::Runner::Reporters::Teamcity.new
      reporter.start
      sh(reporter.command)
    end
  end
end