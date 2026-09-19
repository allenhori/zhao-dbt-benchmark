select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    round(p.m1 / 11.0, 4) as v1,
    case when p.m11 > 1300 then p.m11 else 0 end as v2,
    p.m9 + 2 as v3,
    coalesce(p.m9, 0) + 11 as v4,
    case when p.m9 > 500 then p.m9 else 0 end as v5,
    p.m1 + p.m9 as v6
from {{ ref('stg_ev_02') }} as p
where p.customer_id % 97 <> 0
