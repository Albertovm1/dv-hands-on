class rst_config extends uvm_object;

    `uvm_object_utils(rst_config)

    // periodo do reset
    time rst_duration;

    function new(string name = "rst_config"); 
        super.new(name);
        rst_duration = 1000ps; //1 GHz
    endfunction

endclass