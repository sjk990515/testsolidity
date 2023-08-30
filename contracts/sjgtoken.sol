// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.10;

// 컨트랙트 생성 / 여러개도 가능 / 다른 파일에서 import-상속 사용도 가능
contract first {
    // 가시성
    // public : 컨트랙트 내부/외부 호출 가능
    // private : 컨트랙트 내부만 호출가능
    // internal : 내부&상속 호출 가능
    // external : 외부에서만 호출 가능

    // 상태 가변성 
    // view : 읽기O 수정X 가스X
    // pure : 읽기X 수정X 가스X

    // 변수 저장 공간
    // storage : 영구 저장
    // memeory : 임시 저장

    // 스토리지에만 저장 - 키와 값으로 데이터 저장
    mapping (string => address) private  rememberAddress;

    uint internal Number = 1;

    function addName(string memory _name) public{
        // require 조건이 false인 경우 error
        require(rememberAddress[_name] == address(0), "alreay key");
        // msg.sender = 사용자의 주소
        rememberAddress[_name] = msg.sender;
    }

    function viewName(string memory _name) public view returns(address) {
        require(rememberAddress[_name] != address(0), "Not found");
        return rememberAddress[_name];
    }
}

// 컨트랙트 상속
contract second is first {
    // 구조체 (타입)
    struct User {
        address _address;
        uint _number;
    }

    function plusNumber() public returns(User memory){
        // private함수 호출 후 사용
        User memory userAddress = User(_viewAddress(), Number);
        Number++;
        return userAddress;
    }

    function _viewAddress() private view returns(address) {
        return msg.sender;
    }
}