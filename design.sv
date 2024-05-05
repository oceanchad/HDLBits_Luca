// Code your design here
class packet;
  rand bit[7:0] data;
  constraint cstr1 {
    data inside {[0:31]};
  }
endclass

class user_packet extends packet;
  constraint cstr1 {
    data inside {[31:63]};
  }
endclass

class Transaction;
  rand bit [31:0] addr, data;
  constraint c1 {
    soft addr inside
    {[0:100], [1000:2000]};
  }
endclass