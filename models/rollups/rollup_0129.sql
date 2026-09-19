select
    p0.segment_id as segment_id,
    p1.r1 as r1,
    p1.r2 as r2
from {{ ref('seg_0133') }} as p0
inner join {{ ref('rollup_0092') }} as p1 on p1.segment_id = p0.segment_id
