# A sample Guardfile
# More info at https://github.com/guard/guard#readme

group "testing" do
  guard 'test' do
    watch(%r{^lib/(.+)\.rb$})     { |m| "test/#{m[1]}_test.rb" }
    watch(%r{^test/.+_test\.rb$})
    watch('test/test_helper.rb')  { "test" }

    # Rails example
    watch(%r{^app/models/(.+)\.rb$})                   { |m| "test/unit/#{m[1]}_test.rb" }
    watch(%r{^app/controllers/(.+)\.rb$})              { |m| "test/functional/#{m[1]}_test.rb" }
    watch(%r{^app/views/.+\.rb$})                      { "test/integration" }
    watch('app/controllers/application_controller.rb') { ["test/functional", "test/integration"] }
  end
end

group "cucumber" do
  guard 'spork' do
    watch('config/application.rb')
    watch('config/environment.rb')
    watch('features/support/env.rb')
    watch(%r{^config/environments/.+\.rb$})
    watch(%r{^config/initializers/.+\.rb$})
    watch('spec/spec_helper.rb')
  end
  guard 'cucumber', :cli => '--no-profile --color --format pretty --strict RAILS_ENV=test' do
    watch(%r{^features/.+\.feature$})
    watch(%r{^features/support/.+$})                      { 'features' }
    watch(%r{^features/step_definitions/(.+)_steps\.rb$}) { |m| Dir[File.join("**/#{m[1]}.feature")][0] || 'features' }
  end

end

group "backend" do
  guard 'rails', :port => 4500 do
    watch('Gemfile.lock')
    watch(%r{^lib/.*})
    watch(%r{^config/.*rb})
    watch(%r{^config/initializers/.*rb})
  end

  guard 'bundler' do
    watch('Gemfile')
  end
end

group "backend-martin" do
  guard 'rails', :port => 3500 do
    watch('Gemfile.lock')
    watch(%r{^(config|lib)/.*})
  end

  guard 'bundler' do
    watch('Gemfile')
  end
end

