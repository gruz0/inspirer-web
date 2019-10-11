# frozen_string_literal: true

def sanitize_fragment(fragment)
  sanitize_wrapper.fragment(fragment.strip)
end

def sanitize_wrapper
  @sanitize_wrapper ||= Sanitize.new(remove_contents: true)
end
