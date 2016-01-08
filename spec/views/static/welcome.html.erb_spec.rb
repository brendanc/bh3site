require 'spec_helper'

  VALID_JSON = '  {
   "kind": "calendar#event",
   "etag": "\"2892629564664000\"",
   "id": "1l9b73b3ankvdl1h9me5dg87ns_20151227T193000Z",
   "status": "confirmed",
   "htmlLink": "https://www.google.com/calendar/event?eid=MWw5YjczYjNhbmt2ZGwxaDltZTVkZzg3bnNfMjAxNTEyMjdUMTkzMDAwWiBib3N0b25oYXNoQG0",
   "created": "2015-10-12T14:50:26.000Z",
   "updated": "2015-10-31T18:06:22.332Z",
   "summary": "Saint Stephen\'s Day Trail",
   "description": "The hash, the hash, the king of all runs\nSt. Stephen\'s Day was caught in the square\\nWiki the hare, our fear was great,\\nGave us a good trail, or suffer thy fate\\n\\nWe followed the hare three miles or more\\nThree miles of more, three miles or more\\nThrough hedges and ditches and heaps of snow\\nAt three o\'clock in the evening\\n\\nHasher, Hasher, what is your drink?\\nIt\'s in the beer that I love best\\nIt\'s in the beer, the IPA, \\nAnd all the hash does downs-downs for me\\n\\nAs I went out to scout the trail\\nI saw a mark upon the road\\nUp with me whistle and gave it wail\\nAnd followed the marks to drink with you all\\n\\nI have a pony keg under me arm\\nA tuppence or penny will do it no harm\\nFor we are the hashers who came your way\\nTo bring in the beer on St. Stephen\'s Day",
   "location": "John Harvard\'s, 33 Dunster St, Cambridge, MA 02138, United States",
   "creator": {
    "email": "pgoldin@gmail.com",
    "displayName": "Paul Goldin"
   },
   "organizer": {
    "email": "bostonhash@gmail.com",
    "displayName": "Boston Hasher",
    "self": true
   },
   "start": {
    "dateTime": "2015-12-27T14:30:00-00:00"
   },
   "end": {
    "dateTime": "2015-12-27T17:30:00-00:00"
   },
   "recurringEventId": "1l9b73b3ankvdl1h9me5dg87ns",
   "originalStartTime": {
    "dateTime": "2015-12-27T14:30:00-00:00"
   },
   "iCalUID": "1l9b73b3ankvdl1h9me5dg87ns@google.com",
   "sequence": 0
  }'

describe 'static/welcome.html.erb' do
  it 'displays next event title correctly' do
  	ev = Event.new JSON.parse(VALID_JSON)
    assign(:next_hash,ev)

    render
    rendered.should match(/Saint Stephen/)

  end

    it 'displays the map' do
  	ev = Event.new JSON.parse(VALID_JSON)
    assign(:next_hash,ev)

    render
    rendered.should have_selector("#map-canvas")

  end
  
  it 'converts urls to proper external links' do
  	ev = Event.new JSON.parse(VALID_JSON.sub(/The hash,/m,'http://google.com')) 
    assign(:next_hash,ev)

    render
 #   puts rendered
    rendered.should have_selector("a[href='http://google.com'][target='_blank']")

  end


end