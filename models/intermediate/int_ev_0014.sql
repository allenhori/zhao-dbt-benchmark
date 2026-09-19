select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.m7 + p.m12 as v1,
    p.m7 + p.m12 as v2,
    case when p.m12 > 200 then p.m12 else 0 end as v3,
    coalesce(p.m12, 0) + 13 as v4,
    coalesce(p.m7, 0) + 7 as v5,
    case when p.m7 > 1100 then p.m7 else 0 end as v6,
    case when p.m12 > 700 then p.m12 else 0 end as v7
from {{ ref('stg_ev_02') }} as p
