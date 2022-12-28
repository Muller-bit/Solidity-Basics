// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8; // compile it so that it can update the version 


// EVM => Ethereum Virtual Machine 
// Avalanche,  Fantom , Polygon  => we can deploy our contract to this blockchain to run the test on them 

contract SimpleStorage{
   // data type contains 
   // bool , string , uint , int , byte and  address
   // function - color = orange;
    // public variable - color = blue ;accesability
    uint256  favoriteNumber; // intialized to 0! & it has storage variable by default 
    // to store multiple value like array we use struct to create an object  ex..
    // type , => visibility  , => name  of variable  (declaration rule!)
     
    //uint256[] public myfavoriteNumberList;
    // creating mapping variable (like dictionary helps to slect out easily)


    struct People {
          uint256 favoriteNumber;
          string name ; 
    }
    //array of people , index starts from 0, 1 ,2 3 , 4 .......
      //uint256 [] public favoriteNumberList; dynamic array i.e not static 
      People[] public people;
    
   // create a function with parameter to execute certain codes by calling 
    function store(uint256 myfavoriteNumber) public {
      favoriteNumber = myfavoriteNumber;
      
      //favoriteNumber = favoriteNumber + 1;  
      // the more we solve complex problem the more gas fee required  
    }
     //we can only access the variable inside the {} braces otherwise its private 
     // view  , pure does not cost gas i.e we are simply reading from existing fun , dont modify the chain 

     function retrieve() public view returns(uint256){
         return favoriteNumber; 
         // does not cost gas fee  
     }
     // data storage in solidity 
     // calldata , memory => exist only  temporarly 
     // storage => exist  permanently 
     mapping(string =>  uint256) public nameTofavoriteNumber;
     // initialized as null value when we create mapping 
    function addPerson(string  memory  _name , uint256 myfavoriteNumber)public{
        //people.push(People( _name , myfavoriteNumber));
        //People memory newPerson = People({favoriteNumber: myfavoriteNumber , name: _name});
        // People memory newPerson  = People(myfavoriteNumber , _name);
        // _name = "cat"; => shows that memory can be modified :)
        people.push(People(myfavoriteNumber , _name));  // best way to push and simple 
        // corresponding name with its number value 
        nameTofavoriteNumber[_name] = myfavoriteNumber;
    }
}

