class BaseRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @elements = []
    @next_id = 1
    load_csv
  end

  def add(new_element)
    new_element.id = @next_id
    @next_id += 1
    @elements << new_element
    store_csv
  end

  def all
    @elements
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      build_instance(row)
    end
    @next_id = @elements.empty? ? 1 : @elements.last.id + 1
  end

  def store_csv
    CSV.open(@csv_file, "wb") do |csv|
      store_infos(csv)
    end
  end
end
