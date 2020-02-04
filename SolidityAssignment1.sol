pragma solidity ^0.5.0;

contract StudentEnrollment {
    address payable private myAddress = 0xaD335c3c503aBd738Af9a7690FB41f9fadcBE91A;
    
    function getBalance() public view returns(uint){
    return myAddress.balance;
}

    enum RegistrationType {
        onsite,
        online
    }

    enum Gender {
        male,
        female
    }

    struct studentsData{
        address studentAddress;
        uint RollNo;
        string name;
        bool degree;
        Gender gender;
        RegistrationType typeOfStudy;
    }

    mapping (address => studentsData) details;
    address[] internal studentsList;

    uint entranceFees = 2 ether;
    
    modifier Fees() {
        require(msg.value == entranceFees);
        _;
    }
    function getStudentData(address _myAddress, uint _rollNo, string memory _name, bool _degree, Gender _gender, RegistrationType _type) public payable Fees {
       details[_myAddress] = studentsData(_myAddress, _rollNo, _name, _degree, _gender, _type); 
    }

    function StudentAddresses(address _studentAddress) public returns(uint) { 
        studentsList.push(_studentAddress) - 1;
    }
    
    function getStudentsList() public view returns(uint) {
        return studentsList.length;
    }
    
    function totalFeesCollected() public view returns(uint) {
        return address(this).balance;
    }
}