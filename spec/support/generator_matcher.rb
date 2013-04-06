
RSpec::Matchers.define :contain_text do |expected_file_text|


  match do |file_path|
    if file_path
      File.readlines(file_path).any? {|line| line.include?(expected_file_text)}
    else
      false
    end
  end

  #

  failure_message_for_should do |file_path|
    "expected that the file #{file_path}
    would contain text #{expected_file_text}"
  end

end

