[![Code Climate](https://codeclimate.com/github/gregnar/snow_meet_rails/badges/gpa.svg)](https://codeclimate.com/github/gregnar/snow_meet_rails)



#### notes from testing api session
- including array of associated model ids in the original payload
- including root elements in json index payloads ("users": [] instead of just [])
- name association id collections with the model name rather than _ids ("comments" vs "comment_ids" even though it's just an array of ids)
- the api doesnt really reference the existence of join tables
- supporting batch fetches on the api server side (GET /comments?ids[]=56&ids[]=58)


Groups
Users -- once i fetch users, i should already get the ids of its associated objects, so i dont need to know about the join records
      \
       ----- RSVPs
Trips /

