create table eotssChallenge.ga_session_views
(
    session_id text, -- id associated with a particular session (see here for more information https://support.google.com/analytics/answer/2731565?hl=en)
    hit_timestamp timestamp, -- time (to the minute level) when a user hit a page
    node_id integer, -- id of page that was hit
    pageviews integer -- number of times the user hit a page
);

create table eotssChallenge.ga_session_features
(
    session_id text, -- unique session identifier, matches with session_id from ga_session_views, primary key
    medium text, -- way the user came to the site including: organic, direct, referral
    device_category text, -- type of device the user used options are: mobile, desktop, tablet
    browser text -- type of browser user used:
)

-- created some data so that I can check if my queries work correctly
insert into eotssChallenge.ga_session_views values
(3241, '2018-03-21 12:05', 5, 3),
(3241, '2018-03-21 12:07', 100, 4),
(3241, '2018-03-21 12:20', 20, 5),
(4355, '2012-09-17 12:50', 12, 1),
(4355, '2012-09-17 13:00', 132, 5),
(4355, '2012-09-17 13:10', 4, 9),
(1234, '2012-09-16 16:20', 45, 10),
(2236, '2018-03-22 11:00', 128, 8),
(2236, '2018-03-22 11:12', 323, 20),
(2236, '2018-03-22 11:13', 128, 5),
(2236, '2018-03-22 11:24', 323, 1),
(2002, '2018-03-17 10:00', 45, 12),
(2002, '2018-03-17 10:01', 45, 1),
(2002, '2018-03-17 10:20', 45, 3),
(2002, '2018-03-17 10:40', 45, 22),
(2005, '2018-03-17 10:50', 45, 21),
(2005, '2018-03-17 10:55', 45, 2),
(2005, '2018-03-17 10:56', 45, 5),
(2005, '2018-03-17 10:59', 45, 3);

insert into eotssChallenge.ga_session_features values
(3241, 'organic', 'mobile', 'Safari'),
(3242, 'direct', 'tablet', 'Mozilla'),
(3243, 'organic', 'mobile', 'Chrome'),
(4355, 'referral', 'desktop', 'Chrome'),
(4356, 'organic', 'mobile', 'Edge'),
(4357, 'direct', 'tablet', 'Safari'),
(1234, 'organic', 'mobile', 'Chrome'),
(2236, 'direct', 'tablet', 'Chrome'),
(2237, 'organic', 'desktop', 'Safari'),
(2002, 'direct', 'desktop', 'Edge'),
(2005, 'direct', 'mobile', 'Safari');

-- Query 1
-- total pageviews in last 7 days
select sum(pageviews)
from ga_session_views
where hit_timestamp > DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 7 day);

-- Query 2
-- all sessions with organic medium
select count(session_id)
from ga_session_features
where medium = 'organic';

-- Query 3
-- nodes and their pageviews with organic medium in the last 30 days
select node_id, sum(pageviews)
from ga_session_views views
inner join ga_session_features features
  on features.session_id = views.session_id
where medium = 'organic' and hit_timestamp > DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 30 day)
group by node_id
order by pageviews desc;

-- Query 4
-- This query calculates each session's duration in minutes and then averages the duration by category
select device_category, avg(t1.sessionLen) as avgSessionLength
from ga_session_features features
inner join
  (
  -- calculate the duration of each session
  select session_id, timestampdiff(minute, min(hit_timestamp), max(hit_timestamp)) as sessionLen
  from ga_session_views
  group by session_id
  ) t1
    on features.session_id = t1.session_id
group by device_category;
