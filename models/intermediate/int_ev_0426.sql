select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    round(p.m12 / 2.0, 4) as v1,
    p.m12 + p.m3 as v2,
    case when p.m9 > 300 then p.m9 else 0 end as v3,
    p.m12 * 0.5 + p.m3 * 0.5 as v4,
    case when p.m12 > 500 then p.m12 else 0 end as v5,
    coalesce(p.m9, 0) + 2 as v6
from {{ ref('stg_ev_03') }} as p
