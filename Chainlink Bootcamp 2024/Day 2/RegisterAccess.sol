// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;
 
contract Depolama {
	string[] private mesajlar;
    address public kontratSahibi;
    mapping (address => bool) public izinliListesi;

    constructor(){
        kontratSahibi = msg.sender;
        izinliListesi[msg.sender] = true;
    }

    modifier sadeceIzinliListesi{
        require(izinliListesi[msg.sender]);
        _;
    }

    modifier sadeceSahibi{
        require(kontratSahibi == msg.sender);
        _;
    }

    function izinliAdresEkle(address yeniAdres) public sadeceSahibi{
        izinliListesi[yeniAdres] = true;
    }

    function izinliAdresCikar(address yeniAdres) public sadeceSahibi{
        izinliListesi[yeniAdres] = false;
    }

    function mesajiGoruntule(uint256 index) public view returns(string memory){
        return mesajlar[index];
    }

    function mesajEkle(string memory yeniMesaj) public sadeceIzinliListesi{
        mesajlar.push(yeniMesaj);
    }

    function mesajDegistir(string memory yeniMesaj, uint256 index) public sadeceIzinliListesi{
        mesajlar[index] = yeniMesaj;
    }
}