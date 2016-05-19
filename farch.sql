SELECT  to_char(first_time, 'mm/dd') "Date",
        to_char(first_time, 'Dy') "Day",
        count(1) "Total",
        decode(to_char(SUM(decode(to_char(first_time, 'hh24'),'00',1,0)),'999'),'   0','   ',to_char(SUM(decode(to_char(first_time, 'hh24'),'00',1,0)),'999')) "00",
        decode(to_char(SUM(decode(to_char(first_time, 'hh24'),'01',1,0)),'999'),'   0','   ',to_char(SUM(decode(to_char(first_time, 'hh24'),'01',1,0)),'999')) "01",
        decode(to_char(SUM(decode(to_char(first_time, 'hh24'),'02',1,0)),'999'),'   0','   ',to_char(SUM(decode(to_char(first_time, 'hh24'),'02',1,0)),'999')) "02",
        decode(to_char(SUM(decode(to_char(first_time, 'hh24'),'03',1,0)),'999'),'   0','   ',to_char(SUM(decode(to_char(first_time, 'hh24'),'03',1,0)),'999')) "03",
        decode(to_char(SUM(decode(to_char(first_time, 'hh24'),'04',1,0)),'999'),'   0','   ',to_char(SUM(decode(to_char(first_time, 'hh24'),'04',1,0)),'999')) "04",
        decode(to_char(SUM(decode(to_char(first_time, 'hh24'),'05',1,0)),'999'),'   0','   ',to_char(SUM(decode(to_char(first_time, 'hh24'),'05',1,0)),'999')) "05",
        decode(to_char(SUM(decode(to_char(first_time, 'hh24'),'06',1,0)),'999'),'   0','   ',to_char(SUM(decode(to_char(first_time, 'hh24'),'06',1,0)),'999')) "06",
        decode(to_char(SUM(decode(to_char(first_time, 'hh24'),'07',1,0)),'999'),'   0','   ',to_char(SUM(decode(to_char(first_time, 'hh24'),'07',1,0)),'999')) "07",
        decode(to_char(SUM(decode(to_char(first_time, 'hh24'),'08',1,0)),'999'),'   0','   ',to_char(SUM(decode(to_char(first_time, 'hh24'),'08',1,0)),'999')) "08",
        decode(to_char(SUM(decode(to_char(first_time, 'hh24'),'09',1,0)),'999'),'   0','   ',to_char(SUM(decode(to_char(first_time, 'hh24'),'09',1,0)),'999')) "09",
        decode(to_char(SUM(decode(to_char(first_time, 'hh24'),'10',1,0)),'999'),'   0','   ',to_char(SUM(decode(to_char(first_time, 'hh24'),'10',1,0)),'999')) "10",
        decode(to_char(SUM(decode(to_char(first_time, 'hh24'),'11',1,0)),'999'),'   0','   ',to_char(SUM(decode(to_char(first_time, 'hh24'),'11',1,0)),'999')) "11",
        decode(to_char(SUM(decode(to_char(first_time, 'hh24'),'12',1,0)),'999'),'   0','   ',to_char(SUM(decode(to_char(first_time, 'hh24'),'12',1,0)),'999')) "12",
        decode(to_char(SUM(decode(to_char(first_time, 'hh24'),'13',1,0)),'999'),'   0','   ',to_char(SUM(decode(to_char(first_time, 'hh24'),'13',1,0)),'999')) "13",
        decode(to_char(SUM(decode(to_char(first_time, 'hh24'),'14',1,0)),'999'),'   0','   ',to_char(SUM(decode(to_char(first_time, 'hh24'),'14',1,0)),'999')) "14",
        decode(to_char(SUM(decode(to_char(first_time, 'hh24'),'15',1,0)),'999'),'   0','   ',to_char(SUM(decode(to_char(first_time, 'hh24'),'15',1,0)),'999')) "15",
        decode(to_char(SUM(decode(to_char(first_time, 'hh24'),'16',1,0)),'999'),'   0','   ',to_char(SUM(decode(to_char(first_time, 'hh24'),'16',1,0)),'999')) "16",
        decode(to_char(SUM(decode(to_char(first_time, 'hh24'),'17',1,0)),'999'),'   0','   ',to_char(SUM(decode(to_char(first_time, 'hh24'),'17',1,0)),'999')) "17",
        decode(to_char(SUM(decode(to_char(first_time, 'hh24'),'18',1,0)),'999'),'   0','   ',to_char(SUM(decode(to_char(first_time, 'hh24'),'18',1,0)),'999')) "18",
        decode(to_char(SUM(decode(to_char(first_time, 'hh24'),'19',1,0)),'999'),'   0','   ',to_char(SUM(decode(to_char(first_time, 'hh24'),'19',1,0)),'999')) "19",
        decode(to_char(SUM(decode(to_char(first_time, 'hh24'),'20',1,0)),'999'),'   0','   ',to_char(SUM(decode(to_char(first_time, 'hh24'),'20',1,0)),'999')) "20",
        decode(to_char(SUM(decode(to_char(first_time, 'hh24'),'21',1,0)),'999'),'   0','   ',to_char(SUM(decode(to_char(first_time, 'hh24'),'21',1,0)),'999')) "21",
        decode(to_char(SUM(decode(to_char(first_time, 'hh24'),'22',1,0)),'999'),'   0','   ',to_char(SUM(decode(to_char(first_time, 'hh24'),'22',1,0)),'999')) "22",
        decode(to_char(SUM(decode(to_char(first_time, 'hh24'),'23',1,0)),'999'),'   0','   ',to_char(SUM(decode(to_char(first_time, 'hh24'),'23',1,0)),'999')) "23"
FROM    V$log_history
group by to_char(first_time, 'mm/dd'), to_char(first_time, 'Dy')
order by 1 desc;
