// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract HelloWorld {
    int internal x = 3; //it is always the default setting : can only be access by the contract HelloWorld (and any derived contracts (from HelloWorld base))
                         //can't call it when deployed /// internal <=> protected
    int public y = 9; //can be called when deploying the contract
    int private z = 12; //allows only the "current" contract to "view"/access this variable 

    
    function f() public view returns(int){
        return x; 
    }       //possible because internal 

    function g() private returns(uint){        //this function cannot be called when deployed
        return 1;
    }
    //Error : "Relevant source part starts here and spans across multiple lines"
    //That simply means, that if you set the function state to view, it "knows" 
    //that the function only reads from the blockchain and won't change any variables. 
    //Nothing has to be changed and as result the gas fee will be a bit lower.


    function h() public view returns(int){      //the "view" is important else result can't be seen when deployed
        return x + y; 
    }

    function m() external view returns (int){   //can't be called from within the contract (or from other contracts)
        return x - y;                           //if data passed to this function is external, then more efficient 
                                                //to use this over a public function 
    }

    function add() public {
        h();
    }

    // function sub() public {
    //     m(); //m() is not visiable !! 
    // }

    function n() public returns (uint, uint, uint){
        return (1,1,1); //returning multiple values
    }


    uint a = 1;
    //view function : does not modify any state of the contract // can't put a += 1 as ∆ state;
    function aa() public view returns (uint){
        // a +=1 ; 
        bb();
        return a; 
    }

    function bb() public view {
        a + 1; //not actually modifying the state !!
        // a = 2; //modifies the state
    }

    function p() public pure { //function that does not rely on any contract state to execute (pure calculations)
                               //pure function can call other pure functions and uses types like structs and enums
        // a + 1; //can't do that because pure
    }

}

/*VIEW AND PURE CANNOT DO THE FOLLOWING : 
• Modify / Override state vars
• Create new contracts
• Invoke a function that is diff from them --> pure cant call non pure // view cant call non view
    EXCEPT : view function can call pure // pure cant call view
• Cannot omit events
• Cannot use the function self-destruct 
• Cannot use low level function calls
• Cannot send or receive ethereum 


NOTE on private variable: is the data hidden on the blockchain ? 
• FALSE : cannot be accessed by outside the CONTRACT but can still be found and read on the blockchain. 
*/