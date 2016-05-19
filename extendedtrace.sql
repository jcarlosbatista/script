
variable sid      number
variable serial   number
variable maxdump  number

prompt Enter Sid:                 &&sid
prompt Enter Serial#:             &&serial
prompt Enter max_dump_file_size:  &&maxdump

begin
  :sid      := &&sid;
  :serial   := &&serial;
  :maxdump  := &&maxdump;
end;
/

begin
  sys.dbms_system.set_bool_param_in_session(
        :sid, 
        :serial,
        'timed_statistics',
        true
   );


  sys.dbms_system.set_int_param_in_session(
        :sid,
        :serial,
        'max_dump_file_size',
        :maxdump
   );

  
  sys.dbms_system.set_ev(:sid, :serial, 10046, 12, '');

end;
/

prompt Press any key for canceling extended trace

pause

begin
  sys.dbms_system.set_ev(:sid, :serial, 10046, 0, '');
end;
/

prompt trace file generated at user_dump_dest

  

 


 