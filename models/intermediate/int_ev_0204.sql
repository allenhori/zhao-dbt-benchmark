select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.m12 + 7 as v1,
    p.m5 * 11 as v2,
    case when p.m12 > p.m5 then p.m12 else p.m5 end as v3,
    round(p.m5 / 2.0, 4) as v4,
    round(p.m12 / 11.0, 4) as v5,
    coalesce(p.m5, 0) + 5 as v6
from {{ ref('stg_ev_04') }} as p
