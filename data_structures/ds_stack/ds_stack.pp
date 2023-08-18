unit ds_stack;

interface
type
    LongItemPtr = ^LongItem;
    LongItem = record
        data: longint;
        next: LongItemPtr;
    end;
    StackOfLongints = LongItemPtr;

procedure SOLInit(var stack: StackOfLongints);
procedure SOLPush(var stack: StackOfLongints; n: longint);
function SOLPop(var stack: StackOfLongints; var n: longint): boolean;
function SOLIsEmpty(var stack: StackOfLongints): boolean;

implementation
procedure SOLInit(var stack: StackOfLongints);
begin
    stack := nil;
end;

procedure SOLPush(var stack: StackOfLongints; n: longint);
var
    tmp: LongItemPtr;
begin
    new(tmp);
    tmp^.data := n;
    tmp^.next := stack;
    stack := tmp;
end;

function SOLPop(var stack: StackOfLongints; var n: longint): boolean;
var
    tmp: LongItemPtr;
begin
    if stack = nil then
    begin
        SOLPop := false;
        exit;
    end;
    n := stack^.data;
    tmp := stack;
    stack := stack^.next;
    dispose(tmp);
    SOLPop := true;
end;

function SOLIsEmpty(var stack: StackOfLongints): boolean;
begin
    SOLIsEmpty := stack = nil;
end; 

end. //end of the module
