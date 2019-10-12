# frozen_string_literal: true

def html_ipsum(value)
  "#{FFaker::HTMLIpsum.body}#{value}<script>alert('xss');</script>"
end
