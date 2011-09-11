atom_feed do |feed|
  feed.title(@title)
  feed.updated(@notes.first.created_at)
  @notes.each do |note|
    feed.entry(note) do |entry|
      entry.title(note.title)
      entry.content(note.html, :type => 'html')

      entry.author do |author|
        author.name(note.user.email)
      end
    end
  end
end
