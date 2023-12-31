unit ds_queue;

interface
type
    LongItemPtr = ^LongItem;
    LongItem = record
        data: longint;
        next: LongItemPtr;
    end;
    QueueOfLongints = record
        first, last: LongItemPtr;
    end;

procedure QOLInit(var queue: QueueOfLongints);
procedure QOLPut(var queue: QueueOfLongints; n: longint);
function QOLGet(var queue: QueueOfLongints; var n: longint): boolean;
function QOLIsEmpty(var queue: QueueOfLongints): boolean;

implementation
procedure QOLInit(var queue: QueueOfLongints);
begin
    queue.first := nil;
    queue.last := nil;
end;

procedure QOLPut(var queue: QueueOfLongints; n: longint);
begin
    if queue.first = nil then
        begin
            new(queue.first);
            queue.last := queue.first
        end 
    else
        begin
            new(queue.last^.next);
            queue.last := queue.last^.next;
        end;
    queue.last^.data := n;
    queue.last^.next := nil;
end;

function QOLGet(var queue: QueueOfLongints; var n: longint): boolean;
var
    tmp: LongItemPtr;    
begin
    if queue.first = nil then
    begin
        QOLGet := false;
        exit;
    end;
    n := queue.first^.data;
    tmp := queue.first;
    queue.first := queue.first^.next;
    if queue.first = nil then
        queue.last := nil;
    dispose(tmp);
    QOLGet := true;
end;

function QOLIsEmpty(var queue: QueueOfLongints): boolean;
begin
    QOLIsEmpty := queue.first = nil;
end;

end. //end of the module