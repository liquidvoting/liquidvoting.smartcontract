pragma solidity >=0.3.0;
contract Election{
  // This is a type for a single proposal.
    struct Proposal
    {
        bytes32 name;   
        uint voteCount; // number of total votes
    }

    address public curator;
    Proposal[] public proposals
    mapping(address =>byte32) voter; // wallet address mapped to aadhar-id 

    function Election( byte32[] proposalNames){
      curator = msg.sender;
      for(uint i = 0; i < proposalNames.length; i++){
        proposals.push(
              Proposal(
                {
                name: proposalNames[i],
                voteCount: 0
                }
              )
        );
      }

    }

  function addVoter(address  wallet_address, byte32 aadhar_id){
    if (wallet_address == msg.sender){
      voter[wallet_address] = aadhar_id;
    } 
  }
  

}