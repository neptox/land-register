/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

pragma solidity 0.4.24;

/// @title GoldenAcre land register Contract
/// @author Jeremias Grenzebach, GoldenAcre B.V.
/// @dev This contract uses the SQM-token contract (ERC777/ERC20)

import { GAccounts } from "../SQM-token/GAccounts.sol";

contract LandRegister is GAccounts {
    
    
    //mapping(uint256 => EntryInLandRegister) records;
    EntryInLandRegister[] public records;
    
    struct EntryInLandRegister {
        
        
        // Ein hash über alle untigen Daten als identifier?
        
        uint256 entryID;    //Eindeutiger identifier im Grundbuch
        string cadastreID; //Katasternummer des Grundstücks
        uint256[2] coordinates; // Längen- und Breitengrade: 43.223383, 27.998749   -  (zusätzlich verschiedene Systeme, damit zukunftssicher: OpenStreetMap, what3words)
        
        uint256 sqmOfEntry; //Quadratmeter des Grundstücks
        
        bool ownedByGoldenAcre;// Eigentum von GoldenAcre ja/nein
        string previousOwner; //Verkäufer
        uint256 dateOfPurchase; //Datum des Kaufs/Verkaufs
        string addressOfRegistrationOffice; //Ort des Eintragungsamtes
        string geohash; // Ein (ipfs-)Link zum PDF des Grundbuchauszuges
        
        bool organicFarming; //Ökologisch bewirtschaftet ja/nein
        
        uint256 circulatingSQM;
        
        mapping (string => string) newMetadata;  //Weitere Felder in Zukunft
        // mapping(bytes32 => bytes32) keyvaluestore;
        
    }
    
    
    
    
    /* -- Constructor -- */
    //
    /// @notice Constructor to create SQM
    constructor()
        public
    {
        
    }
    
    
    
    
    
        /**
     * Add Record
     *
     *
     * @param beneficiary who to send the ether to
     * @param weiAmount amount of ether to send, in wei
     * @param jobDescription Description of job
     * @param transactionBytecode bytecode of transaction
     */
    function newProposal(
        address beneficiary,
        uint weiAmount,
        string jobDescription,
        bytes transactionBytecode
    )
        onlyOwner public
        returns (uint proposalID)
    {
        proposalID = proposals.length++;
        Proposal storage p = proposals[proposalID];
        p.recipient = beneficiary;
        p.amount = weiAmount;
        p.description = jobDescription;
        p.proposalHash = keccak256(beneficiary, weiAmount, transactionBytecode);
        p.minExecutionDate = now + debatingPeriodInMinutes * 1 minutes;
        p.executed = false;
        p.proposalPassed = false;
        p.numberOfVotes = 0;
        ProposalAdded(proposalID, beneficiary, weiAmount, jobDescription);
        numProposals = proposalID+1;

        return proposalID;
    }
    
    
    
    
}



