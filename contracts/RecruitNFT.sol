// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract RecruitNFT is ERC721URIStorage {
    uint256 private _tokenIdCounter;

    constructor() ERC721("RecruitNFT", "RECRUIT") {}

    function mintNFT(address receiver)
        public
    {
        _safeMint(receiver, _tokenIdCounter++);
    }
}