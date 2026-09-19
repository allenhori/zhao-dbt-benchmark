select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.m3 - p.m10 as v1,
    p.m3 * 0.5 + p.m8 * 0.5 as v2,
    case when p.m8 > 200 then p.m8 else 0 end as v3,
    round(p.m3 / 7.0, 4) as v4,
    p.m10 - p.m8 as v5,
    p.m3 + 11 as v6,
    round(p.m8 / 7.0, 4) as v7
from {{ ref('stg_ev_07') }} as p
where p.customer_id % 97 <> 0
