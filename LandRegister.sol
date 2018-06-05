/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

pragma solidity 0.4.24;

/// @title GoldenAcre land register Contract
/// @author Jeremias Grenzebach, GoldenAcre B.V.
/// @dev This contract uses the SQM-token contract (ERC777/ERC20)

import { SafeMath } from "github.com/OpenZeppelin/openzeppelin-solidity/contracts/math/SafeMath.sol";

contract LandRegister {
    using SafeMath for uint256;
    
    
    
    /* -- Constructor -- */
    //
    /// @notice Constructor to create SQM
    constructor()
        public
    {
        
    }
}