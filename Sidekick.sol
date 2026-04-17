// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Sidekick {
    function makeContact(address hero) external {
        // TODO: trigger the hero's fallback function!
        // calldata의 identifier값을 아무거나 집어넣어서 fallback 일으키기
        hero.call('13123');
    }
}
