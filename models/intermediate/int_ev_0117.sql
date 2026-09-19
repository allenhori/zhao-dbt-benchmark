select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    coalesce(p.m7, 0) + 3 as v1,
    p.m9 * 3 as v2,
    round(p.m7 / 11.0, 4) as v3,
    p.m7 + 11 as v4,
    round(p.m7 / 5.0, 4) as v5,
    case when p.m7 > 300 then p.m7 else 0 end as v6,
    round(p.m7 / 11.0, 4) as v7,
    p.m9 - p.m7 as v8
from {{ ref('stg_ev_00') }} as p
