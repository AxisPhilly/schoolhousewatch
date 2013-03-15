module ApplicationHelper

  def gsheet_to_hash(sheet)

    headers = sheet.rows[0]

    items = sheet.rows[1, sheet.rows.length].map { |row|
      #date = Date.strptime(row[3], '%m/%d/%Y')

      {
        headers[0] => row[0],
        headers[1] => row[1],
        headers[2] => row[2],
        headers[3] => row[3],
        headers[4] => row[4]
      }
    }

    items

  end

end
