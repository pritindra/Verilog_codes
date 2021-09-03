module handle_file;

    integer handle1, handle2, handle3;

    initial 
    begin
        handle1 = $fopen("file1.out"); 
        handle2 = $fopen("file2.out"); 
    end

    integer desc1, desc2;

    initial
    begin
        desc1 = handle1 | 1;
        $fdisplay(desc1, "Display 1");
        desc2 = handle2 | handle1;
        $fdisplay(desc1, "Display 2");

    end
endmodule
