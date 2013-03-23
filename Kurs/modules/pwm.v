//Это генератор ШИМ сигнала
//Параметризация: ширина счётчика? сейчас не реализована
//Текущая ширина счётчика - 4 бита.
module pwm(
	clock,//Тактовая частота
	value,//Значение для ШИМ сигнала
	signal//выходной сигнал
);

reg [3:0] pwm_counter;//Счётчик

always @(posedge clock)
begin
	pwm_counter<=pwm_counter+4'h1;
end

assign signal=(pwm_counter>=value);

endmodule
