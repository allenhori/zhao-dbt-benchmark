select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v2 > 1100 then p.v2 else 0 end as v1,
    p.v3 - p.v2 as v2,
    p.v2 - p.v3 as v3,
    round(p.v3 / 7.0, 4) as v4,
    round(p.v2 / 11.0, 4) as v5,
    p.v2 - p.v3 as v6,
    p.v2 + 2 as v7,
    coalesce(p.v3, 0) + 3 as v8
from {{ ref('int_ev_0125') }} as p
where p.customer_id % 97 <> 0
