select
    p0.segment_id as segment_id,
    p0.g1 as r1,
    p0.g3 as r2
from {{ ref('seg_0255') }} as p0
inner join {{ ref('rollup_0033') }} as p1 on p1.segment_id = p0.segment_id
