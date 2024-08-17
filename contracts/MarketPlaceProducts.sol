// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

// Uncomment this line to use console.log
// import "hardhat/console.sol";



contract MarketPlaceProducts{

    string public storeName = "WOO marketplace decentralize";
    uint public count=0;
        //the product details
        struct Product{
            uint id;
            string name;
            string description;
            string image;
            bool sold;
            address payable owner;
            uint price;
            string catagory;

        }

        //the create product
        event CreateProduct(
            string name,
            string description,
            string image,
            bool sold,
            address payable owner,
            uint price,
            string catagory
        );

        //buy product
        event BuyProduct(
                string name,
                
                bool sold,
                address payable owner,
                uint price
                
            );

        //the product list
        mapping (uint=>Product) public storeProducts;

        //the function that will create the product
        function createProduct(string memory name, string memory description, string memory image, uint price, string memory catagory) public{

            //confirm user sent user data

            require(price>0, "the price should be more than 0");
            require(bytes(name).length>3, "the name should be larger than 3");

            require(bytes(description).length>10, "the description should be larger than 10");
            require(bytes(image).length>10, "the image should be larger than 10");
            require(bytes(catagory).length>1, "the catagory should be larger than 1");

            count++;
            //add the product to the map list
            storeProducts[count]=Product(count,name,description,image,false,payable(msg.sender),price, catagory);
            emit CreateProduct(name, description, image, false, payable(msg.sender), price, catagory);
        }

        //create buy product

        function buyProduct(uint _id) public payable{
            Product memory singleProduct = storeProducts[_id];
            address payable seller = singleProduct.owner;
            //validation
            require(!singleProduct.sold, "the product is sold");

            require(seller != msg.sender, "can not buy your product");

            require(msg.value>=singleProduct.price, "the amount you sent dhould equal price");

            //send the money to seller
            payable(seller).transfer(msg.value);
            singleProduct.owner = payable (msg.sender);
            singleProduct.sold = true;

            storeProducts[_id] = singleProduct; 

            emit BuyProduct(singleProduct.name, true, payable (msg.sender), singleProduct.price);
        }
}