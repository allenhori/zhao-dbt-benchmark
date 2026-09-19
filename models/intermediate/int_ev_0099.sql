select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.m11 * 0.5 + p.m12 * 0.5 as v1,
    case when p.m10 > p.m11 then p.m10 else p.m11 end as v2,
    case when p.m11 > 700 then p.m11 else 0 end as v3,
    p.m12 * 5 as v4,
    round(p.m10 / 3.0, 4) as v5,
    p.m12 * 7 as v6,
    p.m12 + 5 as v7
from {{ ref('stg_ev_00') }} as p
