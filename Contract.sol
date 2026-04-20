// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Contract {
	enum Choices { Yes, No }
	
	struct Vote {
		Choices choice;
		address voter;
	}
	
	// TODO: create a public state variable: an array of votes
	Vote[] public votes;

	function createVote(Choices choice) external {
		// TODO: add a new vote to the array of votes state variable
		require(!hasVoted(msg.sender));
		Vote memory vote = Vote(choice,msg.sender);

		votes.push(vote);
	}

	function hasVoted (address  adr) public view returns(bool) {
		for (uint i = 0; i < votes.length; i++) {
			if (votes[i].voter == adr) return true;
		}
		return false;
	}

	function findChoice (address  adr) public view returns(Choices) {
		for (uint i = 0; i < votes.length; i++) {
			if (votes[i].voter == adr) return votes[i].choice;
		}
	}

	function changeVote (Choices choice) external {
		require(hasVoted(msg.sender));

		for (uint i = 0; i < votes.length; i++) {
			if (votes[i].voter == msg.sender) {
				votes[i].choice = choice;
			}
		}
	}
}
