insert into location
(name,address)
values
('test andrews','maple valley'),
('test kenyons','renton');

insert into event
(location_id,date,title)
values
(1,'2024-01-01','test magic1 andrews'),
(1,'2024-01-01','test magic2 andrews'),
(1,'2024-01-01','test multiple andrews'),
(2,'2024-01-01','test magic1 kenyon'),
(2,'2024-01-01','test magic2 kenyon');

insert into object_type
(name,base_table_name)
values
('Location','location'),
('Event','event'),
('Object Type','object_type'),
('Event Activities','event_activities'),
('Event Users','event_users'),
('Event Activities Results','event_activities_results'),
('Activity','activity'),
('Activity Result','activity_result'),
('User','user');

insert into user
(name)
values
('Aaron'),('Andrew'),('Evan'),('James'),('Kenyon');

insert into activity_result
(name,highest_wins)
values
('D20 Result',true),
('Placement',false),
('Points',true);

insert into activity
(name,description,activity_result_id)
values
('Magic - Commander','a game of magic the gathering commander',2),
('Cornhole','A game of cornhole',3),
('Go First D20 Dice Roll','A roll of the dice',1);

insert into notes
(user_id,object_type_id,object_id,note_text)
values
(1,1,1,'andrews house');

insert into event_activities
(name,event_id,activity_id)
values
('Game 1',1,3),
('Game 1',1,1),
('Game 2',1,3),
('Game 2',1,1),
('Game 1',3,3),
('Game 1',3,1),
('Exercise',3,2);

insert into event_users
(event_id,user_id)
values
(1,1),
(1,2),
(1,3),
(1,4),
(1,5),
(3,1),
(3,2),
(3,3),
(3,4),
(3,5);

insert into event_activities_results
(event_activities_id,user_id,activity_result_id,result_value)
values
(1,1,1,5),
(1,2,1,10),
(1,3,1,15),
(1,4,1,20),
(1,5,1,1),
(2,1,2,1),
(2,2,2,2),
(2,3,2,3),
(2,4,2,4),
(2,5,2,5),
(1,5,1,5),
(1,4,1,10),
(1,3,1,15),
(1,2,1,20),
(1,1,1,1),
(2,5,2,1),
(2,4,2,2),
(2,3,2,3),
(2,2,2,4),
(2,1,2,5),
(3,1,1,3),
(3,2,1,8),
(3,3,1,13),
(3,4,1,18),
(3,5,1,1),
(4,1,2,2),
(4,2,2,3),
(4,3,2,4),
(4,4,2,5),
(4,5,2,1);