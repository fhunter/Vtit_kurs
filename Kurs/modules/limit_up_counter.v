//Счётчик вверх с ограничением
//Параметризация - ширина и ограничение
module limit_up_counter(
	clock, //Тактовый сигнал
	reset, //Сигнал сброса, асинхронный
	preset,//Предустановка, синхронная
	data,  //Данные для предустановки
	q      //Выходные данные	
);

parameter WIDTH=4; //Разрядность счётчика
parameter LIMIT=10;//Верхняя граница для счёта

input clock;
input reset;
input preset;
input [(WIDTH-1):0] data;
output [(WIDTH-1):0] q;
reg [(WIDTH-1):0] q;

initial
begin
q<=0;
end

always @(posedge clock)
begin
	if(preset)
	begin
		q<=data;
	end else begin
		if(q<LIMIT)
		begin
			q<=q+1;
		end else begin
			q<=0;
		end
	end
end

endmodule
