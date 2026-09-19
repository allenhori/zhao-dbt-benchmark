select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.m7 > 1300 then p.m7 else 0 end as v1,
    coalesce(p.m2, 0) + 5 as v2,
    p.m2 + 13 as v3,
    case when p.m7 > 200 then p.m7 else 0 end as v4,
    p.m7 - p.m2 as v5,
    coalesce(p.m2, 0) + 13 as v6,
    round(p.m2 / 13.0, 4) as v7,
    p.m2 + 13 as v8
from {{ ref('stg_ev_03') }} as p
