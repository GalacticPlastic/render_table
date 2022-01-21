require 'erb'

class RenderTable::Base
  include ERB::Util

  attr_accessor :records, :header, :html, :override, :table_id, :table_class, :options
  attr_accessor :cell_records, :header, :html, :override, :table_id, :table_class, :timestamps, :options

  def self.render(args = {})
    table = new(args)
    yield table
    table.render.html_safe
  end

  def initialize(args = {})
    @records     = args[:records]     || []
    @header      = args[:header]      || []
    @override    = args[:override]    || {}
    @table_id    = args[:table_id]    || RenderTable.config.table_id
    @table_class = args[:table_class] || RenderTable.config.table_class
    @html        = args[:html]        || RenderTable.config.html
    @timestamps ||= true
    @options = args[:options]
  end

  def rows
    RenderTable::Row.rows_for_table(self)
  end

  def render
    ERB.new(template, 0, '%<>').result(binding)
  end

  def context
    binding
  end

  private

  def table
    self
  end

  def options_cell(record, index)
    RenderTable::Options.generate(table, @options, record, index)
  end

  def template
    <<-ERB
      <% table.rows.each do |row| %>
      <% row.cells.each do |cell| %>
      <%= cell.value %>
      <% end %>
      <% end %>
    ERB
  end
end
