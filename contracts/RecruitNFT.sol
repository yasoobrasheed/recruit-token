// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract RecruitNFT is ERC721 {
    constructor() ERC721("RecruitNFT", "RECRUIT") {}

    uint256 public constant MAX_SUPPLY = 10000;
    string public constant TOKEN_URI = "https://recruitnft.s3.us-east-2.amazonaws.com/assets/recruit.json";
    
    uint256 private tokenIdCounter;
    mapping(uint256 => string) private tokenURIs;
    mapping(address => bool) private hasMintedToken;

    // Function to mint a token if the account hasn't already minted one.
    function mint() public {
        require(tokenIdCounter < MAX_SUPPLY, "All tokens have been minted");
        require(!hasMintedToken[msg.sender], "Account has already minted a token");
        
        _safeMint(msg.sender, tokenIdCounter);
        hasMintedToken[msg.sender] = true;
        _setTokenURI(tokenIdCounter++, TOKEN_URI);
    }

    // Internal function to set the metadata URI for a token ID.
    function _setTokenURI(uint256 _tokenId, string memory _tokenURI) private {
        tokenURIs[_tokenId] = _tokenURI;
    }

    // External function to retrieve the metadata URI for a token ID.
    function tokenURI(uint256 _tokenId) public view override returns (string memory) {
        return tokenURIs[_tokenId];
    }
}