select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    coalesce(p.v3, 0) + 13 as v1,
    coalesce(p.v3, 0) + 2 as v2,
    round(p.v3 / 3.0, 4) as v3,
    case when p.v4 > 1100 then p.v4 else 0 end as v4,
    coalesce(p.v4, 0) + 7 as v5,
    case when p.v4 > 500 then p.v4 else 0 end as v6,
    p.v3 + p.v4 as v7
from {{ ref('int_ev_0036') }} as p
where p.customer_id % 97 <> 0
