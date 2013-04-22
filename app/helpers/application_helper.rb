module ApplicationHelper

  def gsheet_to_hash(sheet)

    headers = sheet.rows[0]

    items = sheet.rows[1, sheet.rows.length].map { |row|
      #date = Date.strptime(row[3], '%m/%d/%Y')

      {
        headers[0].downcase => row[0],
        headers[1].downcase => row[1],
        headers[2].downcase => row[2],
        headers[3].downcase => row[3],
        headers[4].downcase => row[4]
      }
    }

    items

  end

  def t_meta_interpolation(name, hash)
    instance_variable_set("@#{name}_interpolation", hash)
  end

  def t_meta(name)
    interpolation_data = instance_variable_get("@#{name}_interpolation") || {}
    t("meta.#{controller_path.gsub("/", ".")}.#{action_name}.#{name}",
      interpolation_data.merge({ :default => t("meta.defaults.#{name}") }))
  end

  def combine_news(axis_feed, other_feed)
    combined = Array.new

    axis_feed.items.each do |story|
      combined.push({
        :url => story.link,
        :title => story.title,
        :source => 'AxisPhilly',
        :published => story.pubDate
      })
    end

    other_feed.items.each do |story|
      combined.push({
        :url => story.source.url,
        :title => story.title,
        :source => story.source.content,
        :published => story.pubDate
      })
    end

    combined.sort_by! { |k| k[:published] }.reverse!
  end

end
