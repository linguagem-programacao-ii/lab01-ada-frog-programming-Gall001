with
    Ada.Strings.Fixed,
    Ada.Text_IO,
    Ada.Integer_Text_IO;
use
    Ada.Strings.Fixed,
    Ada.Text_IO,
    Ada.Integer_Text_IO;

procedure frog is
    pipe : Integer;
    jump : Integer;
    height : Integer;
    NumPipes : Integer;
    buffer : String(1..1000) := (others => ' ');
    Sep : String := " ";
    last : Natural;
    splitId : Integer;

    procedure Split(Source : in String; Pos: in Integer; Value : out Integer; Remainder: out String) is
        Tmp : String(1..Source'Last);
    begin
        if Pos = Source'Last then Move(Source, Tmp);
        else Move(Source(Source'First .. Pos-1), Tmp); 
            Move(Source(Pos+1 .. Source'Last), Remainder);
        end if;
        Value := Integer'Value(Tmp);
    end Split;
begin
    Get_Line(Item => buffer, Last => last);
    splitId := Index(Source => buffer, Pattern => Sep, From => 1);
    Split(Source => buffer, Pos => splitId, Value => height, Remainder => buffer);
    Split(Source => buffer, Pos => buffer'Last, Value => NumPipes, Remainder => buffer);
    Get_Line(Item => buffer, Last => last);
    for I in 1 .. NumPipes loop
        splitId := Index(Source => buffer, Pattern => Sep, From => 1);
        Split(Source => buffer, Pos => splitId, Value => jump, Remainder => buffer);
        if I /= 1 and abs(jump - pipe) > height then
            Put_Line("GAME OVER");
            exit;
        end if;
        pipe := jump;
        if I = NumPipes then
            Put_Line("YOU WIN");
        end if;
    end loop;
end frog;