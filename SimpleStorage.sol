// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract SimpleStorage {
    uint256 private favoriteNumber;
    mapping(string => uint256) public nameToFavoriteNumber;
    
    uint256[] public favoriteNumbers;
    
    struct Person {
        string name;
        uint256 favoriteNumber;
    }
    
    Person[] public people;
    
    enum ContractState {
        Active,
        Inactive
    }
    
    ContractState public state;
    
    event NumberStored(uint256 number);
    event NumberUpdated(uint256 oldNumber, uint256 newNumber);
    event PersonAdded(string name, uint256 favoriteNumber);
    event ContractStateChanged(ContractState newState);
    event FavoriteNumberAdded(uint256 number);
    
    function storeNumber(uint256 _number) public {
        uint256 oldNumber = favoriteNumber;
        favoriteNumber = _number;
        emit NumberStored(_number);
        emit NumberUpdated(oldNumber, _number);
    }
    
    function getFavoriteNumber() public view returns (uint256) {
        return favoriteNumber;
    }
    
    function isGreaterThan(uint256 _number) public view returns (bool) {
        return favoriteNumber > _number;
    }
    
    function sumToFavoriteNumber() public view returns (uint256) {
        uint256 sum = 0;
        for(uint256 i = 1; i <= favoriteNumber; i++) {
            sum += i;
        }
        return sum;
    }
    
    function internalFunction() internal pure returns (string memory) {
        return "This is an internal function";
    }
    
    function callInternalFunction() public pure returns (string memory) {
        return internalFunction();
    }
    
    function externalFunction() external pure returns (string memory) {
        return "This is an external function";
    }
    
    function testExternalFunction() view public returns (string memory) {
        return this.externalFunction();
    }
    
    function addFavoriteNumber(uint256 _number) public {
        favoriteNumbers.push(_number);
        emit FavoriteNumberAdded(_number);
    }
    
    function getFavoriteNumbersLength() public view returns (uint256) {
        return favoriteNumbers.length;
    }
    
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(Person(_name, _favoriteNumber));
        nameToFavoriteNumber[_name] = _favoriteNumber;
        emit PersonAdded(_name, _favoriteNumber);
    }
    
    function getPeopleLength() public view returns (uint256) {
        return people.length;
    }
    
    function activateContract() public {
        state = ContractState.Active;
        emit ContractStateChanged(state);
    }
    
    function deactivateContract() public {
        state = ContractState.Inactive;
        emit ContractStateChanged(state);
    }
    
    function isActive() public view returns (bool) {
        return state == ContractState.Active;
    }
    
    function processCalldata(string calldata _input) public pure returns (string memory) {
        // Process the calldata input without modifying it
        return _input;
    }
    
    function calculateWithMemory() public view returns (uint256) {
        uint256 sum = 0;
        uint256 localFavoriteNumber = favoriteNumber;
        for (uint256 i = 1; i <= localFavoriteNumber; i++) {
            sum += i;
        }
        return sum;
    }
}