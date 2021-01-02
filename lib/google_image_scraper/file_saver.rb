require 'base64'
require 'digest'

# File saving and convert.
module GoogleImageScraper
  class FileSaver
    def save(src)
      binary, extname = if src.start_with?('data:')
                          to_file_from_base64(src)
                        else
                          to_file_from_url(src)
                        end
      fname = "#{Digest::MD5.hexdigest(src)[0...10]}.#{extname}"

      File.write(File.join(dir.path, fname), binary)
    end

    private

    def dir
      return @dir if @dir

      dirname = Time.new.strftime('%Y%m%d%H%M')
      Dir.mkdir(dirname) unless Dir.exist? dirname
      @dir = Dir.open(dirname)
    end

    def to_file_from_base64(src)
      data_prefix, base64 = src.split(',')
      [Base64.decode64(base64), "data.#{data_extname(data_prefix)}"]
    end

    def to_file_from_url(url)
      meta = URI.open(url)
      [meta.read, meta.content_type.split('/').last]
    end

    def data_extname(data_prefix)
      %r{data:image/(?<extname>.+);base64} =~ data_prefix
      extname
    end
  end
end
