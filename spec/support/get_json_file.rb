require "json"
module Support
  module GetJsonFile
    FIXTURE_PATH = File.join("spec/fixtures")

    def get_value_from_json(filename)
      file = read_file(filename)
      data = JSON.load file
    end

    def read_file(filename)
      File.read(File.join(FIXTURE_PATH, "#{filename}.json"))
    end
  end
end