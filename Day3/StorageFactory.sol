pragma solidity >=0.6.0 <0.9.0;

import "./SimpleStorage.sol";

contract StorageFactory {

    SimpleStorage[] public simpleStorageArray;

    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).store(_simpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256) {
        return SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).retrieve();
    }

    function sfaddPerson(uint256 _simpleStorageIndex, string memory _name, uint256 _favoriteNumber) public {
        SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).addPerson(_name, _favoriteNumber);
    }

    function sfgetMapOutput(uint256 _simpleStorageIndex, string memory _name) public view returns (uint256) {
        return SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).nameToFavoriteNumber(_name);
    }
}