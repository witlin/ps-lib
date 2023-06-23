use Niagara_TS02

declare @tableName varchar (200);
declare @sqlString varchar (500);
declare @tempTbl table (
    ID int identity(1,1) primary key not null,
    TBL_NAME varchar (200) null,
    TIMESTAMP datetime not null,
    TRENDFLAGS int null,
    STATUS int null,
    VALUE float null,
    TRENDFLAGS_TAG varchar (500) null,
    STATUS_TAG varchar (500) null
);
declare tcursor cursor for
  select TABLE_NAME
from INFORMATION_SCHEMA.TABLES
where TABLE_TYPE = 'BASE TABLE'

    and TABLE_CATALOG
= 'Niagara_TS02'
    and TABLE_NAME != 'TCE_DATA_SAMPLES'
order by TABLE_NAME;

open tcursor;
fetch next from tcursor
into @tableName;
while @@FETCH_STATUS = 0
begin
    print @tableName
    -- todo - insert into stale table...
    select @sqlString = 'INSERT INTO TCE_DATA_SAMPLES ' +
					 '(TBL_NAME, TIMESTAMP, TRENDFLAGS, STATUS, VALUE, TRENDFLAGS_TAG, STATUS_TAG)' +
                      'SELECT '''+@tableName+''', TIMESTAMP, TRENDFLAGS, STATUS, VALUE, TRENDFLAGS_TAG, STATUS_TAG FROM  '+@tableName+ ' t ' +
					  'WHERE t.TRENDFLAGS_TAG = ''{hidden}''';
    exec (@sqlString)
    fetch next from tcursor
 into @tableName;
end
close tcursor;
deallocate tcursor;
GO

use Niagara_TS02

SELECT TOP (1000)
    [ID]
      , [TBL_NAME]
      , [TIMESTAMP]
      , [TRENDFLAGS]
      , [STATUS]
      , [VALUE]
      , [TRENDFLAGS_TAG]
      , [STATUS_TAG]
FROM [Niagara_TS02].[dbo].[TCE_DATA_SAMPLES]

GO


--------------------------------------------------------------------------------------------------------

--select TABLE_NAME,TABLE_TYPE, @@ROWCOUNT AS 'ROW COUNT' from INFORMATION_SCHEMA.TABLES

--SELECT TOP (10) [TIMESTAMP]
--      ,[TRENDFLAGS]
--      ,[STATUS]
--      ,[VALUE]
--      ,[TRENDFLAGS_TAG]
--      ,[STATUS_TAG]
--  FROM [TS02_ECYBOTTOM_EF_SPD]
--  WHERE TRENDFLAGS_TAG = '{hidden}'