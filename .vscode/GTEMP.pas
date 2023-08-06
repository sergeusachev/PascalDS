program ExamplePointerOnPointer;

procedure RemoveNegativesNumbers(var first: LongItemPtr);
var
    tmp: LongItemPtr;
    pp: ^LongItemPtr;
begin
    pp := @first;
    while pp^ <> nil do
    begin
        if pp^^.data < 0 then
            begin
                tmp := pp^;
                pp^ := pp^^.next;
                dispose(tmp);
            end
        else
            pp := @(pp^^.next);
    end
end;

var
    first, last: LongItemPtr;
    n: longint;
begin
    InitList(first, last);
    while not eof do
    begin
        readln(n);
        AddToList(first, last, n);
    end;

    PrintList(first);
    RemoveNegativeNumbers(first);
    PrintList(first);
end.