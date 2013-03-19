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

end
