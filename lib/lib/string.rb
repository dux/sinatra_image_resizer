unless ''.respond_to?(:resized)
  class ::String
    # "http://foo.jpg".resized({ s: "222x222", q: 80 }
    # "http://foo.jpg".resized("^200x200")
    # "http://foo.jpg".resized(200)
    # "http://foo.jpg".resized_image - expcts size as param
    def resized opts=nil
      opts   ||= {}
      opts     = { s: opts } unless opts.is_a?(Hash)
      opts[:i] = dup

      RackImageResizer.resize_url opts
    end
  end
end
