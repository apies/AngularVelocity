
RSpec::Matchers.define :be_a_file_containing_text do |expected_file_text|


  match do |file_path|
    if file_path
      if File.file?(file_path)
        File.readlines(file_path).any? {|line| line.include?(expected_file_text)}
      else
        @file_not_found = true
        false
      end
    else
      false
    end
  end

  #

  failure_message_for_should do |file_path|
    unless @file_not_found
      if file_path
        "expected that the file #{file_path}
        would contain text #{expected_file_text}"
      else
        "something weird here!"
      end
    else
      "the file at path #{file_path} does not exist"
    end
  end

end

