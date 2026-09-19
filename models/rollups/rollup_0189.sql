select
    p0.segment_id as segment_id,
    p1.r2 as r1,
    p0.g2 as r2
from {{ ref('seg_0254') }} as p0
inner join {{ ref('rollup_0094') }} as p1 on p1.segment_id = p0.segment_id
