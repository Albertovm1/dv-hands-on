class clk_config extends uvm_object;

    `uvm_object_utils(clk_config)

    // periodo do CLK
    time clk_period;

    function new(string name = "clk_config"); 
        super.new(name);
        clk_period = 500ps; //2 GHz
    endfunction

endclass
