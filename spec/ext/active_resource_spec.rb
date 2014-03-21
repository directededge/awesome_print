require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

begin
  require 'active_resource'
  require 'awesome_print/ext/active_resource'

  if defined?(ActiveRecord::VERSION::MAJOR) && ActiveRecord::VERSION::MAJOR >= 2
    class User < ActiveResource::Base ; end

    describe "AwesomePrint/ActiveResource" do

      describe "ActiveResource instance" do
      end
    end
  end
rescue LoadError => error
  puts "Skipping ActiveResource specs: #{error}"
end
