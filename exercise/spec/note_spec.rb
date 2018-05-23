require_relative '../lib/note'
require_relative '../lib/notebook'
require_relative './assert'

note = Note.new('this is the title', 'this is the content')

p '#title returns the title'
Assert.isEqual(note.title, 'this is the title')

p '#content returns the content'
Assert.isEqual(note.content, 'this is the content')

note.add_tag('this is the tag')

p '#tag adds a tag'
Assert.isEqual(note.add_tag('this is the tag'), 'this is the tag')

p '#add_note adds a note'
notebook = Notebook.new
notebook.add_note(note)
Assert.isEqual(notebook.notes[-1], note)

p '#search_by_tag returns a note with a matching tag'
note2 = Note.new('this is the title2', 'this is the content')
note3 = Note.new('this is the title3', 'this is the content')
note4 = Note.new('this is the title4', 'this is the content')
note2.add_tag('monkey')
note3.add_tag('lion')
note4.add_tag('monkey')
notebook = Notebook.new
notebook.add_note(note2)
notebook.add_note(note3)
notebook.add_note(note4)
Assert.contains(notebook.search_by_tag('lion'), note3)

p '#search_by_tag returns all of the notes with a matching tag'
note2 = Note.new('this is the title2', 'this is the content2')
note3 = Note.new('this is the title3', 'this is the content3')
note4 = Note.new('this is the title4', 'this is the content4')
note2.add_tag('monkey')
note3.add_tag('lion')
note4.add_tag('monkey')
notebook = Notebook.new
notebook.add_note(note2)
notebook.add_note(note3)
notebook.add_note(note4)
Assert.contains(notebook.search_by_tag('monkey'), note2 && note4)

# Feature test
p notebook.search_by_tag('monkey')
p notebook.search_by_tag('lion')
