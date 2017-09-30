# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    lines = tsv.split("\n")
    keys = lines[0].split("\t")
    result = []
    lines[1..lines.length].each do |line|
      structure = {}
      line.split("\t").each_with_index { |item, index| structure[keys[index]] = item}
      result << structure
    end
    @data = result
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    keys = []
    @data[0].each_key { |key| keys << key }
    result = keys.join("\t") + "\n"
    @data.each do |obj|
      line = []
      obj.each_key { |key| line << obj[key] }
      result << line.join("\t") + "\n"
    end
    result
  end
end
