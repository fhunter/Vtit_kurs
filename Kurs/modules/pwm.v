//Это генератор ШИМ сигнала
//Параметризация: ширина счётчика? сейчас не реализована
//Текущая ширина счётчика - 4 бита.
module pwm(
	clock,//Тактовая частота
	value,//Значение для ШИМ сигнала
	signal//выходной сигнал
);

parameter WIDTH=4;

input clock;
input [(WIDTH-1):0] value;
output signal;

reg [(WIDTH-1):0] pwm_counter;//Счётчик

always @(posedge clock)
begin
	pwm_counter<=pwm_counter+1;
end

assign signal=(pwm_counter>=value);

endmodule
