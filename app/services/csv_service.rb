# frozen_string_literal: true

###
# Class to process a CSV file
###
class CsvService
  require "csv"

  def initialize(csv_file: "csv/serials.csv")
    @csv_file = csv_file
  end

  ###
  # process each line of a csv and write to the new file
  ###
  def process
    CSV.open("csv/output.csv", "w", write_headers: true, headers: %w[serial_number the_date num]) do |csv|
      CSV.foreach(@csv_file, "r:bom|utf-8", **default_read_csv_options) do |row|
        parse_row!(row)
        pp row
        csv << row
        break
      end
    end
  end

  private

  def default_read_csv_options
    {
      converters: [
        lambda { |s| s.strip rescue s },
        :integer,
      ],
      headers: true,
      skip_blanks: true
    }
  end

  ###
  # parse each row
  ###
  def parse_row!(row)
    parse_serial_number!(row)
  end

  ###
  # extract serial number
  ###
  def parse_serial_number!(row)
    return unless (match = /iotsg-\d{6}-\d{8}\z/.match(row["serial_number"]))

    row["serial_number"] = match[0]
  end
end
