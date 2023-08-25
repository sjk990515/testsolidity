// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.10;

contract first {
    mapping(string => address) private aaa;

    function addNumber(string memory _name) public{
        //0주소가 아닌 경우 즉 이미 존재하는 경우 오류
        require(aaa[_name] == address(0), "alreay key");
        aaa[_name] = msg.sender;
    }

    function viewNumber(string memory _name) public view returns(address) {
        // 0주소인 경우 없다고 함
        require(aaa[_name] != address(0), "Not found");
        return aaa[_name];
    }

}

contract second {
    uint bbb = 1;

    function plusNumber() public returns(uint){
        bbb++;
        return bbb;
    }
    function vvvvvv() public view returns(uint){
        return bbb;
    }

    function viewAddress() public view returns(address) {
        address add = msg.sender;
        return add;
    }
}
