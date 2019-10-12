# frozen_string_literal: true

module NotesSanitizer
  extend ActiveSupport::Concern

  included do
    private

    before_validation :sanitize_notes

    def sanitize_notes
      self.notes = sanitize_html(notes)
    end
  end
end
