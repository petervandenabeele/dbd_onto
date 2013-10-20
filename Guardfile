guard :rspec, :all_after_pass => true, :all_on_start => true do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
  watch('lib/dbd_onto.rb')      { "spec" }
  watch(%r{^data/})             { "spec" }
end

