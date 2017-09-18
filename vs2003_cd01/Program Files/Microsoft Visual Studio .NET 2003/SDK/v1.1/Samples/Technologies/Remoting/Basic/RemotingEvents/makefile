all: EventSink EventFire EventRegistration Client

EventSink::
  cd EventSink
  nmake -a all
  cd ..

EventFire::
  cd EventFire
  nmake -a all
  cd ..

EventRegistration::
  cd EventRegistration
  nmake -a all
  cd ..

Client::
  cd Client
  nmake -a all
  cd ..

run:
  cd EventSink
  start EventSinkHost
  cd..
  cd EventFire
  start EventFireHost
  cd ..
  cd EventRegistration
  EventRegistration
  cd ..
  cd client 
  Client
  cd ..