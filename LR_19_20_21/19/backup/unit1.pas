unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons;

type

  { TForm1 }

  TForm1 = class(TForm)
    ButtonSQR: TButton;
    ButtonZapyt: TButton;
    ButtonCE: TButton;
    ButtonC: TButton;
    ButtonSQRT: TButton;
    ButtonDelit: TButton;
    ButtonUmnozh: TButton;
    ButtonMinus: TButton;
    Button7: TButton;
    ButtonPlus: TButton;
    ButtonDrob: TButton;
    Button8: TButton;
    ButtonBack: TButton;
    Button0: TButton;
    ButtonEqual: TButton;
    Button9: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Edit: TEdit;
    procedure ClearEntryClick(Sender: TObject);
    procedure Clear_LastClick(Sender: TObject);
    procedure ClearClick(Sender: TObject);
    procedure degreeClick(Sender: TObject);
    procedure Divide_One_on_XClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure squareClick(Sender: TObject);
    procedure ClickZnak(Sender: TObject);
    procedure ClickBut(Sender: TObject);
    procedure equalClick(Sender: TObject);
    procedure Zapyt(Sender: TObject);


  private

  public

  end;

var
  Form1: TForm1;
  a, b, c: real;
  znak : string;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Edit1Change(Sender: TObject);
begin

end;

procedure TForm1.Zapyt(Sender: TObject);
var k2:AnsiString;
  k1:int64;
begin
  k2:=Edit.Text;
  k1:= Pos(',',k2);
   if k1 = 0 then
      Edit.Text:=Edit.Text + (Sender as TButton).Caption
   else
    ShowMessage('Введите число');
end;

procedure TForm1.ClickBut(Sender: TObject);
begin
  Edit.Text:=Edit.Text + (Sender as TButton).Caption;
end;


procedure TForm1.Clear_LastClick(Sender: TObject);
var
  str: string;
begin
  str:= Edit.Text;
  if str <> '' then
  delete(str, Length(str),1);
  Edit.Text:=str;
end;


procedure TForm1.equalClick(Sender: TObject);
begin
  if Edit.Text = '' then
     ShowMessage('Ввидите число')
  else
  begin
  b:= strtoFLoat(Edit.Text);
  Edit.Clear;
  case znak of
  '+' : c:= a+b;
  '-' : c:= a-b;
  '*' : c:=a*b;
  '/': if b = 0 then
     showmessage('На ноль делить нельзая')
  else
  c:=a/b;
  end;
  end;

  Edit.Text:= FloatToStr(c);

end;


procedure TForm1.Divide_One_on_XClick(Sender: TObject);
begin
  if Edit.Text = '' then
     ShowMessage('Введите число')
  else
  begin
  a:= strToFloat(Edit.Text);
  if Edit.Text = '0' then
     ShowMessage('На ноль делить нельзя')
  else
  begin
  a:= 1/(a);
  Edit.Text:=FloatToStr(a);
  a:=0;
  end;
  end;
end;


procedure TForm1.ClearEntryClick(Sender: TObject);
begin
  Edit.Clear;
end;

procedure TForm1.ClearClick(Sender: TObject);
begin
  Edit.Clear;
  a:=0;
  b:=0;
  c:=0;
end;



procedure TForm1.degreeClick(Sender: TObject);
begin
  if Edit.Text = '' then
     ShowMessage('Введите числа')
  else
  begin
  a:= strToFloat(Edit.Text);
  if a>0 then
  begin
  a:= sqrt(a);
  Edit.Text:=FloatToStr(a);
  a:=0;
  end
  else
      ShowMessage('Корня из отрицательного числа не существует')
  end;
end;



procedure TForm1.squareClick(Sender: TObject);
begin
  if Edit.Text = '' then
     ShowMessage('Введите числа')
  else
  begin
  a:= strToFloat(Edit.Text);
  a:= sqr(a);
  Edit.Text:=FloatToStr(a);
  a:=0;
  end; ;
end;

procedure TForm1.ClickZnak(Sender: TObject);
begin
   if Edit.Text = '' then
      ShowMessage('Введите число')
   else
   begin
        a:= strToFloat(Edit.Text);
        Edit.clear;
        znak:=(Sender as TButton).Caption;
   end;
end;

end.

