# Parse custom feed elements for external stories feed
Feedzirra::Feed.add_common_feed_entry_element("source", :as => :source)
Feedzirra::Feed.add_common_feed_entry_element("source_url", :as => :source_url)