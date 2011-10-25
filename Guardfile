# A sample Guardfile
# More info at https://github.com/guard/guard#readme

group "testing" do
end
guard 'minitest' do
  watch(%r|^test/test_(.*)\.rb|)
  watch(%r|^lib/(.*)([^/]+)\.rb|)     { |m| "test/#{m[1]}test_#{m[2]}.rb" }
  watch(%r|^test/(.*)([^/]+)\.rb|)     { |m| "test/#{m[1]}#{m[2]}.rb" }
  watch(%r|^test/test_helper\.rb|)    { "test" }
  watch(%r|^app/controllers/(.*)\.rb|) { |m| "test/functional/#{m[1]}_test.rb" }
  watch(%r|^app/models/(.*)\.rb|)      { |m| "test/unit/#{m[1]}_test.rb" }
end


guard 'bundler' do
  watch('Gemfile')
end
