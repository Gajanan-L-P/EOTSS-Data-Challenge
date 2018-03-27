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
