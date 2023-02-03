pragma solidity >= 0 .5.0 < 0.9.0;
contract todo
{
    struct Note
    {
        uint id;
        string  description;
        bool finished;
    }
    mapping(uint=>Note)notes;
    
      event taskAll(uint id, string description, bool finished);
    function createnote(uint id,string memory description) external
    {
        notes[id] = Note(id,description,false);
        emit taskAll(id,description,false);
    }
    function viewtask(uint id) external returns(Note memory){
        return notes[id];
       
    }
    function completed(uint tid) external{
       
          Note storage _event=  notes[tid];
        _event.finished=true;
        emit taskAll({id:tid,description:"",finished:true}) ; 
    }
}