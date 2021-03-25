# Copyright Elasticsearch B.V. and/or licensed to Elasticsearch B.V. under one
# or more contributor license agreements. Licensed under the Elastic License;
# you may not use this file except in compliance with the Elastic License.

require "digest"


module LogStash module Filters
  module Geoip
    GZ_EXT = 'tgz'.freeze
    DB_EXT = 'mmdb'.freeze
    DB_PREFIX = 'GeoLite2-'.freeze

    module Util
      def get_file_path(filename)
        ::File.join(@vendor_path, filename)
      end

      def file_exist?(path)
        !path.nil? && ::File.exist?(path) && !::File.empty?(path)
      end

      def md5(file_path)
        file_exist?(file_path) ? Digest::MD5.hexdigest(::File.read(file_path)): ""
      end

      # replace *.mmdb to *.tgz
      def get_gz_name(filename)
        filename[0...-(DB_EXT.length)] + GZ_EXT
      end
    end
  end
end end