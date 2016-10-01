# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format

  def take_tsv(tsv)
    @data= Hash.new
    rows = tsv.split("\n").map { |line| line.split("\t") }
    headers = rows.first
    data = rows[1..-1]
    key_values = data.map do |row|
      row.map.with_index { |cell, i| [headers[i], cell] }.to_h
    end
      @data = key_values
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    keys = @data[0].keys
    #Use reduce to turn keys into tsv format
    keys_to_tsv = @data[0].keys.reduce { |key1, key2| key1 + "\t" + key2 } + "\n"


    value_to_tsv = @data.map.with_index { |hash, index| hash.values.reduce { |value1, value2| value1 + "\t" + value2 } }
    value_to_tsv.map! { |value| value + "\n"  }

    return keys_to_tsv + value_to_tsv.join
  end
end

