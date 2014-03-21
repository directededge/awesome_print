# Copyright (c) 2014 Scott Wheeler
#
# Awesome Print is freely distributable under the terms of MIT license.
# See LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
module AwesomePrint
  module ActiveResource

    def self.included(base)
      base.send :alias_method, :cast_without_active_resource, :cast
      base.send :alias_method, :cast, :cast_with_active_resource
    end

    # Add ActiveResource class names to the dispatcher pipeline.
    #------------------------------------------------------------------------------
    def cast_with_active_resource(object, type)
      if defined?(::ActiveResource) && object.is_a?(::ActiveResource::Base)
        :active_resource_instance
      else
        cast_without_active_resource(object, type)
      end
    end

    private

    # Format ActiveResource instance object.
    #------------------------------------------------------------------------------
    def awesome_active_resource_instance(object)
      "#{object} " << awesome_hash(object.attributes)
    end
  end
end

AwesomePrint::Formatter.send(:include, AwesomePrint::ActiveResource)
