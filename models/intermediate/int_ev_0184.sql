select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    round(p.m3 / 3.0, 4) as v1,
    p.m5 + 11 as v2,
    p.m5 + 11 as v3,
    case when p.m5 > 1100 then p.m5 else 0 end as v4,
    round(p.m5 / 7.0, 4) as v5,
    p.m5 + 13 as v6
from {{ ref('stg_ev_02') }} as p
