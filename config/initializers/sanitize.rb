# frozen_string_literal: true

def sanitize_fragment(fragment)
  sanitize_wrapper.fragment(fragment.to_s.strip)
end

def sanitize_wrapper
  @sanitize_wrapper ||= Sanitize.new(remove_contents: true)
end
