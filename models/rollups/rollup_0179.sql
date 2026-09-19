select
    p0.segment_id as segment_id,
    p0.r1 - p1.r2 as r1,
    p0.r1 as r2
from {{ ref('rollup_0003') }} as p0
inner join {{ ref('rollup_0122') }} as p1 on p1.segment_id = p0.segment_id
