require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'
require 'rake'
require 'pathname'

Cucumber::Rake::Task.new(:dashboard_dev_chrome) do |t|
  t.profile = 'dashboard_dev_chrome'
end

Cucumber::Rake::Task.new(:groups_dev_chrome) do |t|
  t.profile = 'groups_dev_chrome'
end

Cucumber::Rake::Task.new(:knowledge_dev_chrome) do |t|
  t.profile = 'knowledge_dev_chrome'
end

Cucumber::Rake::Task.new(:foundation_dev_chrome) do |t|
  t.profile = 'foundation_dev_chrome'
end

Cucumber::Rake::Task.new(:icon_awards_dev_chrome) do |t|
  t.profile = 'icon_awards_dev_chrome'
end

Cucumber::Rake::Task.new(:news_dev_chrome) do |t|
  t.profile = 'news_dev_chrome'
end

Cucumber::Rake::Task.new(:navigation_dev_chrome) do |t|
  t.profile = 'navigation_dev_chrome'
end

Cucumber::Rake::Task.new(:retail_cases_dev_chrome) do |t|
  t.profile = 'retail_cases_dev_chrome'
end

Cucumber::Rake::Task.new(:tools_dev_chrome) do |t|
  t.profile = 'tools_dev_chrome'
end

Cucumber::Rake::Task.new(:rerun_dev_chrome) do |t|
  t.profile = 'rerun_dev_chrome'
end

def run_rake_task(name)
  begin
    Rake::Task[name].invoke
  rescue Exception
    return false
  end
  true
end

task :run, [:task_name, :rerun_task_name] do |t, args|
  run_successful = run_rake_task(args[:task_name])
  rerun_successful = true
  unless run_successful
    rerun_successful = run_rake_task(args[:_rerun_task_name])
  end
  exit false unless run_successful || rerun_successful
end



#-----------------------------------------------------------

Cucumber::Rake::Task.new(:dashboard_dev_ie) do |t|
  t.profile = 'dashboard_dev_ie'
end

Cucumber::Rake::Task.new(:groups_dev_ie) do |t|
  t.profile = 'groups_dev_ie'
end

Cucumber::Rake::Task.new(:knowledge_dev_ie) do |t|
  t.profile = 'knowledge_dev_ie'
end

Cucumber::Rake::Task.new(:foundation_dev_ie) do |t|
  t.profile = 'foundation_dev_ie'
end

Cucumber::Rake::Task.new(:icon_awards_dev_ie) do |t|
  t.profile = 'icon_awards_dev_ie'
end

Cucumber::Rake::Task.new(:news_dev_ie) do |t|
  t.profile = 'news_dev_ie'
end

Cucumber::Rake::Task.new(:navigation_dev_ie) do |t|
  t.profile = 'navigation_dev_ie'
end

Cucumber::Rake::Task.new(:retail_cases_dev_ie) do |t|
  t.profile = 'retail_cases_dev_ie'
end

Cucumber::Rake::Task.new(:tools_dev_ie) do |t|
  t.profile = 'tools_dev_ie'
end

#-----------------------------------------------------------

Cucumber::Rake::Task.new(:dashboard_test_chrome) do |t|
  t.profile = 'dashboard_test_chrome'
end

Cucumber::Rake::Task.new(:groups_test_chrome) do |t|
  t.profile = 'groups_test_chrome'
end

Cucumber::Rake::Task.new(:knowledge_test_chrome) do |t|
  t.profile = 'knowledge_test_chrome'
end

Cucumber::Rake::Task.new(:foundation_test_chrome) do |t|
  t.profile = 'foundation_test_chrome'
end

Cucumber::Rake::Task.new(:icon_awards_test_chrome) do |t|
  t.profile = 'icon_awards_test_chrome'
end

Cucumber::Rake::Task.new(:news_test_chrome) do |t|
  t.profile = 'news_test_chrome'
end

Cucumber::Rake::Task.new(:navigation_test_chrome) do |t|
  t.profile = 'navigation_test_chrome'
end

Cucumber::Rake::Task.new(:retail_cases_test_chrome) do |t|
  t.profile = 'retail_cases_test_chrome'
end

Cucumber::Rake::Task.new(:tools_test_chrome) do |t|
  t.profile = 'tools_test_chrome'
end

#-----------------------------------------------------------

Cucumber::Rake::Task.new(:dashboard_test_ie) do |t|
  t.profile = 'dashboard_test_ie'
end

Cucumber::Rake::Task.new(:groups_test_ie) do |t|
  t.profile = 'groups_test_ie'
end

Cucumber::Rake::Task.new(:knowledge_test_ie) do |t|
  t.profile = 'knowledge_test_ie'
end

Cucumber::Rake::Task.new(:foundation_test_ie) do |t|
  t.profile = 'foundation_test_ie'
end

Cucumber::Rake::Task.new(:icon_awards_test_ie) do |t|
  t.profile = 'icon_awards_test_ie'
end

Cucumber::Rake::Task.new(:news_test_ie) do |t|
  t.profile = 'news_test_ie'
end

Cucumber::Rake::Task.new(:navigation_test_ie) do |t|
  t.profile = 'navigation_test_ie'
end

Cucumber::Rake::Task.new(:retail_cases_test_ie) do |t|
  t.profile = 'retail_cases_test_ie'
end

Cucumber::Rake::Task.new(:tools_test_ie) do |t|
  t.profile = 'tools_test_ie'
end