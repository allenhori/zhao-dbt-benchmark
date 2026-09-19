select
    p0.segment_id as segment_id,
    p1.r2 * 0.5 + p0.g1 * 0.5 as r1,
    p2.r2 as r2
from {{ ref('seg_0089') }} as p0
inner join {{ ref('rollup_0086') }} as p1 on p1.segment_id = p0.segment_id
inner join {{ ref('rollup_0042') }} as p2 on p2.segment_id = p0.segment_id
