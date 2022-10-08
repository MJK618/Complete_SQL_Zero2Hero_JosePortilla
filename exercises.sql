SELECT name, membercost FROM cd.facilities;
SELECT * FROM cd.facilities WHERE membercost != 0;
SELECT * FROM cd.facilities WHERE membercost != 0 AND membercost<=facilities.monthlymaintenance/50;
SELECT * FROM cd.facilities WHERE name LIKE '%Tennis%';
SELECT * FROM cd.facilities WHERE facid = 1 OR facid = 5;
SELECT * FROM cd.facilities WHERE facid IN(1,5);
SELECT * FROM cd.members WHERE extract(YEAR FROM joindate) >2011 AND extract(MONTH FROM joindate) >8;
SELECT * FROM cd.members WHERE joindate >= '2012-09-01';
SELECT DISTINCT surname FROM cd.members ORDER BY surname LIMIT 10;
SELECT joindate FROM cd.members ORDER BY joindate DESC LIMIT 1;
SELECT COUNT(*) FROM cd.facilities WHERE guestcost > 10;
SELECT facid, SUM(slots) FROM cd.bookings WHERE starttime >= '2012-09-01' AND starttime <'2012-10-01'
                                        GROUP BY facid ORDER BY SUM(slots);
SELECT facid, SUM(slots) FROM cd.bookings GROUP BY facid HAVING SUM(slots)>1000  ORDER BY facid;
SELECT starttime, name FROM cd.bookings INNER JOIN cd.facilities ON bookings.facid = facilities.facid
                       WHERE (facilities.name LIKE '%Tennis Court%') AND (starttime > '2012-09-21' AND starttime <'2012-09-22') ORDER BY starttime,name;
SELECT starttime FROM cd.bookings INNER JOIN cd.members ON bookings.memid = members.memid
                 WHERE members.firstname='David' AND members.surname='Farrell'
