module FormattedErrors

  def errors_to_sentence
    if errors.present?
      [self.class.model_name.human, self.errors.full_messages.to_sentence.downcase].compact.join(' ')
    end
  end

end