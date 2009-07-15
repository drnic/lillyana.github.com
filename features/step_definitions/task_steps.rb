When /^I run task "rake ([^\"]*)"$/ do |task|
  FileUtils.chdir(ROOT) do
    `rake #{task}`
  end
end

Given /^folder "([^\"]*)" is removed$/ do |name|
  FileUtils.rm_rf(File.join(ROOT, name))
end

Then /^folder "([^\"]*)" is created$/ do |name|
  File.should be_exist(File.join(ROOT, name))
end

