
RSpec::Matchers.define :contain_text do |file_path_string|


  match do |actual_file_text_on_disk|
    if file_path_string
      File.readlines(actual_file_text_on_disk).any? {|line| line.include?(file_path_string)}
    else
      false
    end
  end

  #

  failure_message_for_should do |actual_file_text_on_disk|
    "expected that the file #{actual_file_text_on_disk}
    would contain text #{File.readlines(actual_file_text_on_disk)}"
  end

end

