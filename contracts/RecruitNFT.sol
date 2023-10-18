// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract RecruitNFT is ERC721Enumerable {
    uint256 private _tokenIdCounter;

    // Max supply of the NFTs
    uint256 public constant MAX_SUPPLY = 300000;

    // Base URI for your images
    string private _currentBaseTokenURI = "https://static.alchemyapi.io/assets/accountkit/";

    mapping(address => uint256) private _mintedCount;

    constructor() ERC721("RecruitNFT", "RECRUIT") {}

    function mint(address recipient) public {
        // Ensure all tokens haven't been minted yet
        require(_tokenIdCounter < MAX_SUPPLY, "All tokens have been minted");
        
        // Ensure the recipient hasn't minted more than one token
        require(_mintedCount[recipient] < 1, "Each address can only mint one token");

        _safeMint(recipient, _tokenIdCounter++);
        
        // Update the mint count for the recipient
        _mintedCount[recipient]++;
    }

    function _baseURI() internal view override returns (string memory) {
        return _currentBaseTokenURI;
    }

    function tokenURI() public view returns (string memory) {
        return string(abi.encodePacked(_currentBaseTokenURI, "demo_metadata.json"));
    }

    function burn(uint256 tokenId) public virtual {
        _burn(tokenId);
    }

    function transfer(address to, uint256 tokenId) public {
        require(ownerOf(tokenId) == msg.sender, "Only the owner can transfer the token");
        safeTransferFrom(msg.sender, to, tokenId);
    }
}